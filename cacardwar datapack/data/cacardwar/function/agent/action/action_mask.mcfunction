# 牌牌大作战 - 动作掩码生成（宏参数 {team}）
# 动作空间共 351：0 跳过 + 1~10 清空(10槽) + 11~350 放置(17卡×10槽×2型)
# 放置动作索引 = 11 + 卡k*20 + 槽s*2 + 型t（t=0添加, t=1修改）
# 输出：storage cacardwar:agent.action_mask[351]，1.0=可执行，0.0=不可执行
# 说明：荧光槽 = 槽 2（放卡会触发使用/合成判定）

# ===== 1. 初始化掩码全 0（351 个） =====

# ===== 2. 跳过回合（0）始终可执行 =====
data modify storage cacardwar:agent action_mask[0] set value 1.0

# ===== 3. 手牌统计（17 种卡；clear count=0 只统计不清除） =====
scoreboard players set #cacard.agentHand0 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand0 cacard.players = #cacard.aiHand_iron_ingot cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand0 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["iron_ingot"]}] 0
scoreboard players set #cacard.agentHand1 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand1 cacard.players = #cacard.aiHand_gold_ingot cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand1 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["gold_ingot"]}] 0
scoreboard players set #cacard.agentHand2 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand2 cacard.players = #cacard.aiHand_diamond cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand2 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["diamond"]}] 0
scoreboard players set #cacard.agentHand3 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand3 cacard.players = #cacard.aiHand_gunpowder cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand3 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["gunpowder"]}] 0
scoreboard players set #cacard.agentHand4 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand4 cacard.players = #cacard.aiHand_stick cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand4 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["stick"]}] 0
scoreboard players set #cacard.agentHand5 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand5 cacard.players = #cacard.aiHand_log cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand5 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["log"]}] 0
scoreboard players set #cacard.agentHand6 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand6 cacard.players = #cacard.aiHand_plank cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand6 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["plank"]}] 0
scoreboard players set #cacard.agentHand7 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand7 cacard.players = #cacard.aiHand_apple cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand7 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["apple"]}] 0
scoreboard players set #cacard.agentHand8 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand8 cacard.players = #cacard.aiHand_wheat cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand8 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["wheat"]}] 0
scoreboard players set #cacard.agentHand9 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand9 cacard.players = #cacard.aiHand_another_two cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand9 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["another_two"]}] 0
scoreboard players set #cacard.agentHand10 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand10 cacard.players = #cacard.aiHand_deal cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand10 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["deal"]}] 0
scoreboard players set #cacard.agentHand11 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand11 cacard.players = #cacard.aiHand_newly_wheat cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand11 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["newly_wheat"]}] 0
scoreboard players set #cacard.agentHand12 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand12 cacard.players = #cacard.aiHand_newly_bread cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand12 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["newly_bread"]}] 0
scoreboard players set #cacard.agentHand13 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand13 cacard.players = #cacard.aiHand_rotten cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand13 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["rotten"]}] 0
scoreboard players set #cacard.agentHand14 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand14 cacard.players = #cacard.aiHand_head cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand14 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["head"]}] 0
scoreboard players set #cacard.agentHand15 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand15 cacard.players = #cacard.aiHand_head_zombie cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand15 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["head_zombie"]}] 0
scoreboard players set #cacard.agentHand16 cacard.players 0
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players operation #cacard.agentHand16 cacard.players = #cacard.aiHand_mineral_clump cacard.players
$execute unless score #cacard.time cacard.isongoing matches 5 store result score #cacard.agentHand16 cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["mineral_clump"]}] 0

