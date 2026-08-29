#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
交互式修改 experience.jsonl 中每个样本的 action / reward / done。

流程（每阶段后立即保存）：
  1. action ：逗号分隔每样本 1 个整数（可含 -1）；单值=广播到全部；回车=跳过
  2. reward ：逗号分隔每样本 1 个浮点；单值=广播到全部；回车=跳过
  3. done   ：输入要设为 true 的样本索引（1-based，逗号分隔）；
              会先把所有样本 done 重置为 false，再把你指定的索引置 true；回车=跳过

用法：
  python update_experience.py
"""
import json
import os
import sys

PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "experience.jsonl")


def load():
    if not os.path.exists(PATH):
        print(f"找不到 {PATH}")
        sys.exit(1)
    data = []
    with open(PATH, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            data.append(json.loads(line))
    return data


def save(data):
    with open(PATH, "w", encoding="utf-8") as f:
        for e in data:
            f.write(json.dumps(e, ensure_ascii=False) + "\n")


def ask_values(prompt, n, cast, name):
    """解析逗号分隔输入：每样本一个值，或单值广播；空回车返回 None（跳过）。"""
    while True:
        raw = input(prompt).strip()
        if not raw:
            return None
        parts = [p.strip() for p in raw.split(",") if p.strip()]
        try:
            if len(parts) == 1:
                return [cast(parts[0])] * n
            if len(parts) == n:
                return [cast(p) for p in parts]
        except ValueError:
            print(f"[!] {name} 含有非法数值，请重试")
            continue
        print(f"[!] {name}: 期望 {n} 个值或 1 个广播值，得到 {len(parts)} 个，请重试")


def main():
    data = load()
    n = len(data)
    if n == 0:
        print("experience.jsonl 为空，无需修改")
        return
    print(f"当前样本数: {n}（元素 1..{n}）\n")

    # ---- 1) action ----
    vals = ask_values(
        f"[1/3] action（每样本1个整数，逗号分隔；单值=广播；回车=跳过）: ", n, int, "action")
    if vals is not None:
        for i, v in enumerate(vals):
            data[i]["action"] = v
        save(data)
        print(f"  已更新 action -> {vals}\n")

    # ---- 2) reward ----
    vals = ask_values(
        f"[2/3] reward（每样本1个浮点，逗号分隔；单值=广播；回车=跳过）: ", n, float, "reward")
    if vals is not None:
        for i, v in enumerate(vals):
            data[i]["reward"] = v
        save(data)
        print(f"  已更新 reward -> {vals}\n")

    # ---- 3) done：先全部重置 false，再按索引置 true ----
    raw = input(
        f"[3/3] done（输入要设为 true 的样本索引，1-based 逗号分隔；先把全部重置为 false；回车=跳过）: ").strip()
    if raw:
        for e in data:
            e["done"] = False
        for p in [p.strip() for p in raw.split(",") if p.strip()]:
            try:
                idx = int(p) - 1
            except ValueError:
                print(f"  [!] 非法索引: {p}")
                continue
            if 0 <= idx < n:
                data[idx]["done"] = True
            else:
                print(f"  [!] 索引越界（1..{n}）: {p}")
        save(data)
        print(f"  已更新 done（其余重置为 false），true 索引: {raw}\n")

    print("全部完成。")


if __name__ == "__main__":
    main()
