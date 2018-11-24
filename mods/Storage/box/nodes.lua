
minetest.register_node("box:cardboard", {
	description = "Moving box",
	tiles = {
		"box_cardboard_top.png",
		"box_cardboard_top.png",
		"box_cardboard_side.png",
		},
	groups = {dig_immediate = 3, oddly_diggable_by_hand = 3},
	paramtype2 = "facedir",
	sounds = sound.wood(),
	stack_max = 1,
	on_construct = box.small,
	after_place_node = box.place,
	on_dig = box.dig,
	allow_metadata_inventory_put = box.put,
})


minetest.register_node("box:crate", {
	description = "Crate",
	tiles ={
		"box_crate_top.png",
		"box_crate_top.png",
		"box_crate_side.png",
	},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=1},
	paramtype2 = "facedir",
	sounds = sound.wood(),
	stack_max = 1,
	on_construct = box.large,
	after_place_node = box.place,
	on_dig = box.dig,
	allow_metadata_inventory_put = box.put,
})


minetest.register_node("box:chest", {
	description = "Chest",
	tiles ={
		"default_chest_top.png",
		"default_chest_top.png",
		"default_chest_side.png",
		"default_chest_side.png",
		"default_chest_front.png",
		"default_chest_inside.png"
	},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2},
	paramtype2 = "facedir",
	sounds = sound.wood(),
	stack_max = 1,
	on_construct = box.huge,
	after_place_node = box.place,
	on_dig = box.dig,
	allow_metadata_inventory_put = box.put,
})