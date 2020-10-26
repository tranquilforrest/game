minetest.register_node("soil:dirt", {
	description = "Dirt",
	tiles = {
		"soil_dirt_top.png",
		{name = "soil_dirt_side.png", tileable_vertical = false}
	},
	groups = {crumbly=3, soil=1, dirt=1},
	drops = "soil:dirt",
	sounds = sound.dirt(),
})

minetest.register_node("soil:grass", {
	description = "Dirt with grass",
	tiles = {
		"soil_grass_top.png",
		{name = "soil_dirt_side.png^soil_grass_side.png", tileable_vertical = false}
	},
	groups = {crumbly=3, soil=1, dirt=1, grass=1},
	drop = 'soil:grass',
	sounds = sound.dirt({
		footstep = {name="soil_grass_footstep", gain=0.4},
	}),
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("soil:grass_"..math.random(1,4))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("soil:grass".. " "..itemstack:get_count()-(1-ret:get_count()))
	end,
})
	for i = 1, 4 do
		minetest.register_node("soil:grass_"..i, {
			description = "Dirt with grass "..i,
			tiles ={
				"soil_grass_top_"..i..".png", "soil_dirt_top.png",
				{name = "soil_dirt_side.png^soil_grass_side.png", tileable_vertical = false}
			},
			groups = {crumbly=3, soil=1, dirt=1, grass=1, not_in_creative_inventory=1},
			drop = 'soil:grass',
			sounds = sound.dirt({
				footstep = {name="soil_grass_footstep", gain=0.4},
			}),
		})
	end
	for i = 1, 4 do
		minetest.register_node("soil:grass_full_"..i, {
			description = "Dirt with grass "..i,
			tiles ={
				"soil_grass_top_"..i..".png", "soil_dirt_top.png",
				{name = "soil_grass_side_full.png", tileable_vertical = false}
			},
			groups = {crumbly=3, soil=1, dirt=1, grass=1, not_in_creative_inventory=1},
			drop = 'soil:grass',
			sounds = sound.dirt({
				footstep = {name="soil_grass_footstep", gain=0.4},
			}),
		})	
	end

minetest.register_node("soil:grass_dry", {
	description = "Dirt with dry grass",
	tiles = {
		"soil_grass_dry_top.png",
		{name = "soil_dirt_side.png^soil_grass_dry_side.png", tileable_vertical = false}
	},
	groups = {crumbly=3, soil=1, dirt=1, grass=1},
	drop = 'soil:grass_dry',
	sounds = sound.dirt({
		footstep = {name="soil_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("soil:snow", {
	description = "Dirt with Snow",
	tiles = {
		"default_snow.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png", tileable_vertical = false}
	},
	groups = {crumbly = 3, spreading_dirt_type = 1, snowy = 1},
	drop = 'default:dirt',
	sounds = sound.dirt({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
})

minetest.register_node("soil:rainforest", {
	description = "Dirt with Rainforest Litter",
	tiles = {
		"default_rainforest_litter.png", "default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png", tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = sound.dirt({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("soil:clay", {
	description = "Clay",
	tiles = {"soil_clay_top.png",
		{name = "soil_clay_side.png",
			tileable_vertical = false}},
	groups = {crumbly=3, clay=1, soil=0},
	drop = 'soil:clay_lump 4',
	sounds = sound.dirt({
		footstep = "",
	}),
})