# ===== 4. 清空槽位动作（1~10）：槽有卡 且 未禁用 =====
$execute if items entity @e[tag=cacard.$(team)0] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)0,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[1] set value 1b
$execute if items entity @e[tag=cacard.$(team)1] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)1,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[2] set value 1b
$execute if items entity @e[tag=cacard.$(team)2] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)2,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[3] set value 1b
$execute if items entity @e[tag=cacard.$(team)3] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)3,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[4] set value 1b
$execute if items entity @e[tag=cacard.$(team)4] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)4,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[5] set value 1b
$execute if items entity @e[tag=cacard.$(team)5] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)5,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[6] set value 1b
$execute if items entity @e[tag=cacard.$(team)6] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)6,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[7] set value 1b
$execute if items entity @e[tag=cacard.$(team)7] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)7,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[8] set value 1b
$execute if items entity @e[tag=cacard.$(team)8] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)8,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[9] set value 1b
$execute if items entity @e[tag=cacard.$(team)9] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)9,tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[10] set value 1b

# ===== 5. 放置动作（11~350）：17 卡 × 10 槽，索引 = 11 + 卡k*20 + 槽s*2 + 型t =====
# 卡0 iron_ingot
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand0",add:11,mod:12}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand0",add:13,mod:14}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand0",add:15,mod:16}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand0",add:17,mod:18}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand0",add:19,mod:20}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand0",add:21,mod:22}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand0",add:23,mod:24}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand0",add:25,mod:26}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand0",add:27,mod:28}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand0",add:29,mod:30}
# 卡1 gold_ingot
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand1",add:31,mod:32}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand1",add:33,mod:34}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand1",add:35,mod:36}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand1",add:37,mod:38}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand1",add:39,mod:40}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand1",add:41,mod:42}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand1",add:43,mod:44}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand1",add:45,mod:46}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand1",add:47,mod:48}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand1",add:49,mod:50}
# 卡2 diamond
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand2",add:51,mod:52}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand2",add:53,mod:54}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand2",add:55,mod:56}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand2",add:57,mod:58}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand2",add:59,mod:60}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand2",add:61,mod:62}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand2",add:63,mod:64}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand2",add:65,mod:66}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand2",add:67,mod:68}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand2",add:69,mod:70}
# 卡3 gunpowder
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand3",add:71,mod:72}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand3",add:73,mod:74}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand3",add:75,mod:76}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand3",add:77,mod:78}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand3",add:79,mod:80}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand3",add:81,mod:82}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand3",add:83,mod:84}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand3",add:85,mod:86}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand3",add:87,mod:88}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand3",add:89,mod:90}
# 卡4 stick
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand4",add:91,mod:92}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand4",add:93,mod:94}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand4",add:95,mod:96}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand4",add:97,mod:98}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand4",add:99,mod:100}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand4",add:101,mod:102}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand4",add:103,mod:104}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand4",add:105,mod:106}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand4",add:107,mod:108}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand4",add:109,mod:110}
# 卡5 log
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand5",add:111,mod:112}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand5",add:113,mod:114}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand5",add:115,mod:116}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand5",add:117,mod:118}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand5",add:119,mod:120}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand5",add:121,mod:122}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand5",add:123,mod:124}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand5",add:125,mod:126}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand5",add:127,mod:128}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand5",add:129,mod:130}
# 卡6 plank
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand6",add:131,mod:132}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand6",add:133,mod:134}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand6",add:135,mod:136}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand6",add:137,mod:138}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand6",add:139,mod:140}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand6",add:141,mod:142}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand6",add:143,mod:144}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand6",add:145,mod:146}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand6",add:147,mod:148}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand6",add:149,mod:150}
# 卡7 apple
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand7",add:151,mod:152}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand7",add:153,mod:154}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand7",add:155,mod:156}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand7",add:157,mod:158}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand7",add:159,mod:160}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand7",add:161,mod:162}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand7",add:163,mod:164}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand7",add:165,mod:166}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand7",add:167,mod:168}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand7",add:169,mod:170}
# 卡8 wheat
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand8",add:171,mod:172}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand8",add:173,mod:174}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand8",add:175,mod:176}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand8",add:177,mod:178}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand8",add:179,mod:180}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand8",add:181,mod:182}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand8",add:183,mod:184}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand8",add:185,mod:186}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand8",add:187,mod:188}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand8",add:189,mod:190}
# 卡9 another_two
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand9",add:191,mod:192}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand9",add:193,mod:194}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand9",add:195,mod:196}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand9",add:197,mod:198}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand9",add:199,mod:200}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand9",add:201,mod:202}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand9",add:203,mod:204}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand9",add:205,mod:206}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand9",add:207,mod:208}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand9",add:209,mod:210}
# 卡10 deal
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand10",add:211,mod:212}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand10",add:213,mod:214}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand10",add:215,mod:216}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand10",add:217,mod:218}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand10",add:219,mod:220}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand10",add:221,mod:222}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand10",add:223,mod:224}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand10",add:225,mod:226}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand10",add:227,mod:228}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand10",add:229,mod:230}
# 卡11 newly_wheat
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand11",add:231,mod:232}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand11",add:233,mod:234}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand11",add:235,mod:236}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand11",add:237,mod:238}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand11",add:239,mod:240}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand11",add:241,mod:242}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand11",add:243,mod:244}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand11",add:245,mod:246}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand11",add:247,mod:248}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand11",add:249,mod:250}
# 卡12 newly_bread
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand12",add:251,mod:252}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand12",add:253,mod:254}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand12",add:255,mod:256}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand12",add:257,mod:258}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand12",add:259,mod:260}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand12",add:261,mod:262}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand12",add:263,mod:264}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand12",add:265,mod:266}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand12",add:267,mod:268}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand12",add:269,mod:270}
# 卡13 rotten
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand13",add:271,mod:272}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand13",add:273,mod:274}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand13",add:275,mod:276}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand13",add:277,mod:278}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand13",add:279,mod:280}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand13",add:281,mod:282}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand13",add:283,mod:284}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand13",add:285,mod:286}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand13",add:287,mod:288}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand13",add:289,mod:290}
# 卡14 head
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand14",add:291,mod:292}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand14",add:293,mod:294}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand14",add:295,mod:296}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand14",add:297,mod:298}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand14",add:299,mod:300}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand14",add:301,mod:302}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand14",add:303,mod:304}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand14",add:305,mod:306}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand14",add:307,mod:308}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand14",add:309,mod:310}
# 卡15 head_zombie
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand15",add:311,mod:312}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand15",add:313,mod:314}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand15",add:315,mod:316}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand15",add:317,mod:318}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand15",add:319,mod:320}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand15",add:321,mod:322}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand15",add:323,mod:324}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand15",add:325,mod:326}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand15",add:327,mod:328}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand15",add:329,mod:330}
# 卡16 mineral
$function cacardwar:agent/action_mask_place {team:$(team),slot:0,hand:"#cacard.agentHand16",add:331,mod:332}
$function cacardwar:agent/action_mask_place {team:$(team),slot:1,hand:"#cacard.agentHand16",add:333,mod:334}
$function cacardwar:agent/action_mask_place {team:$(team),slot:2,hand:"#cacard.agentHand16",add:335,mod:336}
$function cacardwar:agent/action_mask_place {team:$(team),slot:3,hand:"#cacard.agentHand16",add:337,mod:338}
$function cacardwar:agent/action_mask_place {team:$(team),slot:4,hand:"#cacard.agentHand16",add:339,mod:340}
$function cacardwar:agent/action_mask_place {team:$(team),slot:5,hand:"#cacard.agentHand16",add:341,mod:342}
$function cacardwar:agent/action_mask_place {team:$(team),slot:6,hand:"#cacard.agentHand16",add:343,mod:344}
$function cacardwar:agent/action_mask_place {team:$(team),slot:7,hand:"#cacard.agentHand16",add:345,mod:346}
$function cacardwar:agent/action_mask_place {team:$(team),slot:8,hand:"#cacard.agentHand16",add:347,mod:348}
$function cacardwar:agent/action_mask_place {team:$(team),slot:9,hand:"#cacard.agentHand16",add:349,mod:350}
