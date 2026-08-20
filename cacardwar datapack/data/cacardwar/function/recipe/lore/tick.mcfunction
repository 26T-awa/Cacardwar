# ===== 配方 Lore 切换（每 tick 调用） =====
# b. 局内时间戳对 100 取模，值为 0 时 #cacard.recipe_lore +1
scoreboard players operation #cacard.recipeTime cacard.time = #cacard.time cacard.time
scoreboard players operation #cacard.recipeTime cacard.time %= #cacard.recipeInterval cacard.time
execute if score #cacard.recipeTime cacard.time matches 1 run function cacardwar:recipe/lore/change