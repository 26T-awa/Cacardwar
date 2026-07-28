execute if items entity @e[tag=cacard.blue2,limit=1] contents *[custom_data~{cacardwar:["rotten"]}] run function cacardwar:operation/rotten_flesh {team:blue,oppteam:red,teamcolor:aqua,teamtext:"b蓝"}

execute if items entity @e[tag=cacard.red2,limit=1] contents *[custom_data~{cacardwar:["rotten"]}] run function cacardwar:operation/rotten_flesh {team:red,oppteam:blue,teamcolor:gold,teamtext:"6红"}