tellraw @s {text:"§8- §f现在：试着合成一把钻石剑以攻击对手。（稍后可重试）§r\n"}

give @s diamond[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §b§l钻石"}],custom_data={cacardwar:["diamond","card"]}] 2
loot give @s loot cacardwar:basic_tuition
give @s stick[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- "},{"text":"§l木棍","color":"#774205","italic":false}],custom_data={cacardwar:["stick","card"]}] 1
playsound item.armor.equip_elytra master @s
playsound block.note_block.pling master @s ~ ~ ~ 0.8 0.2 0.8