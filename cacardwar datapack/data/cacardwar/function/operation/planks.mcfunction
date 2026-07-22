$give @a[tag=cacard.$(team)Team,limit=1] stick[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- "},{text:"§l木棍",color:"#774205",italic:false}],custom_data={cacardwar:["stick","card"]},custom_model_data={strings:["cacardwar:stick"]}] 2

$data remove entity @e[tag=cacard.$(team)2,limit=1] Item
$data remove entity @e[tag=cacard.$(team)5,limit=1] Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e用"},{text:"木板",color:"#c2a203"},{text:"§e合成了"},{text:"木棍",color:"#774205"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}