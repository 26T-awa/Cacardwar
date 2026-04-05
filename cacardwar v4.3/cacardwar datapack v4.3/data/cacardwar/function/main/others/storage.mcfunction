schedule function cacardwar:main/toreset 2t

data modify storage cacardwar:preparation_book_text title set value "\"\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a7r 信息书\""
data modify storage cacardwar:preparation_book_text content set value {text:"□■□■□\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7a大作战\u00a7r□■□■□■\n\n目录:\n\n",extra:[{text:" \u00a7n1.规则\n",click_event:{action:"change_page",page:2},hover_event:{action:"show_text",value:"点击跳转"}},{text:"\n"},{text:" \u00a7n2.卡组选择\n",click_event:{action:"change_page",page:5},hover_event:{action:"show_text",value:"点击跳转"}},{text:"\n"},{text:" \u00a7n3.准备[每局必选]",click_event:{action:"change_page",page:9},hover_event:{action:"show_text",value:"点击跳转"}}]}
data modify storage cacardwar:preparation_book_text rule1 set value {text:"\u00a7l规则\u00a7r1/3\n\u00a771.开始时双方随机抽取先后手，先手获得\u00a7a4\u00a77张卡牌，后手及后续双方获得\u00a7a5\u00a77张卡牌。\n2.双方初始拥有\u00a7c20点生命值\u00a77，\u00a76胜利目标：令对手生命值为零\u00a7r\u00a77。\n3.按照\u00a76合成配方\u00a7r\u00a77摆放卡牌来进行\u00a7c攻击\u00a77、\u00a7d回复\u00a77、\u00a73防御\u00a77等。\n4.每回合结束后你将\u00a7c失去所有卡牌\u00a77。\n5.你可以在\u00a73末地传送门框架\u00a77上的物品展示框存放\u00a7a一张卡牌\u00a77。"}
data modify storage cacardwar:preparation_book_text rule2 set value {text:"\u00a7l规则\u00a7r2/3\n\u00a776.\u00a7f剑伤\u00a77无视\u00a76金护盾\u00a77；\u00a7c火药伤\u00a77无视\u00a7f铁护盾\u00a77。\n\u00a777.你可以自由选择\u00a7a4\u00a77套卡组：\u00a7c进攻型\u00a77、\u00a7d持久型\u00a77、\u00a73召唤型\u00a77、\u00a7a均衡型\u00a77。\n\u00a778.放置卡牌时请慎重，因为放错后移动卡牌将导致\u00a7c该卡牌消失\u00a77。\n\u00a779.因技术原因\u00a7c请勿丢弃、带出卡牌，请勿破坏场地（尤其物品展示框）！\n\u00a7710.游戏开始前请\u00a76清空物品栏\u00a77以防止物品消失。\u00a7r"}
data modify storage cacardwar:preparation_book_text rule3 set value {text:"\u00a7l规则\u00a7r3/3\n\u00a7711.确保游戏难度\u00a7c不为和平\u00a7r\u00a77，否则召唤物将无法生成。\n\u00a7712.一个存档只允许一个场地存在！\n\u00a7713.\u00a7n玩得开心！(gl & hf)"}
data modify storage cacardwar:preparation_book_text cardset1 set value {text:"\u00a7l卡组选择\u00a7r1/4\n\n\u00a7c进攻型\u00a77：\n17%铁锭 14%金锭 19%钻石\n\n 20%火药 10%木棍 7%原木\n\n 4%苹果 0%小麦 0%腐肉\n\n       8%五谷丰登\n      1%赌徒的交易\n       ",extra:[{text:"\u00a7n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/attack"}}]}
data modify storage cacardwar:preparation_book_text cardset2 set value {text:"\u00a7l卡组选择\u00a7r2/4\n\n\u00a7d持久型\u00a77：\n 6%铁锭 12%金锭 1%钻石\n\n 0%火药 10%木棍 9%原木\n\n 24%苹果 28%小麦 1%腐肉\n\n       8%五谷丰登\n      1%赌徒的交易\n       ",extra:[{text:"\u00a7n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/resist"}}]}
data modify storage cacardwar:preparation_book_text cardset3 set value {text:"\u00a7l卡组选择\u00a7r3/4\n\n\u00a73召唤型\u00a77：\n 6%铁锭 7%金锭 5%钻石\n\n 0%火药 23%木棍 19%原木\n\n 3%苹果 0%小麦 26%腐肉\n\n       8%五谷丰登\n      3%赌徒的交易\n       ",extra:[{text:"\u00a7n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/summon"}}]}
data modify storage cacardwar:preparation_book_text cardset4 set value {text:"\u00a7l卡组选择\u00a7r4/4\n\n\u00a7a均衡型\u00a77：\n 11%铁锭 10%金锭 10%钻石\n\n 10%火药 12%木棍 11%原木\n\n 10%苹果 10%小麦 3%腐肉\n\n       12%五谷丰登\n      1%赌徒的交易\n       ",extra:[{text:"\u00a7n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/average"}}]}

