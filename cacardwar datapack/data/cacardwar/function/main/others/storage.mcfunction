schedule function cacardwar:main/toreset 2t

data modify storage cacardwar:preparation_book_text title set value "\"§b§l牌§6§l牌§r§a大作战§r 信息书\""
data modify storage cacardwar:preparation_book_text content set value {text:"□■□■□§b§l牌§6§l牌§a大作战§r□■□■□■\n\n目录:\n\n",extra:[{text:" §n1.规则\n",click_event:{action:"change_page",page:2},hover_event:{action:"show_text",value:"点击跳转"}},{text:"\n"},{text:" §n2.卡组选择\n",click_event:{action:"change_page",page:5},hover_event:{action:"show_text",value:"点击跳转"}},{text:"\n"},{text:" §n3.准备[每局必选]",click_event:{action:"change_page",page:9},hover_event:{action:"show_text",value:"点击跳转"}}]}
data modify storage cacardwar:preparation_book_text rule1 set value {text:"§l规则§r1/3\n§71.开始时双方随机抽取先后手，先手获得§a4§7张卡牌，后手及后续双方获得§a5§7张卡牌。\n2.双方初始拥有§c20点生命值§7，§6胜利目标：令对手生命值为零§r§7。\n3.按照§6合成配方§r§7摆放卡牌来进行§c攻击§7、§d回复§7、§3防御§7等。\n4.每回合结束后你将§c失去所有卡牌§7。\n5.你可以在§3末地传送门框架§7上的物品展示框存放§a一张卡牌§7。"}
data modify storage cacardwar:preparation_book_text rule2 set value {text:"§l规则§r2/3\n§76.§f剑伤§7无视§6金护盾§7；§c火药伤§7无视§f铁护盾§7。\n§77.你可以自由选择§a4§7套卡组：§c进攻型§7、§d持久型§7、§3召唤型§7、§a均衡型§7。\n§78.放置卡牌时请慎重，因为放错后移动卡牌将导致§c该卡牌消失§7。\n§79.因技术原因§c请勿丢弃、带出卡牌，请勿破坏场地（尤其物品展示框）！\n§710.游戏开始前请§6清空物品栏§7以防止物品消失。§r"}
data modify storage cacardwar:preparation_book_text rule3 set value {text:"§l规则§r3/3\n§711.确保游戏难度§c不为和平§r§7，否则召唤物将无法生成。\n§712.一个存档只允许一个场地存在！\n§713.§n玩得开心！(gl & hf)"}
data modify storage cacardwar:preparation_book_text cardset1 set value {text:"§l卡组选择§r1/4\n\n§c进攻型§7：\n17%铁锭 14%金锭 19%钻石\n\n 20%火药 10%木棍 7%原木\n\n 4%苹果 0%小麦 0%腐肉\n\n       8%五谷丰登\n      1%赌徒的交易\n       ",extra:[{text:"§n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/attack"}}]}
data modify storage cacardwar:preparation_book_text cardset2 set value {text:"§l卡组选择§r2/4\n\n§d持久型§7：\n 6%铁锭 12%金锭 1%钻石\n\n 0%火药 10%木棍 9%原木\n\n 24%苹果 28%小麦 1%腐肉\n\n       8%五谷丰登\n      1%赌徒的交易\n       ",extra:[{text:"§n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/resist"}}]}
data modify storage cacardwar:preparation_book_text cardset3 set value {text:"§l卡组选择§r3/4\n\n§3召唤型§7：\n 6%铁锭 7%金锭 5%钻石\n\n 0%火药 23%木棍 19%原木\n\n 3%苹果 0%小麦 26%腐肉\n\n       8%五谷丰登\n      3%赌徒的交易\n       ",extra:[{text:"§n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/summon"}}]}
data modify storage cacardwar:preparation_book_text cardset4 set value {text:"§l卡组选择§r4/4\n\n§a均衡型§7：\n 11%铁锭 10%金锭 10%钻石\n\n 10%火药 12%木棍 11%原木\n\n 10%苹果 10%小麦 3%腐肉\n\n       12%五谷丰登\n      1%赌徒的交易\n       ",extra:[{text:"§n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/average"}}]}

