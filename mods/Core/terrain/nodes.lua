--
-- Aliases for map generators
--

minetest.register_alias("mapgen_stone", "rock:stone")
minetest.register_alias("mapgen_dirt", "soil:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "soil:grass")
minetest.register_alias("mapgen_sand", "sand:sand")
minetest.register_alias("mapgen_water_source", "water:source")
minetest.register_alias("mapgen_river_water_source", "riverwater:source")
minetest.register_alias("mapgen_lava_source", "lava:source")
minetest.register_alias("mapgen_gravel", "rock:gravel")
minetest.register_alias("mapgen_desert_stone", "rock:desert")
minetest.register_alias("mapgen_desert_sand", "default:desert_sand")		-- todo
minetest.register_alias("mapgen_dirt_with_snow", "soil:snow")
minetest.register_alias("mapgen_snowblock", "default:snowblock")			-- todo
minetest.register_alias("mapgen_snow", "default:snow")						-- todo
minetest.register_alias("mapgen_ice", "default:ice")						-- todo
minetest.register_alias("mapgen_sandstone", "rock:sand")

-- Flora

minetest.register_alias("mapgen_tree", "default:tree")						-- todo
minetest.register_alias("mapgen_leaves", "default:leaves")					-- todo
minetest.register_alias("mapgen_apple", "default:apple")					-- todo
minetest.register_alias("mapgen_jungletree", "default:jungletree")			-- todo
minetest.register_alias("mapgen_jungleleaves", "default:jungleleaves")		-- todo
minetest.register_alias("mapgen_junglegrass", "default:junglegrass")		-- todo
minetest.register_alias("mapgen_pine_tree", "default:pine_tree")			-- todo
minetest.register_alias("mapgen_pine_needles", "default:pine_needles")		-- todo

-- Dungeons

minetest.register_alias("mapgen_cobble", "rock:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:cobble")		-- todo
minetest.register_alias("mapgen_mossycobble", "rock:mossycobble")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:desert_stone")	-- todo
minetest.register_alias("mapgen_sandstonebrick", "default:sandstonebrick")			-- todo
minetest.register_alias("mapgen_stair_sandstone_block", "stairs:sandstone_block") -- todo




local grass = minetest.get_content_id("soil:grass")
local grass_type = {
	minetest.get_content_id("soil:grass_1"),
	minetest.get_content_id("soil:grass_2"),
	minetest.get_content_id("soil:grass_3"),
	minetest.get_content_id("soil:grass_4")
}
minetest.register_on_generated(function(minp, maxp, seed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local data = vm:get_data()
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}

	for vi in area:iterp(minp, maxp) do
		local id = data[vi]
		if id == grass then
			--grass_id = math.random(1,4)
			data[vi] = grass_type[math.random(#grass_type)]
		end
	end

	vm:set_data(data)
	vm:write_to_map()
end)