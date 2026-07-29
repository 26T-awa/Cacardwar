tellraw @s {text:"§8- §f现在：尽可能地回复你的生命值。（稍后可重试）§r\n"}

give @s apple[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §c§l苹果"}],custom_data={cacardwar:["apple","card"]},custom_model_data={strings:["cacardwar:apple"]}] 1
give @s wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l小麦"}],custom_data={cacardwar:["wheat","card"]},custom_model_data={strings:["cacardwar:wheat"]}] 3
give @s rotten_flesh[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §4§l腐肉"}],custom_data={cacardwar:["rotten","card"]},custom_model_data={strings:["cacardwar:rotten"]}] 1
playsound item.armor.equip_elytra master @s
playsound block.note_block.pling master @s ~ ~ ~ 0.8 0.2 0.8