function cacardwar:main/clear_item
execute as @e[tag=cacard.red] run data remove entity @s Item
data remove entity @e[tag=cacard.red0,limit=1] Item
give @s apple[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §c§l苹果"}],custom_data={cacardwar:["apple","card"],cacard.recipe7:true},custom_model_data={strings:["cacardwar:apple"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 1
give @s wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l小麦"}],custom_data={cacardwar:["wheat","card"],cacard.recipe6:true,cacard.recipe16:true},custom_model_data={strings:["cacardwar:wheat"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 3
give @s rotten_flesh[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §4§l腐肉"}],custom_data={cacardwar:["rotten","card"],cacard.recipe13:true},custom_model_data={strings:["cacardwar:rotten"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 1
playsound item.armor.equip_elytra master @s
playsound block.note_block.pling master @s ~ ~ ~ 0.8 0.2 0.8
execute if entity @a[tag=cacard.enable_steal_diamond] if entity @e[nbt={Item:{components:{"minecraft:custom_data":{cacardwar:[wheat]}}}}] run give @a[] wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l小麦"}],custom_data={cacardwar:["wheat","card"],cacard.recipe6:true,cacard.recipe16:true},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 3
scoreboard players set #cacard.redHealth cacard.health 5
scoreboard players set @s cacard.basicTuition 261