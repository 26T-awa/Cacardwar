$give @a[tag=cacard.$(team)Team,limit=1] zombie_head[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §3§l僵尸头颅"}],custom_data={cacardwar:["head","head_zombie","card","card16"],cacard.recipe14:true},custom_model_data={strings:["cacardwar:head_zombie"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 1

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e合成了§3僵尸头颅"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}