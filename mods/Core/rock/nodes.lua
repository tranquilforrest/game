minetest.register_node("rock:stone", {
	description = "Stone",
	tiles = {
		"rock_stone_top.png",
		{name = "rock_stone_side.png", tileable_vertical = false}
	},
	groups = {cracky=3, rock=1, stone=1},
	drop = 'rock:cobble',
	legacy_mineral = true,
	sounds = sound.stone(),
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("rock:stone_"..math.random(1,3))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("rock:stone".. " "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

	minetest.register_node("rock:stone_1", {
		description = "Stone type 1",
		tiles = {
			"rock_stone_top.png",
			{name = "rock_stone_side.png", tileable_vertical = false}
		},
		groups = {cracky=3, not_in_creative_inventory=1, rock=1, stone=1, rockstone=1},
		drop = 'rock:cobble',
		legacy_mineral = true,
		sounds = sound.stone(),
	})

	minetest.register_node("rock:stone_2", {
		description = "Stone type 2",
		tiles = {
			"rock_stone_top_2.png",
			{name = "rock_stone_side_2.png", tileable_vertical = false}
		},
		groups = {cracky=3, not_in_creative_inventory=1, rock=1, stone=1, rockstone=1},
		drop = 'rock:cobble',
		legacy_mineral = true,
		sounds = sound.stone(),
	})

	minetest.register_node("rock:stone_3", {
		description = "Stone type 3",
		tiles = {
			"rock_stone_top_3.png",
			{name = "rock_stone_side_3.png", tileable_vertical = false}
		},
		groups = {cracky=3, not_in_creative_inventory=1, rock=1, stone=1, rockstone=1},
		drop = 'rock:cobble',
		legacy_mineral = true,
		sounds = sound.stone(),
	})

	minetest.register_node("rock:stone_4", {
		description = "Stone type 4",
		tiles = {
			"rock_stone_top_4.png",
			{name = "rock_stone_side_4.png", tileable_vertical = false}
		},
		groups = {cracky=3, not_in_creative_inventory=1, rock=1, stone=1, rockstone=1},
		drop = 'rock:cobble',
		legacy_mineral = true,
		sounds = sound.stone(),
	})


minetest.register_node("rock:brick", {
	description = "Brick",
	tiles ={"default_brick.png"},
	is_ground_content = false,
	groups = {cracky=3, rock=1},
	drop = 'default:clay_brick 4',
	sounds = sound.stone(),
})

minetest.register_node("rock:cobble", {
	description = "Cobble",
	tiles = {
		"rock_cobble_top.png",
		{name = "rock_cobble_side.png", tileable_vertical = false}
	},
	is_ground_content = false,
	groups = {cracky=3, rock=1},
	sounds = sound.stone(),
})

minetest.register_node("rock:mossycobble", {
	description = "Mossy Cobble",
	tiles = {
		"rock_mossycobble_top.png",
		{name = "rock_mossycobble_side.png", tileable_vertical = false}
	},
	is_ground_content = false,
	groups = {cracky=3, rock=1},
	sounds = sound.stone(),
})


minetest.register_node("rock:gravel", {
	description = "Gravel",
	tiles = {
		"rock_gravel_top.png",
		{name = "rock_gravel_side.png", tileable_vertical = false}
	},
	groups = {crumbly=2, falling_node=1, rock=1},
	sounds = sound.dirt({
		footstep = {name="default_gravel_footstep", gain=0.45},
	}),
})

minetest.register_node("rock:desert", {
	description = "Desert Sandstone",
	tiles ={"rock_desert.png"},
	groups = {crumbly=2,cracky=2, rock=1, stone=1},
	drop = 'rock:desert',
	sounds = sound.stone(),
})