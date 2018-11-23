--
-- Register biomes
--

-- All mapgens except mgv6

function terrain.register_biomes(upper_limit)
--[[
	minetest.register_biome({
		name = "icesheet",
		node_dust = "default:snowblock",
		node_top = "default:snowblock",
		depth_top = 1,
		node_filler = "default:snowblock",
		depth_filler = 3,
		node_stone = "default:cave_ice",
		node_water_top = "default:ice",
		depth_water_top = 10,
		node_river_water = "default:ice",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = -8,
		heat_point = 0,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "icesheet_ocean",
		node_dust = "default:snowblock",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_water_top = "default:ice",
		depth_water_top = 10,
		y_max = -9,
		y_min = -112,
		heat_point = 0,
		humidity_point = 73,
	})

	-- Tundra

	minetest.register_biome({
		name = "tundra_highland",
		node_dust = "default:snow",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 47,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra",
		node_top = "default:permafrost_with_stones",
		depth_top = 1,
		node_filler = "default:permafrost",
		depth_filler = 1,
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		vertical_blend = 4,
		y_max = 46,
		y_min = 2,
		heat_point = 0,
		humidity_point = 40,
	})
]]--
	minetest.register_biome({
		name = "tundra_beach",
		node_top = "rock:gravel",
		depth_top = 1,
		node_filler = "rock:gravel",
		depth_filler = 2,
		node_riverbed = "rock:gravel",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = 1,
		y_min = -3,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "rock:gravel",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = -4,
		y_min = -112,
		heat_point = 0,
		humidity_point = 40,
	})

	-- Taiga
--[[
	minetest.register_biome({
		name = "taiga",
		node_dust = "default:snow",
		node_top = "soil:dirt_with_snow",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 4,
		heat_point = 25,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "taiga_ocean",
		node_dust = "default:snow",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = 3,
		y_min = -112,
		heat_point = 25,
		humidity_point = 70,
	})

	-- Snowy grassland

	minetest.register_biome({
		name = "snowy_grassland",
		node_dust = "default:snow",
		node_top = "soil:dirt_with_snow",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 1,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 4,
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "snowy_grassland_ocean",
		node_dust = "default:snow",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = 3,
		y_min = -112,
		heat_point = 20,
		humidity_point = 35,
	})
]]--
	-- Grassland

	minetest.register_biome({
		name = "grassland",
		node_top = "soil:grass",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 1,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 6,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_dunes",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 2,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = 3,
		y_min = -112,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Coniferous forest
--[[
	minetest.register_biome({
		name = "coniferous_forest",
		node_top = "soil:dirt_with_coniferous_litter",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 6,
		heat_point = 45,
		humidity_point = 70,
	})
]]--
	minetest.register_biome({
		name = "coniferous_forest_dunes",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 45,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "coniferous_forest_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = 3,
		y_min = -112,
		heat_point = 45,
		humidity_point = 70,
	})

	-- Deciduous forest

	minetest.register_biome({
		name = "deciduous_forest",
		node_top = "soil:grass",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 1,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_shore",
		node_top = "soil:dirt",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = 0,
		y_min = -1,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = -2,
		y_min = -112,
		heat_point = 60,
		humidity_point = 68,
	})

	-- Desert

	minetest.register_biome({
		name = "desert",
		node_top = "sand:desert",
		depth_top = 1,
		node_filler = "sand:desert",
		depth_filler = 1,
		node_stone = "rock:desert",
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 4,
		heat_point = 92,
		humidity_point = 16,
	})

	minetest.register_biome({
		name = "desert_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_stone = "rock:desert",
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = 3,
		y_min = -112,
		heat_point = 92,
		humidity_point = 16,
	})

	-- Sandstone desert

	minetest.register_biome({
		name = "sandstone_desert",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 1,
		node_stone = "sand:stone",
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 4,
		heat_point = 60,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "sandstone_desert_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_stone = "sand:stone",
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = 3,
		y_min = -112,
		heat_point = 60,
		humidity_point = 0,
	})

	-- Cold desert
--[[
	minetest.register_biome({
		name = "cold_desert",
		node_top = "default:silver_sand",
		depth_top = 1,
		node_filler = "default:silver_sand",
		depth_filler = 1,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 4,
		heat_point = 40,
		humidity_point = 0,
	})
]]--
	minetest.register_biome({
		name = "cold_desert_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = 3,
		y_min = -112,
		heat_point = 40,
		humidity_point = 0,
	})

	-- Savanna

	minetest.register_biome({
		name = "savanna",
		node_top = "soil:grass_dry",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 1,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 1,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_shore",
		node_top = "soil:dirt",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = 0,
		y_min = -1,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = -2,
		y_min = -112,
		heat_point = 89,
		humidity_point = 42,
	})

	-- Rainforest

	minetest.register_biome({
		name = "rainforest",
		node_top = "soil:rainforest",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = upper_limit,
		y_min = 1,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "rainforest_swamp",
		node_top = "soil:dirt",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		y_max = 0,
		y_min = -1,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "rainforest_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		node_riverbed = "sand:sand",
		depth_riverbed = 2,
		vertical_blend = 1,
		y_max = -2,
		y_min = -112,
		heat_point = 86,
		humidity_point = 65,
	})

	-- Underground

	minetest.register_biome({
		name = "underground",
		y_max = -113,
		y_min = -31000,
		heat_point = 50,
		humidity_point = 50,
	})
end


-- Biomes for floatlands

-- TODO Temporary simple biomes to be replaced by special floatland biomes later.

function terrain.register_floatland_biomes(floatland_level, shadow_limit)

	minetest.register_biome({
		name = "floatland_grassland",
		node_top = "soil:grass",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 1,
		y_max = 31000,
		y_min = floatland_level + 2,
		heat_point = 50,
		humidity_point = 25,
	})
--[[
	minetest.register_biome({
		name = "floatland_coniferous_forest",
		node_top = "soil:dirt_with_coniferous_litter",
		depth_top = 1,
		node_filler = "soil:dirt",
		depth_filler = 3,
		y_max = 31000,
		y_min = floatland_level + 2,
		heat_point = 50,
		humidity_point = 75,
	})
]]--
	minetest.register_biome({
		name = "floatland_ocean",
		node_top = "sand:sand",
		depth_top = 1,
		node_filler = "sand:sand",
		depth_filler = 3,
		y_max = floatland_level + 1,
		y_min = shadow_limit,
		heat_point = 50,
		humidity_point = 50,
	})
end


