fluid = {}
fluid.path = minetest.get_modpath("fluid")

dofile(fluid.path.."/nodes.lua")
dofile(fluid.path.."/mapgen.lua")