#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
生成 mcfunction 文件，用于在 Minecraft 游戏内导入训练好的权重矩阵。
运行后会在指定路径生成 import_weights.mcfunction，将其放入数据包 functions 文件夹，
然后在游戏内执行 /function <命名空间>:import_weights 即可。
"""

import json
import os

# ================== 配置区 ==================
# 输入文件路径（相对于脚本运行目录）
FILES_TO_IMPORT = [
    ('model/fc1_weight.json', 'cacardwar:ai model.weights1'),  # 81x64
    ('model/fc1_bias.json', 'cacardwar:ai model.biases1'),     # 64
    ('model/fc2_weight.json', 'cacardwar:ai model.weights2'),  # 64x181
    ('model/fc2_bias.json', 'cacardwar:ai model.biases2'),     # 181
]

OUTPUT_FILE = 'cacardwar datapack/data/cacardwar/function/ai/game/import_weights.mcfunction'   # 生成的 mcfunction 文件名
# ===========================================

def generate_mcfunction():
    # 确保输出目录存在
    output_dir = os.path.dirname(OUTPUT_FILE)
    if output_dir:
        os.makedirs(output_dir, exist_ok=True)

    lines = []
    # 添加注释
    lines.append('# 自动生成的权重导入函数')
    lines.append('# 执行前请确保已加载对应数据包')
    lines.append('')

    for file_path, storage_path in FILES_TO_IMPORT:
        # 检查文件是否存在
        if not os.path.exists(file_path):
            print(f"[警告] 文件 {file_path} 不存在，跳过。")
            continue

        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
        except json.JSONDecodeError as e:
            print(f"[错误] 文件 {file_path} 解析失败: {e}，跳过。")
            continue

        if not data:
            print(f"[警告] 文件 {file_path} 为空，跳过。")
            continue

        # 重置目标为空列表
        lines.append(f'# 重置 {storage_path}')
        lines.append(f'data modify storage {storage_path} set value []')

        # 判断是一维向量还是二维矩阵
        if isinstance(data[0], (int, float)):
            # 一维向量：整体追加
            row_json = json.dumps(data)
            lines.append(f'data modify storage {storage_path} append value {row_json}')
            print(f"[信息] {file_path} -> 一维向量，1 行")
        else:
            # 二维矩阵：逐行追加
            for i, row in enumerate(data):
                row_json = json.dumps(row)
                lines.append(f'data modify storage {storage_path} append value {row_json}')
                # 每 10 行添加注释方便查看进度
                if (i + 1) % 10 == 0:
                    lines.append(f'# 已导入 {i+1} 行')
            print(f"[信息] {file_path} -> 二维矩阵，{len(data)} 行")

        lines.append('')  # 空行分隔

    # 写入文件
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

    print(f"\n成功生成 {OUTPUT_FILE}，共 {len(lines)} 行命令。")
    print("请将此文件放入数据包的 functions 文件夹（例如 data/cacardwar/functions/），")
    print("然后在游戏内执行 /function cacardwar:import_weights （如果命名空间不同请自行调整）。")

if __name__ == '__main__':
    generate_mcfunction()