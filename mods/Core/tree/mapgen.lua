
minetest.register_alias("mapgen_tree", "apple:log")
minetest.register_alias("mapgen_leaves", "apple:leaves")
minetest.register_alias("mapgen_jungletree", "jungle:log")
minetest.register_alias("mapgen_jungleleaves", "jungle:leaves")
minetest.register_alias("mapgen_pine_tree", "pine:log")
minetest.register_alias("mapgen_pine_needles", "pine:needles")
minetest.register_alias("mapgen_acacia_tree", "acacia:log")
minetest.register_alias("mapgen_acacia_needles", "acacia:leaves")
minetest.register_alias("mapgen_aspen_tree", "aspen:log")
minetest.register_alias("mapgen_aspen_needles", "aspen:leaves")
minetest.register_alias("mapgen_apple", "apple:fruit")

function tree.register_decorations()

	-- Apple tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:grass_1", "soil:grass_2", "soil:grass_3", "soil:grass_4", "soil:grass_full_1", "soil:grass_full_2", "soil:grass_full_3", "soil:grass_full_4"},
		sidelen = 16,
		noise_params = {
			offset = 0.036,
			scale = 0.022,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:grass_1", "soil:grass_2", "soil:grass_3", "soil:grass_4", "soil:grass_full_1", "soil:grass_full_2", "soil:grass_full_3", "soil:grass_full_4"},
		sidelen = 16,
		noise_params = {
			offset = 0.0018,
			scale = 0.0011,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/apple_log.mts",
		flags = "place_center_x",
		rotation = "random",
	})

	-- Jungle tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:rainforest", "soil:dirt"},
		sidelen = 16,
		fill_ratio = 0.1,
		biomes = {"rainforest", "rainforest_swamp"},
		y_min = -1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:rainforest", "group:dirt"},
		sidelen = 16,
		fill_ratio = 0.005,
		biomes = {"rainforest", "rainforest_swamp"},
		y_min = 1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/jungle_log.mts",
		flags = "place_center_x",
		rotation = "random",
	})

	-- Taiga and temperate coniferous forest pine tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:snow", "soil:grass_1", "soil:grass_2", "soil:grass_3", "soil:grass_4", "soil:grass_full_1", "soil:grass_full_2", "soil:grass_full_3", "soil:grass_full_4"},
		sidelen = 16,
		noise_params = {
			offset = 0.036,
			scale = 0.022,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest"},
		y_min = 2,
		y_max = 31000,
		schematic = tree.path .. "/schematics/pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:snow", "soil:grass_1", "soil:grass_2", "soil:grass_3", "soil:grass_4", "soil:grass_full_1", "soil:grass_full_2", "soil:grass_full_3", "soil:grass_full_4"},
		sidelen = 80,
		noise_params = {
			offset = 0.0018,
			scale = 0.0011,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/pine_log.mts",
		flags = "place_center_x",
		rotation = "random",
	})

	-- Acacia tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/acacia_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/acacia_log.mts",
		flags = "place_center_x",
		rotation = "random",
	})

	-- Aspen tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:grass_1", "soil:grass_2", "soil:grass_3", "soil:grass_4", "soil:grass_full_1", "soil:grass_full_2", "soil:grass_full_3", "soil:grass_full_4"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/aspen_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"soil:grass_1", "soil:grass_2", "soil:grass_3", "soil:grass_4", "soil:grass_full_1", "soil:grass_full_2", "soil:grass_full_3", "soil:grass_full_4"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.0008,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = tree.path .. "/schematics/aspen_log.mts",
		flags = "place_center_x",
		rotation = "random",
	})

local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name ~= "v6" then
	tree.register_decorations()
end
