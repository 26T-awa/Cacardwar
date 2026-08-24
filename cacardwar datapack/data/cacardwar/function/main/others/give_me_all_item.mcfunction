give @s lime_concrete[enchantment_glint_override=true,custom_name=[{text:"§a按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§a跳过你的回合"}],custom_data={cacardwar:["skip","non-card"]},custom_model_data={strings:["cacardwar:skip"]},lore=[]]

give @s barrier[enchantment_glint_override=true,custom_name={text:"§c现在不是你的回合"},custom_data={cacardwar:["none","non-card"]},custom_model_data={strings:["cacardwar:none"]},lore=[]]

give @s red_concrete[enchantment_glint_override=true,custom_name={text:"§c对局中断！"},custom_data={cacardwar:["stop","non-card"]},custom_model_data={strings:["cacardwar:stop"]},lore=[{text:"§6这通常源于您的对手现处于离线状态。"},{text:"§6您可以选择§c重置游戏§6或§a等待对手上线§6。"},{text:"§c§l请不要移动此物品的位置！"}]]

give @s barrier[enchantment_glint_override=true,custom_name={text:"§7操作 - §c清空槽位"},custom_data={cacardwar:["ai_act","ai_act_clear_slot","non-card"]},custom_model_data={strings:["cacardwar:ai_act_clear_slot"]},lore=[{text:"§a按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§a执行操作 §7- §c清空一个已经有卡牌的槽位"}]]

give @s paper[enchantment_glint_override=true,custom_name={text:"§7操作 - §b放置卡牌"},custom_data={cacardwar:["ai_act","ai_act_place","non-card"]},custom_model_data={strings:["cacardwar:ai_act_place"]},lore=[{text:"§a按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§a执行操作 §7- §b向一个空槽位放置已有卡牌"}]]

give @s lime_concrete[enchantment_glint_override=true,custom_name={text:"§7操作 - §a跳过回合"},custom_data={cacardwar:["ai_act","ai_act_skip","non-card"]},custom_model_data={strings:["cacardwar:ai_act_skip"]},lore=[{text:"§a按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§a执行操作 §7- §a跳过回合，并记录一个完整的训练样本"}]]

#give @s lime_concrete[enchantment_glint_override=true,custom_name={text:"§a槽位0~9"},custom_data={cacardwar:["ai_act","slot0~9","non-card"]},custom_model_data={strings:["cacardwar:ai_act_ai_act_slot0~9"]},lore=[{text:"§a按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§a执行操作 §7- §a选择槽位0~9"}]]
function cacardwar:main/others/loop_entry {min:0,max:10,bias:0,command:'function cacardwar:main/others/loop/func1 with storage cacardwar:loop'}

#give @s red_concrete[enchantment_glint_override=true,custom_name={text:"§c§m槽位0~9"},custom_data={cacardwar:["ai_act","disabled_slot","non-card"]},custom_model_data={strings:["cacardwar:ai_act_dis_slot"]},lore=[{text:"§c无法选择此槽位！"}]]
function cacardwar:main/others/loop_entry {min:0,max:10,bias:0,command:'function cacardwar:main/others/loop/func2 with storage cacardwar:loop'}

give @s yellow_concrete[enchantment_glint_override=true,custom_name={text:"§e将卡牌移动到副手进行操作"},custom_data={cacardwar:["ai_act","card_place_info","non-card"]},custom_model_data={strings:["cacardwar:ai_act_card_place_info"]},lore=[{text:"§e将卡牌移动到副手进行操作"}]]

