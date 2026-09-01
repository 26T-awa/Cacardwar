#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
通过 RCON 将训练好的权重矩阵导入 Minecraft storage。
适用于导入 DQN 训练生成的 fc1_weight.json, fc1_bias.json 等文件。
"""

import json
import time
from mcrcon import MCRcon

# ================== 配置区 ==================
RCON_CONFIG = {
    'host': '127.0.0.1',
    'port': 25575,
    'password': '12345'  # 请替换为你的实际密码
}

# 定义导入映射：JSON文件名 -> storage中的目标路径
FILES_TO_IMPORT = [
    ('model/fc1_weight.json', 'cacardwar:ai model.weights1'),  # 81x64
    ('model/fc1_bias.json', 'cacardwar:ai model.biases1'),     # 64
    ('model/fc2_weight.json', 'cacardwar:ai model.weights2'),  # 64x181
    ('model/fc2_bias.json', 'cacardwar:ai model.biases2'),     # 181
]

# 每条命令之间的延迟（秒），防止命令积压
COMMAND_DELAY = 0.05
# ===========================================


def import_matrix(mcr, file_path, storage_path):
    """导入一个矩阵（列表的列表）到指定的 storage 路径。"""
    print(f"正在导入: {file_path} -> storage {storage_path}")

    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            matrix = json.load(f)
    except FileNotFoundError:
        print(f"  [错误] 文件 {file_path} 未找到，跳过。")
        return
    except json.JSONDecodeError as e:
        print(f"  [错误] 文件 {file_path} 解析失败: {e}，跳过。")
        return

    # 1. 初始化目标为一个空列表
    init_cmd = f"data modify storage {storage_path} set value []"
    mcr.command(init_cmd)
    time.sleep(COMMAND_DELAY)

    # 2. 逐行追加数据
    # 对于一维向量（如 bias），它本身就是一个列表，需要作为一整行追加
    if matrix and isinstance(matrix[0], (int, float)):
        # 处理一维向量
        row_json = json.dumps(matrix)
        append_cmd = f"data modify storage {storage_path} append value {row_json}"
        mcr.command(append_cmd)
        mcr.command(f"tellraw @a \"完成向{storage_path}加载{file_path}.\"")
        print(f"  已导入 1 行 (向量)")
    else:
        # 处理二维矩阵
        for i, row in enumerate(matrix):
            row_json = json.dumps(row)
            append_cmd = f"data modify storage {storage_path} append value {row_json}"
            mcr.command(append_cmd)
            # 每10行打印一次进度，避免刷屏
            if (i + 1) % 10 == 0:
                print(f"  已导入 {i+1} 行...")
            time.sleep(COMMAND_DELAY)
        mcr.command(f"tellraw @a \"完成向{storage_path}加载{file_path}.\"")
        print(f"  矩阵导入完成，共 {len(matrix)} 行。")


def main():
    print("开始导入权重...")
    try:
        with MCRcon(RCON_CONFIG['host'], RCON_CONFIG['password'], port=RCON_CONFIG['port']) as mcr:
            print(f"成功连接到 RCON 服务器 ({RCON_CONFIG['host']}:{RCON_CONFIG['port']})")
            for file_name, storage_path in FILES_TO_IMPORT:
                import_matrix(mcr, file_name, storage_path)
                print("---")
        print("所有权重导入完成！")
    except ConnectionRefusedError:
        print("[错误] 无法连接到 RCON 服务器，请确保：")
        print("  1. 游戏服务器正在运行。")
        print("  2. server.properties 中已开启 RCON (enable-rcon=true)。")
        print("  3. 脚本中的 host, port, password 配置正确。")
    except Exception as e:
        print(f"[错误] 发生未知异常: {e}")


if __name__ == "__main__":
    main()