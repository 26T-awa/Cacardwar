#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
从 experience.jsonl 训练 DQN（双层全连接网络），并把权重导出为 MC 数据包可用的定点整数 JSON。

网络结构：
  输入层  42
  隐藏层  64（ReLU）
  输出层  351（无激活，直接输出 Q 值）

训练配置（默认值）：
  MSELoss + Adam(lr=1e-3)，目标网络每 --target-update（默认 100）个训练步同步一次。

导出（所有权重/偏置 ×10000 四舍五入取整为 int32，嵌套列表，可直接用于
      data modify storage ... set value ... 命令）：
  fc1_weight.json  42×64   （对应 MC 中 weight1 的 42×64 布局）
  fc1_bias.json    64
  fc2_weight.json  64×351  （对应 MC 中 weight2 的 64×351 布局）
  fc2_bias.json    351

注意：PyTorch 的 Linear 权重形状是 (out, in)，这里导出前做了转置，保证
      fc1_weight 行数 = 输入维度 42、fc2_weight 行数 = 输入维度 64，
      与数据包定点矩阵乘法（matrix_operation）的布局一致。

用法：
  python train_dqn.py
  python train_dqn.py --data experience.jsonl --out-dir model
  python train_dqn.py --epochs 200 --batch-size 32 --gamma 0.99 --lr 1e-3 --target-update 100

依赖：
  pip install torch numpy
"""
import argparse
import json
import os
import sys

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim

STATE_DIM = 42
HIDDEN_DIM = 64
ACTION_DIM = 351
SCALE = 10000  # 定点量化系数（MC 记分板整数推理）


class DQN(nn.Module):
    """输入 42 -> ReLU(64) -> 输出 351（无激活）。"""

    def __init__(self, state_dim=STATE_DIM, hidden_dim=HIDDEN_DIM, action_dim=ACTION_DIM):
        super().__init__()
        self.fc1 = nn.Linear(state_dim, hidden_dim)
        self.fc2 = nn.Linear(hidden_dim, action_dim)

    def forward(self, x):
        x = torch.relu(self.fc1(x))
        return self.fc2(x)


def load_experience(path):
    """读取 jsonl（每行一条 JSON），返回样本列表；过滤 action 无效的样本。"""
    if not os.path.exists(path):
        print(f"[!] 找不到数据文件: {path}")
        sys.exit(1)
    raw = []
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                raw.append(json.loads(line))
            except json.JSONDecodeError as e:
                print(f"[warn] 跳过无法解析的行: {e}")
    if not raw:
        print("[!] 数据文件为空，无法训练")
        sys.exit(1)
    samples = [e for e in raw if 0 <= int(e.get("action", -1)) < ACTION_DIM]
    bad = len(raw) - len(samples)
    if bad:
        print(f"[warn] 跳过 {bad} 条 action 无效的样本（action 需在 0~{ACTION_DIM - 1}）")
    if not samples:
        print("[!] 没有 action 有效的样本，无法训练")
        sys.exit(1)
    return samples


def build_tensors(samples, device):
    states, actions, rewards, next_states, dones = [], [], [], [], []
    for e in samples:
        states.append(e["state"])
        actions.append(int(e["action"]))
        rewards.append(float(e["reward"]))
        next_states.append(e["next_state"])
        dones.append(1.0 if e.get("done") else 0.0)
    return (
        torch.tensor(states, dtype=torch.float32, device=device),
        torch.tensor(actions, dtype=torch.long, device=device),
        torch.tensor(rewards, dtype=torch.float32, device=device),
        torch.tensor(next_states, dtype=torch.float32, device=device),
        torch.tensor(dones, dtype=torch.float32, device=device),
    )


def export_json(path, arr):
    """把 numpy 数组转成嵌套列表 JSON，值 ×SCALE 后四舍五入取整为 int32。"""
    q = np.round(arr * SCALE).astype(np.int32)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(q.tolist(), f, ensure_ascii=False)
    print(f"[OK] {path}  形状 {q.shape}")


def main():
    ap = argparse.ArgumentParser(description="训练 DQN 并导出定点整数权重 JSON（供 MC 数据包使用）")
    ap.add_argument("--data", default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "experience.jsonl"),
                    help="经验数据文件（jsonl，默认 experience.jsonl）")
    ap.add_argument("--out-dir", default=os.path.dirname(os.path.abspath(__file__)),
                    help="导出目录（默认脚本所在目录）")
    ap.add_argument("--epochs", type=int, default=200, help="训练轮数（默认 200）")
    ap.add_argument("--batch-size", type=int, default=32, help="批大小（默认 32，数据不足时自动退化为全量）")
    ap.add_argument("--gamma", type=float, default=0.99, help="折扣因子（默认 0.99）")
    ap.add_argument("--lr", type=float, default=1e-3, help="学习率（默认 1e-3）")
    ap.add_argument("--target-update", type=int, default=100, help="每 N 个训练步同步一次目标网络（默认 100）")
    ap.add_argument("--seed", type=int, default=42, help="随机种子")
    args = ap.parse_args()

    torch.manual_seed(args.seed)
    np.random.seed(args.seed)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"设备: {device}")

    samples = load_experience(args.data)
    n = len(samples)
    print(f"加载样本: {n} 条（state 维度 {len(samples[0]['state'])}）")

    states, actions, rewards, next_states, dones = build_tensors(samples, device)
    bs = min(args.batch_size, n)  # 数据不足时退化为全量
    steps_per_epoch = max(1, (n + bs - 1) // bs)

    online = DQN().to(device)
    target = DQN().to(device)
    target.load_state_dict(online.state_dict())
    target.eval()

    optimizer = optim.Adam(online.parameters(), lr=args.lr)
    criterion = nn.MSELoss()

    step = 0
    for epoch in range(args.epochs):
        epoch_loss = 0.0
        for _ in range(steps_per_epoch):
            idx = torch.randint(0, n, (bs,))
            s, a, r, ns, d = states[idx], actions[idx], rewards[idx], next_states[idx], dones[idx]

            q = online(s).gather(1, a.unsqueeze(1)).squeeze(1)  # 当前策略的 Q(s,a)
            with torch.no_grad():
                nq = target(ns).max(dim=1).values             # 目标网络 max Q(s')
                y = r + args.gamma * nq * (1.0 - d)            # 贝尔曼目标

            loss = criterion(q, y)
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            epoch_loss += loss.item()

            step += 1
            if step % args.target_update == 0:                 # 同步目标网络
                target.load_state_dict(online.state_dict())

        if epoch == 0 or (epoch + 1) % max(1, args.epochs // 10) == 0:
            print(f"Epoch {epoch + 1}/{args.epochs}  loss={epoch_loss / steps_per_epoch:.4f}")

    # ---- 导出（×10000 取整，布局与 MC 数据包一致）----
    os.makedirs(args.out_dir, exist_ok=True)
    export_json(os.path.join(args.out_dir, "fc1_weight.json"), online.fc1.weight.detach().cpu().numpy().T)  # (42,64)
    export_json(os.path.join(args.out_dir, "fc1_bias.json"), online.fc1.bias.detach().cpu().numpy())        # (64,)
    export_json(os.path.join(args.out_dir, "fc2_weight.json"), online.fc2.weight.detach().cpu().numpy().T)  # (64,351)
    export_json(os.path.join(args.out_dir, "fc2_bias.json"), online.fc2.bias.detach().cpu().numpy())        # (351,)
    print("完成。")


if __name__ == "__main__":
    main()
