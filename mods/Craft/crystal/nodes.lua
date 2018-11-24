--
-- POWER CRYSTALS
--

minetest.register_node("crystal:blue", {
	description = "Blue Energy Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_blue.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 6,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:blue",
	sounds = sound.glass(),
})

minetest.register_node("crystal:empty", {
	description = "Depleted Energy Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_empty.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 3,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:empty",
	sounds = sound.glass(),
})

minetest.register_node("crystal:green", {
	description = "Green Energy Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_green.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 5,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:blue",
	sounds = sound.glass(),
})

minetest.register_node("crystal:red", {
	description = "Red Energy Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_red.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 7,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:red",
	sounds = sound.glass(),
})



--
-- DECORATIVE CRYSTALS
--

minetest.register_node("crystal:orange", {
	description = "Orange Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_orange.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 8,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:orange",
	sounds = sound.glass(),
})

minetest.register_node("crystal:pink", { -- rare
	description = "Pink Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_pink.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 8,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:pink",
	sounds = sound.glass(),
})

minetest.register_node("crystal:purple", {
	description = "Purple Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_purple.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 8,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:purple",
	sounds = sound.glass(),
})

minetest.register_node("crystal:yellow", {
	description = "Yellow Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_yellow.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 8,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:yellow",
	sounds = sound.glass(),
})


--
-- Special Crystals
--

minetest.register_node("crystal:fire", {
	description = "Fire Crystal",
	drawtype = "mesh",
	mesh = "crystal.obj",
	tiles = {{
		    name = "crystal_fire.png",
	}},
	alpha = 180,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	light_source = 15,
	groups = {choppy=2, dig_immediate=2},
	drop = "crystal:fire",
	sounds = sound.glass(),
})
