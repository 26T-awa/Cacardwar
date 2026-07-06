<!-- markdownlint-disable MD033 -->
# 牌牌大作战数据包

<center> By _26T </center>

## 简介

**牌牌大作战**是一个MC Java原版数据包。在牌牌大作战，你可以使用 MC 基于原版物品的**卡牌**，利用原版以及新颖的**合成配方**，**进攻、防守、回复甚至召唤**，与好友一起进行激情而愉快的决斗，**取得成就、完成挑战**。这是一个小游戏数据包。

> **Description** in English:  
> **CacardWar** is a Minecraft Datapack that using **cards** based on original Minecraft items to fight with your friends through various **original or customed recipes, achieve amazing challenges and so on**. Treat it as a mini-game running on Minecraft Java Edition.

## 更新进度

7/6/26 [32]  
pre v5.1  

- 完善超级僵尸机制
- 更新物品的组件（可能遇到物品无法重叠的情况）
- 合成金苹果会消除所有的被禁用的格子的禁用效果，前提是可以合成

## 安装说明

### 加载数据包

1. 新建存档，找到世界文件夹，将**cacardwar datapack**放进存档的**datapacks**(.../saves/<存档名称>/datapacks/)文件夹里即可。
   > 注：在不同的版本下"cacardwar datapack"可能是"cacardwar" 或 "cacardwar datapack vx.x"

2. 新建存档界面，在“**更多**”里找到“**数据包**”，点击“打开包文件夹”将**cacardwar**放进即可。

3. 在已有的存档里找到世界文件夹，同1，后在游戏中输入`/datapack enable "file/cacardwar"`，最后输入`/reload`或重进游戏即可。

### 构建场地

获得**结构方块**(`/give @s structure_block`)，在“**加载模式**”下输入"cacardwar:start"（v3.3+：或"start"或"c:start"）后，将右侧“**严格放置**”和“**包括实体**”设为“**开**”，最后**两次点击**“**加载**”即可。

### 因物品展示框被破坏而影响正常游戏体验的解决方法

> **在cacardwar v4.1+可直接点击“仅重置物品展示框”悬挂式告示牌**

1. （**推荐**）：将场地内所有的实体（包括门外的鹦鹉、盔甲架和存放更新日志的物品展示框）清除，建议用指令`/kill @e[type=!player,distance=..5]`，然后回到已有的结构方块点击一次加载即可。

2. （**不推荐**）：按荧光物品展示框左侧的物品展示框为“头”，备用物品展示框为“尾”,依次为1 2 3 ... 9 0的顺序，使用指令`/tag <UUID> add cacard.<team>X` ，然后再对台上的9个物品展示框使用指令`/tag <UUID> add cacard.<team>`即可。  

    > 注：\<UUID>指对着物品展示框补全命令时的一串字符；\<team>指队伍，蓝方为blue，红方为red；X指数字1 2 3 ... 9 0

## 适用版本

数据包版本：

> v1-3.4 仅保证Java 1.21.7
> v4.1 适用Java 1.21.7和1.21.8
> v4.2 适用Java 1.21.7、1.21.8、1.21.9和1.21.10
> v4.3 适用Java 1.21.7、1.21.8、1.21.9和1.21.10
> v5.1 适用Java 1.21.11

**请安装在合适的mc版本上！**

## 鸣谢

**感谢参与测试的小伙伴**（游戏ID，A~z）：

> Akarui111
> Apocalyse25
> TianShaHAD
> YumWarrika
> muyuangu

## 灵感来源

B 站 UP 易羽田 的 [如何在我的世界里成为牌佬？以及我开放创作一款游戏后会发生什么？](https://www.bilibili.com/video/BV1g784zDEYD/)

---

## 以下内容供技术开发和参考

物品模型列表

    /give @s apple[custom_model_data={strings:["cacardwar:apple"]}]

cacardwar:apple
cacardwar:bundle
cacardwar:diamond
cacardwar:gold_ingot
cacardwar:gunpowder
cacardwar:iron_ingot
cacardwar:deal
cacardwar:log
cacardwar:plank
cacardwar:rotten
cacardwar:stick
cacardwar:wheat
cacardwar:head
cacardwar:head_zombie