#卡牌
give @s iron_ingot[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §f§l铁锭"}],custom_data={cacardwar:["iron_ingot","mineral","card","card1"],cacard.recipe1:true,cacard.recipe3:true,cacard.recipe4:true,cacard.recipe9:true,cacard.recipe10:true,cacard.recipe12:true,cacard.recipe15:true},custom_model_data={strings:["cacardwar:iron_ingot"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s gold_ingot[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §6§l金锭"}],custom_data={cacardwar:["gold_ingot","mineral","card","card2"],cacard.recipe1:true,cacard.recipe3:true,cacard.recipe4:true,cacard.recipe7:true,cacard.recipe8:true,cacard.recipe9:true,cacard.recipe12:true,cacard.recipe15:true},custom_model_data={strings:["cacardwar:gold_ingot"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s diamond[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §b§l钻石"}],custom_data={cacardwar:["diamond","mineral","card","card3"],cacard.recipe1:true,cacard.recipe3:true,cacard.recipe4:true,cacard.recipe10:true,cacard.recipe12:true,cacard.recipe15:true},custom_model_data={strings:["cacardwar:diamond"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s gunpowder[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l火药"}],custom_data={cacardwar:["gunpowder","card","card4"],cacard.recipe2:true,cacard.recipe3:true,cacard.recipe4:true,cacard.recipe5:true},custom_model_data={strings:["cacardwar:gunpowder"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s stick[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- "},{text:"§l木棍",color:"#774205","italic":false}],custom_data={cacardwar:["stick","card","card5"],cacard.recipe1:true,cacard.recipe10:true},custom_model_data={strings:["cacardwar:stick"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s oak_log[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- "},{text:"§l原木",color:"#8e7701","italic":false}],custom_data={cacardwar:["log","card","card6"],cacard.recipe5:true},custom_model_data={strings:["cacardwar:log"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s oak_planks[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- "},{text:"§l木板",color:"#c2a203","italic":false}],custom_data={cacardwar:["plank","card","card7"],cacard.recipe3:true,cacard.recipe4:true,cacard.recipe9:true,cacard.recipe11:true},custom_model_data={strings:["cacardwar:plank"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s apple[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §c§l苹果"}],custom_data={cacardwar:["apple","card","card8"],cacard.recipe7:true},custom_model_data={strings:["cacardwar:apple"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l小麦"}],custom_data={cacardwar:["wheat","card","card9"],cacard.recipe6:true,cacard.recipe16:true},custom_model_data={strings:["cacardwar:wheat"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s bundle[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §a§l五谷丰登"}],custom_data={cacardwar:["another_two","card","card10"]},custom_model_data={strings:["cacardwar:another_two"]},lore=[{text:"§7§o该物品不参与任何复杂配方。"}]]

give @s nether_star[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §5§l赌徒的交易"}],custom_data={cacardwar:["deal","card","card11"],cacard.recipe14:true},custom_model_data={strings:["cacardwar:deal"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §a§l新生的小麦"}],custom_data={cacardwar:["newly_wheat","card","card12"],cacard.recipe6:true},custom_model_data={strings:["cacardwar:newly_wheat"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s bread[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §a§l新生的面包"}],custom_data={cacardwar:["newly_bread","card","card13"]},custom_model_data={strings:["cacardwar:newly_bread"]},lore=[{text:"§7§o该物品不参与任何复杂配方。"}]]

give @s rotten_flesh[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §4§l腐肉"}],custom_data={cacardwar:["rotten","card","card14"],cacard.recipe13:true},custom_model_data={strings:["cacardwar:rotten"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s player_head[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §7§l头颅"}],custom_data={cacardwar:["head","card","card15"],cacard.recipe8:true,cacard.recipe13:true,cacard.recipe15:true,cacard.recipe16:true},custom_model_data={strings:["cacardwar:head"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s zombie_head[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §3§l僵尸头颅"}],custom_data={cacardwar:["head","head_zombie","card","card16"],cacard.recipe14:true},custom_model_data={strings:["cacardwar:head_zombie"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]

give @s resin_clump[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l矿物质"}],custom_data={cacardwar:["mineral_clump","mineral","card","card17"],cacard.recipe1:true,cacard.recipe3:true,cacard.recipe4:true,cacard.recipe12:true},custom_model_data={strings:["cacardwar:mineral"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]]