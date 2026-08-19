scoreboard players add #cacard.recipe_lore cacard.time 1
# e. 分数达到 m+1（17）时回到 1
execute if score #cacard.recipe_lore cacard.time matches 17.. run scoreboard players set #cacard.recipe_lore cacard.time 1
# d. 当分数为 k 时，更改所有在场(cacard.ingame)玩家手持中含有标签 cacard.recipek 的物品的 Lore
execute if score #cacard.recipe_lore cacard.time matches 1 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe1:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern1
execute if score #cacard.recipe_lore cacard.time matches 2 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe2:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern2
execute if score #cacard.recipe_lore cacard.time matches 3 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe3:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern3
execute if score #cacard.recipe_lore cacard.time matches 4 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe4:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern4
execute if score #cacard.recipe_lore cacard.time matches 5 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe5:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern5
execute if score #cacard.recipe_lore cacard.time matches 6 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe6:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern6
execute if score #cacard.recipe_lore cacard.time matches 7 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe7:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern7
execute if score #cacard.recipe_lore cacard.time matches 8 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe8:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern8
execute if score #cacard.recipe_lore cacard.time matches 9 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe9:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern9
execute if score #cacard.recipe_lore cacard.time matches 10 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe10:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern10
execute if score #cacard.recipe_lore cacard.time matches 11 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe11:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern11
execute if score #cacard.recipe_lore cacard.time matches 12 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe12:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern12
execute if score #cacard.recipe_lore cacard.time matches 13 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe13:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern13
execute if score #cacard.recipe_lore cacard.time matches 14 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe14:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern14
execute if score #cacard.recipe_lore cacard.time matches 15 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe15:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern15
execute if score #cacard.recipe_lore cacard.time matches 16 as @a[tag=cacard.ingame] if items entity @s weapon.mainhand *[custom_data~{cacard.recipe16:true}] run item modify entity @s weapon.mainhand cacardwar:recipe_pattern16
