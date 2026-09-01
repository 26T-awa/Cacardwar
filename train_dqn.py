#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
DQN 训练脚本（适配新数据格式）
- 输入维度：81（展平后的 before/after）
- 隐藏层：64
- 输出维度：181（动作空间）
- 读取 experience.jsonl（每行含 action, reward, done, before, after）
- 自动展平 before 和 after 为 81 维向量
- 导出量化权重（×10000）供 MC 数据包使用
"""

import argparse
import json
import os
import sys
from collections.abc import Iterable

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim

# ---------- 固定参数 ----------
STATE_DIM = 81
HIDDEN_DIM = 64
ACTION_DIM = 181
SCALE = 10000  # 量化系数


# ---------- 展平工具 ----------
def flatten_nested(obj):
    """
    递归展平嵌套的 list/tuple，返回一维 list（浮点数）。
    顺序：深度优先，从左到右。
    示例：[[2,2], [1.0,0.4]] -> [2,2,1.0,0.4]
    """
    result = []
    if isinstance(obj, (list, tuple)):
        for item in obj:
            result.extend(flatten_nested(item))
    else:
        # 基本类型：int, float, bool
        result.append(float(obj))
    return result


# ---------- 网络定义 ----------
class DQN(nn.Module):
    def __init__(self, state_dim=STATE_DIM, hidden_dim=HIDDEN_DIM, action_dim=ACTION_DIM):
        super().__init__()
        self.fc1 = nn.Linear(state_dim, hidden_dim)
        self.fc2 = nn.Linear(hidden_dim, action_dim)

    def forward(self, x):
        x = torch.relu(self.fc1(x))
        return self.fc2(x)


# ---------- 数据加载 ----------
def load_experience(path):
    """读取 jsonl，展平 before/after，过滤无效 action。"""
    if not os.path.exists(path):
        print(f"[!] 找不到数据文件: {path}")
        sys.exit(1)

    samples = []
    with open(path, encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            line = line.strip()
            if not line:
                continue
            try:
                entry = json.loads(line)
            except json.JSONDecodeError as e:
                print(f"[warn] 第 {line_num} 行 JSON 解析失败: {e}")
                continue

            # 检查必要字段
            if "action" not in entry or "reward" not in entry or "done" not in entry:
                print(f"[warn] 第 {line_num} 行缺少 action/reward/done，跳过")
                continue
            if "before" not in entry or "after" not in entry:
                print(f"[warn] 第 {line_num} 行缺少 before/after，跳过")
                continue

            action = int(entry["action"])
            if not (0 <= action < ACTION_DIM):
                print(f"[warn] 第 {line_num} 行 action={action} 超出范围 [0,{ACTION_DIM-1}]，跳过")
                continue

            # 展平 before 和 after
            state_flat = flatten_nested(entry["before"])
            next_state_flat = flatten_nested(entry["after"])

            # 检查维度
            if len(state_flat) != STATE_DIM:
                print(f"[warn] 第 {line_num} 行 before 展平后维度 {len(state_flat)}，期望 {STATE_DIM}，跳过")
                continue
            if len(next_state_flat) != STATE_DIM:
                print(f"[warn] 第 {line_num} 行 after 展平后维度 {len(next_state_flat)}，期望 {STATE_DIM}，跳过")
                continue

            samples.append({
                "state": state_flat,
                "action": action,
                "reward": float(entry["reward"]),
                "next_state": next_state_flat,
                "done": bool(entry.get("done", False))
            })

    if not samples:
        print("[!] 没有有效样本，无法训练")
        sys.exit(1)

    print(f"加载样本: {len(samples)} 条（状态维度 {STATE_DIM}）")
    return samples


def build_tensors(samples, device):
    """将样本列表转为 PyTorch 张量。"""
    states = torch.tensor([s["state"] for s in samples], dtype=torch.float32, device=device)
    actions = torch.tensor([s["action"] for s in samples], dtype=torch.long, device=device)
    rewards = torch.tensor([s["reward"] for s in samples], dtype=torch.float32, device=device)
    next_states = torch.tensor([s["next_state"] for s in samples], dtype=torch.float32, device=device)
    dones = torch.tensor([1.0 if s["done"] else 0.0 for s in samples], dtype=torch.float32, device=device)
    return states, actions, rewards, next_states, dones


# ---------- 导出工具 ----------
def export_json(path, arr):
    """导出 numpy 数组为 JSON（量化 ×SCALE 取整）。"""
    q = np.round(arr * SCALE).astype(np.int32)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(q.tolist(), f, ensure_ascii=False)
    print(f"[OK] {path}  形状 {q.shape}")


# ---------- 主训练流程 ----------
def main():
    parser = argparse.ArgumentParser(description="训练 DQN 并导出量化权重")
    parser.add_argument("--data", default="experience.jsonl", help="输入数据文件（jsonl）")
    parser.add_argument("--out-dir", default=".", help="输出目录")
    parser.add_argument("--epochs", type=int, default=200, help="训练轮数")
    parser.add_argument("--batch-size", type=int, default=32, help="批大小")
    parser.add_argument("--gamma", type=float, default=0.99, help="折扣因子")
    parser.add_argument("--lr", type=float, default=1e-3, help="学习率")
    parser.add_argument("--target-update", type=int, default=100, help="目标网络更新步数间隔")
    parser.add_argument("--seed", type=int, default=42, help="随机种子")
    args = parser.parse_args()

    # 设置随机种子
    torch.manual_seed(args.seed)
    np.random.seed(args.seed)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"设备: {device}")

    # 加载数据
    samples = load_experience(args.data)
    n = len(samples)
    states, actions, rewards, next_states, dones = build_tensors(samples, device)

    # 批大小不能超过样本数
    bs = min(args.batch_size, n)
    steps_per_epoch = max(1, (n + bs - 1) // bs)

    # 初始化网络
    online = DQN().to(device)
    target = DQN().to(device)
    target.load_state_dict(online.state_dict())
    target.eval()

    optimizer = optim.Adam(online.parameters(), lr=args.lr)
    criterion = nn.MSELoss()

    step = 0
    print("开始训练...")
    for epoch in range(args.epochs):
        epoch_loss = 0.0
        for _ in range(steps_per_epoch):
            idx = torch.randint(0, n, (bs,))
            s = states[idx]
            a = actions[idx]
            r = rewards[idx]
            ns = next_states[idx]
            d = dones[idx]

            q = online(s).gather(1, a.unsqueeze(1)).squeeze(1)
            with torch.no_grad():
                max_next_q = target(ns).max(dim=1).values
                target_q = r + args.gamma * max_next_q * (1.0 - d)

            loss = criterion(q, target_q)
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            epoch_loss += loss.item()

            step += 1
            if step % args.target_update == 0:
                target.load_state_dict(online.state_dict())

        if (epoch + 1) % max(1, args.epochs // 10) == 0 or epoch == 0:
            print(f"Epoch {epoch+1}/{args.epochs}  loss={epoch_loss / steps_per_epoch:.4f}")

    # 导出权重（转置后 ×SCALE）
    os.makedirs(args.out_dir, exist_ok=True)
    export_json(os.path.join(args.out_dir, "model/fc1_weight.json"),
                online.fc1.weight.detach().cpu().numpy().T)   # (81,64)
    export_json(os.path.join(args.out_dir, "model/fc1_bias.json"),
                online.fc1.bias.detach().cpu().numpy())       # (64,)
    export_json(os.path.join(args.out_dir, "model/fc2_weight.json"),
                online.fc2.weight.detach().cpu().numpy().T)   # (64,181)
    export_json(os.path.join(args.out_dir, "model/fc2_bias.json"),
                online.fc2.bias.detach().cpu().numpy())       # (181,)

    print("训练完成，权重已导出。")


if __name__ == "__main__":
    main()