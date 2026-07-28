function cacardwar:main/clear_item
tellraw @s {text:"§a你已经通过了基础教程，祝君好运！§r"}
scoreboard players set @s cacard.basicTuition 0
tag @s remove cacard.bt4
tag @s remove cacard.bt
scoreboard players set #cacard.time cacard.isongoing 0
function cacardwar:main/reset with storage cacardwar:preparation_book_text