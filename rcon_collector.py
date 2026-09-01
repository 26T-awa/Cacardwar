#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
RCON 数据采集器（适配 pending_sample 单样本结构）
从 Minecraft 的 storage cacardwar:ai pending_sample 轮询单条经验，
转换为标准格式，
追加写入本地 experience.jsonl（每行一条 JSON）。

依赖：
  pip install mcrcon

用法：
  python rcon_collector.py --password 12345
"""

import argparse
import hashlib
import json
import os
import sys
import time
import re
from datetime import datetime

try:
    from mcrcon import MCRcon
except ImportError:
    print("[!] 缺少 mcrcon 库，请先安装：pip install mcrcon")
    sys.exit(1)

STORAGE_CMD_GET = "/data get storage cacardwar:ai latest_sample"
STORAGE_CMD_CLEAR = "/data remove storage cacardwar:ai latest_sample"
DEFAULT_OUTPUT = os.path.join(
    os.path.dirname(os.path.abspath(__file__)), "experience.jsonl"
)


def log(msg):
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] {msg}", flush=True)


def _parse_snbt(s):
    """把 Minecraft /data get 输出的 SNBT 解析成纯 Python 对象。

    MC 返回的 /data get 是 SNBT 文本（带类型后缀），例如：
        [{state:[0.25f,0.285714286f,...],action:12,reward:1.0f,next_state:[...],done:0b}]
    json.loads 无法解析（'0.0f'、'0b' 等不是合法 JSON），必须用本函数。

    支持：复合标签 {}、列表 []（含 [B;/[I;/[L;/[F;/[D; 定长数组）、
    带后缀数字（b/s/l/f/d）、整数、浮点、双/单引号字符串、true/false、裸词字符串。
    """
    i, n = 0, len(s)

    def ws():
        nonlocal i
        while i < n and s[i] in " \t\r\n":
            i += 1

    def number_or_word():
        nonlocal i
        start = i
        while i < n and s[i] not in ",:{}[] \t\r\n":
            i += 1
        tok = s[start:i]
        low = tok.lower()
        if low == "true":
            return True
        if low == "false":
            return False
        m = re.fullmatch(
            r"([+-]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?)([bBsSlLfFdD]?)", tok
        )
        if m:
            num, suf = m.group(1), m.group(2).lower()
            if suf in ("f", "d") or "." in num or "e" in num.lower():
                return float(num)
            return int(num)
        return tok  # 未加引号的裸词（如 NULL）按字符串处理

    def string():
        nonlocal i
        quote = s[i]
        i += 1
        out = []
        while i < n:
            c = s[i]
            if c == "\\" and i + 1 < n:
                out.append(s[i + 1])
                i += 2
            elif c == quote:
                i += 1
                break
            else:
                out.append(c)
                i += 1
        return "".join(out)

    def compound():
        nonlocal i
        i += 1  # '{'
        out = {}
        ws()
        if i < n and s[i] == "}":
            i += 1
            return out
        while True:
            ws()
            if i < n and s[i] in "\"'":
                key = string()
            else:
                start = i
                while i < n and s[i] not in ":{}[] \t\r\n":
                    i += 1
                key = s[start:i]
            ws()
            if i < n and s[i] == ":":
                i += 1
            out[key] = _value()
            ws()
            if i < n and s[i] == ",":
                i += 1
                continue
            if i < n and s[i] == "}":
                i += 1
                break
            raise ValueError("bad compound")
        return out

    def list_val():
        nonlocal i
        i += 1  # '['
        # 定长数组：[B;..] / [I;..] / [L;..] / [F;..] / [D;..]
        if i + 1 < n and s[i] in "BbSsLlIiFfDd" and s[i + 1] == ";":
            i += 2
            arr = []
            while True:
                ws()
                if i < n and s[i] == "]":
                    i += 1
                    break
                arr.append(number_or_word())
                ws()
                if i < n and s[i] == ",":
                    i += 1
            return arr
        out = []
        ws()
        if i < n and s[i] == "]":
            i += 1
            return out
        while True:
            out.append(_value())
            ws()
            if i < n and s[i] == ",":
                i += 1
                continue
            if i < n and s[i] == "]":
                i += 1
                break
            raise ValueError("bad list")
        return out

    def _value():
        ws()
        if i >= n:
            raise ValueError("unexpected end")
        c = s[i]
        if c == "{":
            return compound()
        if c == "[":
            return list_val()
        if c in "\"'":
            return string()
        return number_or_word()

    return _value()


def parse_latest_sample(resp):
    """
    从 /data get 的返回文本中解析 latest_sample（单个 Compound）。
    只提取必要字段：reward[0], before, after, action, done。
    返回精简后的字典，键顺序为 action, reward, done, before, after。
    """
    if not resp:
        return None
    text = resp.strip()
    pos = text.find("{")
    if pos == -1:
        log("[warn] 未找到 '{'，可能 storage 为空或返回格式异常")
        return None
    payload = text[pos:].strip()
    try:
        data = _parse_snbt(payload)
    except Exception as e:
        log(f"[warn] SNBT 解析失败: {e}")
        return None

    if not isinstance(data, dict):
        log(f"[warn] 期望 Compound，实际得到 {type(data).__name__}")
        return None

    required = {"before", "after", "action", "reward", "done"}
    existing = set(data.keys())
    missing = required - existing
    if missing:
        log(f"[warn] latest_sample 缺少必要字段: {', '.join(missing)}")
        return None

    reward_list = data.get("reward", [])
    if isinstance(reward_list, list) and len(reward_list) > 0:
        total_reward = float(reward_list[0])
    else:
        log("[warn] reward 字段不是数组或为空，设为 0.0")
        total_reward = 0.0

    # 构建精简样本，键顺序：action, reward, done, before, after
    sample = {
        "action": int(data["action"]),
        "reward": total_reward,
        "done": bool(data.get("done", 0)),
        "before": data["before"],
        "after": data["after"],
    }

    # 对浮点数进行四舍五入（保留 4 位小数）
    return round_floats(sample, ndigits=4)


def round_floats(obj, ndigits=4):
    """
    递归地将 obj 中的所有浮点数四舍五入到指定小数位数。
    支持 dict、list、tuple 以及基本类型。
    """
    if isinstance(obj, float):
        return round(obj, ndigits)
    elif isinstance(obj, dict):
        return {k: round_floats(v, ndigits) for k, v in obj.items()}
    elif isinstance(obj, (list, tuple)):
        return [round_floats(item, ndigits) for item in obj]
    else:
        return obj


def convert_sample(raw):
    """
    将 pending_sample 原始结构转换为训练标准格式。
    返回 {state, action, reward, next_state, done}
    """
    if not raw:
        return None

    before = raw.get("before")
    after = raw.get("after")
    action = raw.get("action")
    reward_list = raw.get("reward", [])

    if before is None or after is None or action is None:
        log("[warn] 缺失必要字段 (before/after/action)，跳过")
        return None

    # 计算 done：根据双方生命值判断（health[0] 为己方，health[1] 为敌方）
    # 注意：health 在 before/after 中位置固定，索引 1 为生命值数组
    # before 结构：[[卡组], [生命值], [护盾], [状态], [召唤物], [卡牌], [卡槽], [禁用]]
    # after  结构相同
    def get_health(state):
        # state[1] 是 [己方生命, 敌方生命]
        health_arr = state[1] if isinstance(state, list) and len(state) > 1 else []
        return health_arr if isinstance(health_arr, list) else []

    health_before = get_health(before)
    health_after = get_health(after)
    done = False
    if len(health_after) >= 2:
        # 任一玩家生命值 <= 0 则对局结束
        if health_after[0] <= 0 or health_after[1] <= 0:
            done = True
    elif len(health_before) >= 2:
        # 如果 after 无生命值，尝试用 before 判断（极少情况）
        if health_before[0] <= 0 or health_before[1] <= 0:
            done = True

    # 总奖励取 reward 数组第一个元素（若不存在则取 0.0）
    reward = (
        reward_list[0]
        if isinstance(reward_list, list) and len(reward_list) > 0
        else 0.0
    )

    return {
        "state": before,
        "action": int(action),
        "reward": float(reward),
        "next_state": after,
        "done": bool(done),
    }


def fingerprint(elem):
    """对一条经验生成内容指纹，用于跨重启去重。"""
    return hashlib.sha256(
        json.dumps(elem, sort_keys=True, ensure_ascii=False).encode("utf-8")
    ).hexdigest()


def load_seen(output):
    """读取已有 jsonl，返回已存在的样本指纹集合。"""
    seen = set()
    if os.path.exists(output):
        with open(output, encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    seen.add(fingerprint(json.loads(line)))
                except json.JSONDecodeError:
                    continue
    return seen


def main():

    ap = argparse.ArgumentParser(
        description="从 Minecraft RCON 采集 pending_sample 到 experience.jsonl"
    )
    ap.add_argument("--host", default="127.0.0.1", help="RCON 主机")
    ap.add_argument("--port", type=int, default=25575, help="RCON 端口（默认 25575）")
    ap.add_argument("--password", required=True, help="RCON 密码")
    ap.add_argument("--interval", type=float, default=1.0, help="轮询间隔秒（默认 1）")
    ap.add_argument(
        "--output",
        default=DEFAULT_OUTPUT,
        help=f"输出 jsonl 路径（默认 {DEFAULT_OUTPUT}）",
    )
    ap.add_argument(
        "--no-clear", action="store_true", help="读取后不清空游戏内存 storage"
    )
    ap.add_argument(
        "--retry-delay", type=float, default=5.0, help="连接失败后的重试等待秒数"
    )
    args = ap.parse_args()

    out_dir = os.path.dirname(os.path.abspath(args.output))
    if out_dir:
        os.makedirs(out_dir, exist_ok=True)

    seen = load_seen(args.output)
    log(f"断点续传：已加载 {len(seen)} 条已有样本（用于去重）")

    while True:
        try:
            mcr = MCRcon(args.host, args.password, port=args.port)
            try:
                mcr.connect()
                log(f"已连接 RCON {args.host}:{args.port}")
                while True:
                    # 在主循环中：
                    resp = mcr.command(STORAGE_CMD_GET)
                    sample = parse_latest_sample(resp)
                    if sample is None:
                        log("[warn] 无法解析 latest_sample（可能 storage 为空）")
                    else:
                        fp = fingerprint(sample)
                        if fp in seen:
                            log("样本已存在（重复），跳过")
                        else:
                            with open(args.output, "a", encoding="utf-8") as f:
                                f.write(json.dumps(sample, ensure_ascii=False) + "\n")
                            seen.add(fp)
                            log(f"新增 1 条样本 -> {args.output}")
                        if not args.no_clear:
                            mcr.command(STORAGE_CMD_CLEAR)
                            log("已清空游戏内存 storage cacardwar:ai latest_sample")
                    time.sleep(args.interval)
            finally:
                try:
                    mcr.disconnect()
                except Exception:
                    pass
        except KeyboardInterrupt:
            log("收到 Ctrl+C，退出。")
            break
        except Exception as e:
            log(f"连接断开/异常: {e}，{args.retry_delay:.0f} 秒后重试...")
            time.sleep(args.retry_delay)


if __name__ == "__main__":
    main()