data modify storage cacardwar:recipe_book page1 set value {raw:"\u00a761.铁/金/钻石剑：造成\u00a7c5/4/6点伤害\n\u00a77  ○■○\n  ○■○  → 铁/金/钻石剑\n  ○| ○\n■:铁锭/金锭/钻石,|:木棍；任意一列\n\n\u00a762.面包：回复\u00a7d6点生命值\n\u00a77  ○○○\n  YYY    →  面包\n  ○○○\nY:小麦；任意一行\n"}
data modify storage cacardwar:recipe_book page2 set value {raw:"\u00a763.金苹果：回复\u00a7d30点生命值\n\u00a77  ○■○\n  ■●■    →  金苹果\n  ○■○\n■:金锭,●:苹果\n\n\u00a764.苹果：回复\u00a7d3点生命值\n\u00a77  ○●○\n  ○○○\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框\n"}
data modify storage cacardwar:recipe_book page3 set value {raw:"\u00a765.火弹：造成\u00a7c6点伤害\u00a76\n\u00a77  ○○○\n  ●●●    →  火弹\n  ○○○\n●:火药；任意一行\n\n\u00a766.烈焰剑：造成\u00a7c5点伤害\u00a76\n\u00a77  ○●○\n  ○●○    →  烈焰剑\n  ○■○\n●:火药,■:原木；任意一列"}
data modify storage cacardwar:recipe_book page4 set value {raw:"\u00a767.炸药桶：造成\u00a7c7点伤害\u00a76\n\u00a77  ■M■\n  ■●■    →  炸药桶\n  ■■■\n●:火药,■:木板,M:铁锭\n\n\u00a768.巨型炸药桶：造成\u00a7c15点伤害\u00a76，如果有金盾则能穿透金盾并造成\u00a7c2点伤害\u00a76\n\u00a77  ●M●\n  ■●■    →  巨型炸药桶\n  ●■●\n●:火药,■:木板,M:铁锭\n"}
data modify storage cacardwar:recipe_book page5 set value {raw:"\u00a769.铁/金盾牌：形成\u00a73免疫护盾\u00a76，\u00a73免疫一次剑伤（铁盾牌）或火伤（金盾牌），铁盾牌和金盾牌可同时存在\n\u00a77  ■M■\n  ■■■    →  铁/金盾牌\n  ○■○\n■:木板,M:铁锭/金锭"}
data modify storage cacardwar:recipe_book page6 set value {raw:"\u00a7610.铁/钻石镐：\u00a73夺取对方的一个物品，并且\u00a7b钻石镐\u00a73将获得额外加成\n\u00a77  ■■■\n  ○| ○    →  铁/钻石镐\n  ○| ○\n■:铁锭/钻石,| :木棍\n\n\u00a7611.原木：可合成4个木板\n\u00a77  ○●○\n  ○○○    →  木板*4\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框"}
data modify storage cacardwar:recipe_book page7 set value {raw:"\u00a7612.木板：可合成2个木棍\n\u00a77  ○■○\n  ○■○    →  木棍*2\n  ○○○\n■:木板；固定位置"}
data modify storage cacardwar:recipe_book page8 set value {raw:"\u00a7613.腐肉：回复\u00a7d2点生命值\u00a76，并获得\u00a7c饥饿\u00a76效果（回复类道具效果减半，效果持续到下一次使用回复类道具结束）\n\u00a77  ○●○\n  ○○○\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框\n"}
data modify storage cacardwar:recipe_book page9 set value {raw:"\u00a7314.召唤物·僵尸：召唤一只僵尸，每回合结束后造成\u00a7c4点伤害\u00a73，无视任何护盾，持续\u00a732回合\n\u00a77  | | |\n  ○| ○    →  生成僵尸\n  ■●■\n■:原木,| :木棍,●:腐肉"}
data modify storage cacardwar:recipe_book page10 set value {raw:"\u00a7315.召唤物·商人：召唤一名商人，每回合开始后获得额外\u00a7a4张卡牌\u00a73，持续\u00a734回合\n\u00a77  ◇◇◇\n  ○♦○    →  生成商人\n  ■●□\n◇:木板,■:金锭,\n●:钻石,□:铁锭,♦:赌徒的交易\n"}
data modify storage cacardwar:recipe_book page11 set value {raw:"\u00a7616.五谷丰登：获得\u00a7a额外的2张卡牌\n\u00a77  ○●○\n  ○○○\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框"}
data modify storage cacardwar:recipe_book page12 set value {raw:"\u00a7517.赌徒的交易：令对手的生命值减半，但你将失去所有卡牌\n\u00a77  ○●○\n  ○○○\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框"}
data modify storage cacardwar:recipe_book title set value {raw:"\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a7r 信息书"}

data modify storage cacardwar:cardsetinfo red set value NULL 
data modify storage cacardwar:cardsetinfo blue set value NULL
data modify storage cacardwar:cardsetinfo winner set value NULL
data modify storage cacardwar:cardsetinfo sec set value 0
data modify storage cacardwar:cardsetinfo min set value 0

data modify storage cacardwar:verson-particle number set value "\u00a76v4.3"
data modify storage cacardwar:verson-particle seed set value 0
data modify storage cacardwar:verson-particle particle1 set value "dust{color:[1.0,1.0,1.0],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]"
data modify storage cacardwar:verson-particle particle2 set value "dust{color:[0.9,0.5,0.0],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]"
data modify storage cacardwar:verson-particle particle3 set value "dust{color:[0.0,0.8,0.9],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]"
execute store result storage cacardwar:verson-particle seed long 1 run seed