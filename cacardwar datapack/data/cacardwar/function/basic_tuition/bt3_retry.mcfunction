function cacardwar:main/clear_item
execute as @e[tag=cacard.red] run data remove entity @s Item
data remove entity @e[tag=cacard.red0,limit=1] Item
give @s apple[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §c§l苹果"}],custom_data={cacardwar:["apple","card"]},custom_model_data={strings:["cacardwar:apple"]}] 1
give @s wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l小麦"}],custom_data={cacardwar:["wheat","card"]},custom_model_data={strings:["cacardwar:wheat"]}] 3
give @s rotten_flesh[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §4§l腐肉"}],custom_data={cacardwar:["rotten","card"]},custom_model_data={strings:["cacardwar:rotten"]}] 1
playsound item.armor.equip_elytra master @s
playsound block.note_block.pling master @s ~ ~ ~ 0.8 0.2 0.8
execute if entity @a[tag=cacard.enable_steal_diamond] if entity @e[nbt={Item:{components:{"minecraft:custom_data":{cacardwar:[wheat]}}}}] run give @a[] wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l小麦"}],custom_data={cacardwar:["wheat","card"]}] 3
scoreboard players set #cacard.redHealth cacard.health 5
scoreboard players set @s cacard.basicTuition 261