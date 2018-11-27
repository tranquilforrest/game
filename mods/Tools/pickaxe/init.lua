
minetest.register_tool("pickaxe:wood", {
	original_description = "Wooden Pickaxe",
	description = toolranks.create_description("Wooden Pickaxe", 0, 1),
	original_description = "Wooden Pickaxe",
	inventory_image = "default_tool_woodpick.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[2]=2.00, [3]=1.20}, uses=10, maxlevel=1}
		},
		damage_groups = {fleshy=2},
	},
	after_use = toolranks.new_afteruse
})

minetest.register_tool("pickaxe:stone", {
	original_description = "Stone Pickaxe",
	description = toolranks.create_description("Stone Pickaxe", 0, 1),
	original_description = "Stone Pickaxe",
	inventory_image = "default_tool_stonepick.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[1]=2.00, [2]=1.20, [3]=0.80}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=3},
	},
	after_use = toolranks.new_afteruse
})

minetest.register_tool("pickaxe:steel", {
	original_description = "Steel Pickaxe",
	description = toolranks.create_description("Steel Pickaxe", 0, 1),
	original_description = "Steel Pickaxe",
	inventory_image = "default_tool_steelpick.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			cracky={times={[1]=4.00, [2]=1.60, [3]=1.00}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
	after_use = toolranks.new_afteruse
})
