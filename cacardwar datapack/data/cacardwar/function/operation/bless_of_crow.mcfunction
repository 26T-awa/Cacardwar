$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.hungry] at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 1 normal
$execute at @e[tag=cacard.$(team)5] run particle dust_color_transition{from_color:[0.5,0.85,0],scale:2,to_color:[0.35,0.2,0]} ~ ~2 ~ 0.2 0.2 0.2 0 20 normal

$execute if entity @a[tag=cacard.$(team)Team,tag=!cacard.bless_of_crow] run tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e获得了§5乌鸦的祝福"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$give @a[tag=cacard.$(team)Team] bread[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §a§l新生的面包"}],custom_data={cacardwar:["newly_bread","card"]},custom_model_data={strings:["cacardwar:newly_bread"]},lore=[{text:"§7§o该物品不参与任何复杂配方。"}]] 1
$tag @a[tag=cacard.$(team)Team,tag=!cacard.bless_of_crow] add cacard.bless_of_crow