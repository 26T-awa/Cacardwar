schedule function cacardwar:main/toreset 2t

data modify storage cacardwar:preparation_book_text title set value "\"§b§l牌§6§l牌§r§a大作战§r 信息书\""
data modify storage cacardwar:preparation_book_text content set value {text:"□■□■□§b§l牌§6§l牌§a大作战§r□■□■□■\n\n目录:\n\n",extra:[{text:" §n1.规则\n",click_event:{action:"change_page",page:2},hover_event:{action:"show_text",value:"点击跳转"}},{text:"\n"},{text:" §n2.卡组选择\n",click_event:{action:"change_page",page:3},hover_event:{action:"show_text",value:"点击跳转"}},{text:"\n"},{text:" §n3.准备[每局必选]",click_event:{action:"change_page",page:7},hover_event:{action:"show_text",value:"点击跳转"}}]}
data modify storage cacardwar:preparation_book_text rule set value [{text:"\n\n\n\n\n\n        "},{text:"§6§n[点击查询]",click_event:{action:"run_command",command:"/function cacardwar:rule/entry"}}]
data modify storage cacardwar:preparation_book_text cardset1 set value {text:"§l卡组选择§r1/4\n\n§c进攻型§7：\n17.3%铁锭   14.5%金锭\n19.1%钻石   20.1%火药\n9.7%木棍   7.3%原木\n4.2%苹果   0%小麦\n0%腐肉   0.2%头颅\n6.3%五谷丰登   1.3%赌徒的交易\n\n       ",extra:[{text:"§n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/attack"}}]}
data modify storage cacardwar:preparation_book_text cardset2 set value {text:"§l卡组选择§r2/4\n\n§d持久型§7：\n6.6%铁锭   16.4%金锭\n2.4%钻石   0%火药\n11.3%木棍   6.7%原木\n26.7%苹果   15.0%小麦\n0.6%腐肉   9.0%头颅\n5.7%五谷丰登   1.0%赌徒的交易\n\n       ",extra:[{text:"§n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/resist"}}]}
data modify storage cacardwar:preparation_book_text cardset3 set value {text:"§l卡组选择§r3/4\n\n§3召唤型§7：\n8.1%铁锭   8.4%金锭\n6.7%钻石   0%火药\n5.0%木棍   10.0%原木\n9.7%苹果   1.0%小麦\n16.7%腐肉   22.4%头颅\n5.4%五谷丰登   6.6%赌徒的交易\n\n       ",extra:[{text:"§n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/summon"}}]}
data modify storage cacardwar:preparation_book_text cardset4 set value {text:"§l卡组选择§r4/4\n\n§a均衡型§7：\n10.0%铁锭   11.4%金锭\n10.2%钻石   8.0%火药\n2.0%木棍   15.0%原木\n10.0%苹果   12.0%小麦\n3.0%腐肉   5.0%头颅\n12.8%五谷丰登   0.6%赌徒的交易\n\n       ",extra:[{text:"§n【点击选择】",hover_event:{action:"show_text",value:"【点击选择】"},click_event:{action:"run_command",command:"/function cacardwar:cardset/average"}}]}

data modify storage cacardwar:cardsetinfo red set value NULL 
data modify storage cacardwar:cardsetinfo blue set value NULL
data modify storage cacardwar:cardsetinfo winner set value NULL
data modify storage cacardwar:cardsetinfo sec set value 0
data modify storage cacardwar:cardsetinfo min set value 0

data modify storage cacardwar:version-particle number set value "§cv5.1"
data modify storage cacardwar:version-particle seed set value 0
data modify storage cacardwar:version-particle particle1 set value "dust{color:[1.0,1.0,1.0],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 4 normal @a[tag=cacard.ingame]"
data modify storage cacardwar:version-particle particle2 set value "dust{color:[0.9,0.5,0.0],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 4 normal @a[tag=cacard.ingame]"
data modify storage cacardwar:version-particle particle3 set value "dust{color:[0.0,0.8,0.9],scale:1.2} ~ ~2 ~ 0.5 0.3 0.5 0 4 normal @a[tag=cacard.ingame]"
execute store result storage cacardwar:version-particle seed long 1 run seed