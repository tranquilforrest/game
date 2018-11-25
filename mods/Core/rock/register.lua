-- subname, recipeitem, groups, images, desc_stair, desc_slab
shape.register_all('stone',
	'rock:stone',
	{cracky=3, rock=1, stone=1},
	{
		"rock_stone_top.png",
		{name = "rock_stone_side.png", tileable_vertical = false}
	},
	'Stone Stair',
	'Stone Slab'
)

shape.register_all('brick',
	'rock:brick',
	{cracky=3, rock=1},
	{"default_brick.png"},
	'Brick Stair',
	'Brick Slab'
)
shape.register_all('cobble',
	'rock:cobble',
	{cracky=3, rock=1},
	{
		"rock_cobble_top.png",
		{name = "rock_cobble_side.png", tileable_vertical = false}
	},
	'Cobblestone Stair',
	'Cobblestone Slab'
)

shape.register_all('mossycobble',
	'rock:mossycobble',
	{cracky=3, rock=1},
	{
		"rock_mossycobble_top.png",
		{name = "rock_mossycobble_side.png", tileable_vertical = false}
	},
	'Mossy Cobblestone Stair',
	'Mossy Cobblestone Slab'
)


-- Source: https://github.com/minetest/minetest_game/blob/master/mods/default/functions.lua
minetest.register_abm({
	label = "Moss growth",
	nodenames = {"rock:cobble", "slab:cobble", "stair:cobble", "walls:cobble"},
	neighbors = {"group:water"},
	interval = 16,
	chance = 200,
	catch_up = false,
	action = function(pos, node)
		if node.name == "rock:cobble" then
			minetest.set_node(pos, {name = "rock:mossycobble"})
		elseif node.name == "slab:cobble" then
			minetest.set_node(pos, {name = "slab:mossycobble", param2 = node.param2})
		elseif node.name == "stair:cobble" then
			minetest.set_node(pos, {name = "stair:mossycobble", param2 = node.param2})
		elseif node.name == "walls:cobble" then
			minetest.set_node(pos, {name = "walls:mossycobble", param2 = node.param2})
		end
	end
})

-- TODO: add cobble to stone recipe