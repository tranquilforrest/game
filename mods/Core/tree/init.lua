tree = {}
tree.path = minetest.get_modpath("tree")
--tree.time={min=300,max=1500}
tree.time={min=0,max=4}

dofile(tree.path.."/functions.lua")
dofile(tree.path.."/nodes.lua")