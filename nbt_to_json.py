#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
读取 Minecraft 世界 storage 的 .dat（NBT，通常 gzip 压缩）文件，转换为 JSON。
用于外部训练时读取数据包写入的 storage。

新版 MC（1.20.2+）storage 路径形如：
    <世界>/data/<命名空间>/command_storage.dat
例如：
    ...\\saves\\CacardWarWolrd\\data\\cacardwar\\command_storage.dat

依赖安装：
    pip install nbtlib

用法：
    # 默认：只提取 data.contents.agent 的内容，忽略其它（找不到自动回退 agent_state）
    python nbt_to_json.py

    # 指定输入文件（默认路径已内置，可覆盖）
    python nbt_to_json.py "C:\\Users\\suzhi\\Desktop\\game\\.minecraft\\versions\\26.2-Fabric 0.19.3\\saves\\CacardWarWolrd\\data\\cacardwar\\command_storage.dat" out.json

    # 自定义点号路径（默认 data.contents.agent）
    python nbt_to_json.py --path data.contents.agent out.json

    # 传入的 .dat 路径不存在时，会自动到其父目录下各命名空间子目录寻找同名文件
"""
import argparse
import json
import os
import sys

import nbtlib

# 默认输入路径（请按你的实际存档修改）
DEFAULT_INPUT = (
    r"C:\Users\suzhi\Desktop\game\.minecraft\versions\26.2-Fabric 0.19.3\saves\CacardWarWolrd\data\cacardwar\command_storage.dat"
)


def to_plain(tag):
    """递归把 nbtlib 标签转成纯 Python 对象（可 JSON 序列化）。"""
    if isinstance(tag, nbtlib.File):          # 根文件（类似 dict：data / DataVersion）
        return {str(k): to_plain(v) for k, v in tag.items()}
    if isinstance(tag, nbtlib.Compound):
        return {str(k): to_plain(v) for k, v in tag.items()}
    if isinstance(tag, nbtlib.List):
        return [to_plain(v) for v in tag]
    if isinstance(tag, (nbtlib.ByteArray, nbtlib.IntArray, nbtlib.LongArray)):
        return [to_plain(v) for v in tag]
    # 浮点 / 整数（注意判断顺序：Float/Double 也是 int 的? 不，它们独立）
    if isinstance(tag, (nbtlib.Double, nbtlib.Float)):
        return float(tag)
    if isinstance(tag, (nbtlib.Byte, nbtlib.Short, nbtlib.Int, nbtlib.Long)):
        return int(tag)
    if isinstance(tag, str):  # nbtlib.String 是 str 的子类
        return str(tag)
    # 兜底：其余类型原样返回（通常是 None 等）
    return tag


def load_plain(path_in):
    """加载 .dat 并返回纯 Python 对象。"""
    data = nbtlib.load(path_in)          # 自动处理 gzip/brotli 压缩
    return to_plain(data)


def write_json(plain, path_out, tag_msg="", path_in=""):
    if plain is None:
        print(f"[!] 未找到目标 storage: {path_in}")
        return False
    with open(path_out, "w", encoding="utf-8") as f:
        json.dump(plain, f, ensure_ascii=False, indent=2)
    print(f"[OK] {tag_msg}{path_in}\n   -> {path_out}")
    return True


def convert_file(path_in, path_out):
    """加载单个 .dat 并写出 JSON。"""
    write_json(load_plain(path_in), path_out, path_in=path_in)


def find_key(obj, key):
    """在转换后的纯对象中递归查找第一个键为 key 的值；找不到返回 None。"""
    if isinstance(obj, dict):
        if key in obj:
            return obj[key]
        for v in obj.values():
            r = find_key(v, key)
            if r is not None:
                return r
    elif isinstance(obj, list):
        for v in obj:
            r = find_key(v, key)
            if r is not None:
                return r
    return None


def get_by_path(obj, path):
    """按点号路径逐级导航，如 'data.contents.agent_state'；找不到返回 None。
    支持 dict 键与 list 数字下标。"""
    cur = obj
    for part in path.split('.'):
        if isinstance(cur, dict) and part in cur:
            cur = cur[part]
        elif isinstance(cur, list) and part.isdigit() and int(part) < len(cur):
            cur = cur[int(part)]
        else:
            return None
    return cur


def find_dat_files(root):
    """递归查找目录下所有 .dat 文件。"""
    found = []
    for dirpath, _, files in os.walk(root):
        for f in files:
            if f.endswith(".dat"):
                found.append(os.path.join(dirpath, f))
    return found


def resolve_input(path_in):
    """返回可用的 .dat 文件路径列表；找不到返回空列表。
    支持：文件 / 目录 / 不存在的路径（自动到父目录下各命名空间子目录找同名文件）。"""
    if os.path.isfile(path_in):
        return [path_in]
    if os.path.isdir(path_in):
        return find_dat_files(path_in)
    # 路径不存在：尝试常见变体 + 在父目录的各子目录中查找同名文件
    candidates = [path_in + ".dat"]
    parent, base = os.path.dirname(path_in), os.path.basename(path_in)
    if os.path.isdir(parent):
        candidates.append(os.path.join(parent, "command_storage.dat"))
        for sub in os.listdir(parent):
            cand = os.path.join(parent, sub, base)
            if os.path.isfile(cand):
                candidates.append(cand)
    return [c for c in candidates if os.path.isfile(c)]


EXPERIENCE_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "experience.jsonl")


def load_jsonl(path):
    """读取 jsonl 文件（每行一条 JSON），返回列表；文件不存在或行为空时返回 []。"""
    elements = []
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    elements.append(json.loads(line))
                except json.JSONDecodeError:
                    continue
    return elements


def save_jsonl(path, elements):
    """把元素列表按行写入 jsonl。"""
    with open(path, "w", encoding="utf-8") as f:
        for e in elements:
            f.write(json.dumps(e, ensure_ascii=False) + "\n")


def append_experience(layer0, exp_path=EXPERIENCE_PATH):
    """把 layer0 作为新样本追加到 experience.jsonl 末尾。
    - 新样本（最后）的 state / next_state 都复制 layer0
    - 原最后样本（倒数第二）的 next_state 更新为 layer0
    - 其它字段保持不变；列表为空（第一个样本）时不更新 next_state"""
    elements = load_jsonl(exp_path)
    new_elem = {
        "state": layer0,
        "action": -1,
        "reward": 0,
        "next_state": layer0,
        "done": False,
    }
    if elements:  # 有前一个样本 -> 更新其 next_state
        elements[-1]["next_state"] = layer0
    elements.append(new_elem)
    save_jsonl(exp_path, elements)
    print(f"[OK] 已追加样本到 experience.jsonl（当前 {len(elements)} 条）")


def main():
    ap = argparse.ArgumentParser(description="Minecraft .dat (NBT) -> JSON")
    ap.add_argument("input", nargs="?", default=DEFAULT_INPUT,
                    help=".dat 文件或含 .dat 的目录（默认内置路径）")
    ap.add_argument("output", nargs="?", default=None,
                    help="输出 JSON 文件；若输入是目录则输出目录（默认: 当前目录下 agent_state.json）")
    ap.add_argument("--storage", default=None,
                    help="可选：在转换结果中按 key 递归提取指定 storage（如 agent_state）单独输出")
    ap.add_argument("--path", default="data.contents.agent",
                    help="按点号路径精确提取（默认 data.contents.agent；找不到自动回退 agent_state）")
    args = ap.parse_args()

    if args.output is None:
        args.output = os.path.join(os.path.dirname(os.path.abspath(__file__)), "agent_state.json")

    files = resolve_input(args.input)
    if not files:
        print(f"找不到输入文件: {args.input}")
        print("提示：新版 MC 的 storage 路径形如 <世界>/data/<命名空间>/command_storage.dat")
        print("  例如 ...\\saves\\CacardWarWolrd\\data\\cacardwar\\command_storage.dat")
        sys.exit(1)

    if args.storage:
        # 显式指定 storage 时，按 key 递归提取优先
        if os.path.isdir(args.input):
            os.makedirs(args.output, exist_ok=True)
            for f in files:
                sub = find_key(load_plain(f), args.storage)
                out = os.path.join(args.output, os.path.splitext(os.path.basename(f))[0] + "_" + args.storage + ".json")
                write_json(sub, out, f"[storage:{args.storage}] ", f)
        else:
            sub = find_key(load_plain(files[0]), args.storage)
            os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)
            write_json(sub, args.output, f"[storage:{args.storage}] ", files[0])
        return

    # 点号路径精确提取（默认 data.contents.agent；忽略其它内容，找不到自动回退 agent_state）
    path = args.path if args.path is not None else "data.contents.agent"
    candidates = [path, "data.contents.agent_state", "data.contents.agent"]

    def _extract(obj):
        for p in candidates:
            r = get_by_path(obj, p)
            if r is not None:
                return r, p
        return None, path

    if os.path.isdir(args.input):
        os.makedirs(args.output, exist_ok=True)
        for f in files:
            sub, used = _extract(load_plain(f))
            out = os.path.join(args.output, os.path.splitext(os.path.basename(f))[0] + ".json")
            write_json(sub, out, f"[path:{used}] ", f)
    else:
        sub, used = _extract(load_plain(files[0]))
        os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)
        if write_json(sub, args.output, f"[path:{used}] ", files[0]):
            # 把提取内容里的 layer0 追加为 experience.jsonl 的新样本
            if isinstance(sub, dict) and isinstance(sub.get("layer0"), list):
                append_experience(list(sub["layer0"]))
            else:
                print("[!] 提取内容中没有 layer0，跳过 experience.jsonl 追加")
    print("完成。")


if __name__ == "__main__":
    main()
