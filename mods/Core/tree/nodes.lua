--[[
minetest.register_node(":apple:log", {
	description = "Apple Tree",
	tiles = {"tree_apple_bark_top.png", "tree_apple_bark_top.png", "tree_apple_bark_side.png"},
	paramtype2 = "facedir",
	drawtype = 'mesh',
	mesh = 'cylindrical_cube.obj',
	selection_box = { type = "full", },
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sound = sound:wood(),

	on_place = minetest.rotate_node
})]]--

tree.register_log('apple', 'Apple', {"tree_apple_bark_top.png", "tree_apple_bark_top.png", "tree_apple_bark_side.png"})
tree.register_sappling('apple', 'Apple', 'default_sappling.png')
tree.register_leaf('apple', 'Apple', 'leaves_apple.png', 'default_leaves_simple.png')
tree.register_fruit('apple', 'Apple', 'default_apple.png')


tree.register_log('jungle', 'Jungle', {"tree_jungle_bark_top.png", "tree_jungle_bark_top.png", "tree_jungle_bark_side.png"})
tree.register_sappling('jungle', 'Jungle', 'default_junglesappling.png')
tree.register_leaf('jungle', 'Jungle', 'leaves_jungle.png', 'default_jungleleaves_simple.png')
tree.register_fruit('jungle', 'Jungle', 'default_jungle.png')


tree.register_log('pine', 'Pine', {"tree_pine_bark_top.png", "tree_pine_bark_top.png", "tree_pine_bark_side.png"})
tree.register_sappling('pine', 'Pine', 'default_pine_sappling.png')
tree.register_needle('pine', 'Pine', 'needles_pine.png', 'default_pineleaves_simple.png')
tree.register_fruit('pine', 'Pine', 'default_pine.png')





minetest.register_node(":acacia:log", {
	description = "Acacia Tree",
	tiles = {"tree_acacia_bark_top.png", "tree_acacia_bark_top.png",
		"tree_acacia_bark_side.png"},
	paramtype2 = "facedir",
	drawtype = 'mesh',
	mesh = 'cylindrical_cube.obj',
	selection_box = { type = "full", },
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sound = sound:wood(),

	on_place = minetest.rotate_node
})

minetest.register_node(":acacia:leaves", {
	description = "Acacia Tree Leaves",
	drawtype = "allfaces_optional",
	tiles = {"leaves_acacia.png"},
	special_tiles = {"default_acacia_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"acacia:sapling"}, rarity = 20},
			{items = {"acacia:leaves"}}
		}
	},
	sound = sound:leaves(),

	after_place_node = tree.after_place_leaves,
})

minetest.register_node(":acacia:sapling", {
	description = "Acacia Tree Sapling",
	drawtype = "plantlike",
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = tree.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sound = sound:leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(tree.time.min, tree.time.max))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"acacia:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 6, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

minetest.register_node(":aspen:log", {
	description = "Aspen Tree",
	tiles = {"tree_aspen_bark_top.png", "tree_aspen_bark_top.png",
		"tree_aspen_bark_side.png"},
	paramtype2 = "facedir",
	drawtype = 'mesh',
	mesh = 'cylindrical_cube.obj',
	selection_box = { type = "full", },
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sound = sound:wood(),

	on_place = minetest.rotate_node
})

minetest.register_node(":aspen:leaves", {
	description = "Aspen Tree Leaves",
	drawtype = "allfaces_optional",
	tiles = {"default_aspen_leaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"aspen:sapling"}, rarity = 20},
			{items = {"aspen:leaves"}}
		}
	},
	sound = sound:leaves(),

	after_place_node = tree.after_place_leaves,
})

minetest.register_node(":aspen:sapling", {
	description = "Aspen Tree Sapling",
	drawtype = "plantlike",
	tiles = {"default_aspen_sapling.png"},
	inventory_image = "default_aspen_sapling.png",
	wield_image = "default_aspen_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = tree.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sound = sound:leaves(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(tree.time.min, tree.time.max))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
			"aspen:sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})