import json
import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
from torch.utils.data import Dataset, DataLoader
from collections import deque
import random

# ------------------------- 1. 定义网络结构 -------------------------
class DQN(nn.Module):
    def __init__(self, input_dim=42, hidden_dim=64, output_dim=351):
        super(DQN, self).__init__()
        self.fc1 = nn.Linear(input_dim, hidden_dim)
        self.fc2 = nn.Linear(hidden_dim, output_dim)
        self.relu = nn.ReLU()

    def forward(self, x):
        x = self.relu(self.fc1(x))
        x = self.fc2(x)
        return x

# ------------------------- 2. 数据集封装 -------------------------
class ReplayDataset(Dataset):
    def __init__(self, json_path, gamma=0.99):
        with open(json_path, 'r') as f:
            self.data = json.load(f)
        self.gamma = gamma
        # 计算每个样本的目标 Q 值（使用贝尔曼方程）
        self.targets = []
        for exp in self.data:
            state = np.array(exp['state'], dtype=np.float32)
            action = exp['action']
            reward = exp['reward']
            next_state = np.array(exp['next_state'], dtype=np.float32)
            done = exp['done']
            # 这里暂时用占位符，实际训练时用网络计算 next_q
            # 我们将在训练循环中实时计算目标值，因此这里只存储原始数据
        # 为了节省内存，只在 __getitem__ 中动态计算目标（使用当前网络）
        # 但为了速度，我们会预先存储状态、动作、奖励、下一状态、done
        self.states = []
        self.actions = []
        self.rewards = []
        self.next_states = []
        self.dones = []
        for exp in self.data:
            self.states.append(np.array(exp['state'], dtype=np.float32))
            self.actions.append(exp['action'])
            self.rewards.append(exp['reward'])
            self.next_states.append(np.array(exp['next_state'], dtype=np.float32))
            self.dones.append(exp['done'])

    def __len__(self):
        return len(self.states)

    def __getitem__(self, idx):
        return (self.states[idx], self.actions[idx], self.rewards[idx],
                self.next_states[idx], self.dones[idx])

# ------------------------- 3. 训练函数 -------------------------
def train_dqn(json_path, epochs=100, batch_size=64, lr=1e-3, gamma=0.99,
              target_update=10, device='cpu'):
    # 加载数据集
    dataset = ReplayDataset(json_path, gamma)
    dataloader = DataLoader(dataset, batch_size=batch_size, shuffle=True)

    # 初始化网络和目标网络
    policy_net = DQN().to(device)
    target_net = DQN().to(device)
    target_net.load_state_dict(policy_net.state_dict())
    target_net.eval()

    optimizer = optim.Adam(policy_net.parameters(), lr=lr)
    criterion = nn.MSELoss()

    for epoch in range(epochs):
        total_loss = 0.0
        for states, actions, rewards, next_states, dones in dataloader:
            states = states.to(device)
            actions = actions.to(device)
            rewards = rewards.to(device)
            next_states = next_states.to(device)
            dones = dones.to(device)

            # 当前 Q 值
            q_values = policy_net(states)  # (batch, 351)
            q_values = q_values.gather(1, actions.unsqueeze(1)).squeeze(1)  # (batch,)

            # 目标 Q 值
            with torch.no_grad():
                next_q_values = target_net(next_states)  # (batch, 351)
                max_next_q, _ = next_q_values.max(dim=1)  # (batch,)
                target_q = rewards + gamma * max_next_q * (1 - dones.float())

            loss = criterion(q_values, target_q)
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()

            total_loss += loss.item()

        # 定期更新目标网络
        if (epoch + 1) % target_update == 0:
            target_net.load_state_dict(policy_net.state_dict())

        if (epoch + 1) % 10 == 0:
            print(f"Epoch {epoch+1}/{epochs}, Loss: {total_loss/len(dataloader):.4f}")

    return policy_net

# ------------------------- 4. 导出权重为 JSON -------------------------
def export_weights(model, output_json='model_weights.json'):
    state_dict = model.state_dict()
    # 提取权重和偏置
    weights = {
        'fc1_weight': state_dict['fc1.weight'].cpu().numpy().tolist(),  # (64, 42)
        'fc1_bias': state_dict['fc1.bias'].cpu().numpy().tolist(),      # (64,)
        'fc2_weight': state_dict['fc2.weight'].cpu().numpy().tolist(),  # (351, 64)
        'fc2_bias': state_dict['fc2.bias'].cpu().numpy().tolist()       # (351,)
    }
    with open(output_json, 'w') as f:
        json.dump(weights, f, indent=2)
    print(f"权重已导出到 {output_json}")
    # 导出量化版本（乘以10000取整），为MC准备
    quantized = {}
    for key, tensor in weights.items():
        arr = np.array(tensor)
        # 注意：输入在0~1，权重在-1~1，乘以10000后取整
        quantized[key] = np.round(arr * 10000).astype(np.int32).tolist()
    with open('model_weights_quantized.json', 'w') as f:
        json.dump(quantized, f, indent=2)
    print("量化版本已导出到 model_weights_quantized.json")

# ------------------------- 5. 主程序 -------------------------
if __name__ == "__main__":
    # 设置设备
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"使用设备: {device}")

    # 训练
    model = train_dqn(
        json_path='experience.jsonl',
        epochs=200,          # 根据数据量调整
        batch_size=64,
        lr=1e-3,
        gamma=0.99,
        target_update=10,
        device=device
    )

    # 导出权重（浮点版本和量化版本）
    export_weights(model, 'model_weights.json')