data modify storage cacardwar:recipe_book page1 set value {raw:"§61.铁/金/钻石剑：造成§c5/4/6点伤害\n§7  ○■○\n  ○■○  → 铁/金/钻石剑\n  ○| ○\n■:铁锭/金锭/钻石,|:木棍；任意一列\n\n§62.面包：回复§d6点生命值\n§7  ○○○\n  YYY    →  面包\n  ○○○\nY:小麦；任意一行\n"}
data modify storage cacardwar:recipe_book page2 set value {raw:"§63.金苹果：回复§d30点生命值\n§7  ○■○\n  ■●■    →  金苹果\n  ○■○\n■:金锭,●:苹果\n\n§64.苹果：回复§d3点生命值\n§7  ○●○\n  ○○○\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框\n"}
data modify storage cacardwar:recipe_book page3 set value {raw:"§65.火弹：造成§c6点伤害§6\n§7  ○○○\n  ●●●    →  火弹\n  ○○○\n●:火药；任意一行\n\n§66.烈焰剑：造成§c5点伤害§6\n§7  ○●○\n  ○●○    →  烈焰剑\n  ○■○\n●:火药,■:原木；任意一列"}
data modify storage cacardwar:recipe_book page4 set value {raw:"§67.炸药桶：造成§c7点伤害§6\n§7  ■M■\n  ■●■    →  炸药桶\n  ■■■\n●:火药,■:木板,M:铁锭\n\n§68.巨型炸药桶：造成§c15点伤害§6，如果有金盾则能穿透金盾并造成§c2点伤害§6\n§7  ●M●\n  ■●■    →  巨型炸药桶\n  ●■●\n●:火药,■:木板,M:铁锭\n"}
data modify storage cacardwar:recipe_book page5 set value {raw:"§69.铁/金盾牌：形成§3免疫护盾§6，§3免疫一次剑伤（铁盾牌）或火伤（金盾牌），铁盾牌和金盾牌可同时存在\n§7  ■M■\n  ■■■    →  铁/金盾牌\n  ○■○\n■:木板,M:铁锭/金锭"}
data modify storage cacardwar:recipe_book page6 set value {raw:"§610.铁/钻石镐：§3夺取对方的一个物品，并且§b钻石镐§3将获得额外加成\n§7  ■■■\n  ○| ○    →  铁/钻石镐\n  ○| ○\n■:铁锭/钻石,| :木棍\n\n§611.原木：可合成4个木板\n§7  ○●○\n  ○○○    →  木板*4\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框"}
data modify storage cacardwar:recipe_book page7 set value {raw:"§612.木板：可合成2个木棍\n§7  ○■○\n  ○■○    →  木棍*2\n  ○○○\n■:木板；固定位置"}
data modify storage cacardwar:recipe_book page8 set value {raw:"§613.腐肉：回复§d2点生命值§6，并获得§c饥饿§6效果（回复类道具效果减半，效果持续到下一次使用回复类道具结束）\n§7  ○●○\n  ○○○\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框\n"}
data modify storage cacardwar:recipe_book page9 set value {raw:"§314.召唤物·僵尸：召唤一只僵尸，每回合结束后造成§c4点伤害§3，无视任何护盾，持续§32回合\n§7  | | |\n  ○| ○    →  生成僵尸\n  ■●■\n■:原木,| :木棍,●:腐肉"}
data modify storage cacardwar:recipe_book page10 set value {raw:"§315.召唤物·商人：召唤一名商人，每回合开始后获得额外§a4张卡牌§3，持续§34回合\n§7  ◇◇◇\n  ○♦○    →  生成商人\n  ■●□\n◇:木板,■:金锭,\n●:钻石,□:铁锭,♦:赌徒的交易\n"}
data modify storage cacardwar:recipe_book page11 set value {raw:"§616.五谷丰登：获得§a额外的2张卡牌\n§7  ○●○\n  ○○○\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框"}
data modify storage cacardwar:recipe_book page12 set value {raw:"§517.赌徒的交易：令对手的生命值减半，但你将失去所有卡牌\n§7  ○●○\n  ○○○\n  ○○○\n无合成配方，可直接使用，需放在荧光物品展示框"}
data modify storage cacardwar:recipe_book title set value {raw:"§b§l牌§6§l牌§r§a大作战§r 信息书"}

data modify storage cacardwar:cardsetinfo red set value NULL 
data modify storage cacardwar:cardsetinfo blue set value NULL
data modify storage cacardwar:cardsetinfo winner set value NULL
data modify storage cacardwar:cardsetinfo sec set value 0
data modify storage cacardwar:cardsetinfo min set value 0

data modify storage cacardwar:verson-particle number set value "§6v4.3"
data modify storage cacardwar:verson-particle seed set value 0
data modify storage cacardwar:verson-particle particle1 set value "dust{color:[1.0,1.0,1.0],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]"
data modify storage cacardwar:verson-particle particle2 set value "dust{color:[0.9,0.5,0.0],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]"
data modify storage cacardwar:verson-particle particle3 set value "dust{color:[0.0,0.8,0.9],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]"
execute store result storage cacardwar:verson-particle seed long 1 run seed