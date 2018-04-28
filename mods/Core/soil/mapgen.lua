
minetest.register_alias("mapgen_dirt", "soil:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "soil:grass")
minetest.register_alias("mapgen_dirt_with_snow", "soil:snow")
minetest.register_alias("mapgen_clay", "soil:clay")

minetest.register_ore({ 
	ore_type         = "blob",
	ore              = "soil:clay",
	wherein          = {"soil:sand"},
	clust_scarcity   = 24*24*24,
	clust_size       = 7,
	y_min            = -15,
	y_max            = 0,
	noise_threshold = 0,
	noise_params     = {
		offset=0.35,
		scale=0.2,
		spread={x=5, y=5, z=5},
		seed=-316,
		octaves=1,
		persist=0.5
	},
})

minetest.register_biome({
	name = "biome:grassland",
	--node_dust = "",
	node_top = "soil:grass",
	depth_top = 1,
	node_filler = "soil:dirt",
	depth_filler = 1,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	y_min = 5,
	y_max = 31000,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "biome:grassland_ocean",
	--node_dust = "",
	node_top = "soil:sand",
	depth_top = 1,
	node_filler = "soil:sand",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	y_min = -31000,
	y_max = 4,
	heat_point = 50,
	humidity_point = 50,
})