execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:ai/calculation/rule1 {arg1:2}

$give @a[tag=cacard.$(team)Team,limit=1] zombie_head[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §3§l僵尸头颅"}],custom_data={cacardwar:["head","head_zombie","card","card16"],cacard.recipe14:true},custom_model_data={strings:["cacardwar:head_zombie"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 1

$data remove entity @e[tag=cacard.$(team)2,limit=1] Item
$data remove entity @e[tag=cacard.$(team)5,limit=1] Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e合成了§3僵尸头颅"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}

execute if score #cacard.time cacard.isongoing matches 5 run schedule function cacardwar:ai/constructor/cst_after 10t