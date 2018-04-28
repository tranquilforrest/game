minetest.register_tool("shovel:wood", {
	original_description = "Wooden Shovel",
	description = toolranks.create_description("Wooden Shovel", 0, 1),
	inventory_image = "default_tool_woodshovel.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			crumbly={times={[1]=2.00, [2]=0.80, [3]=0.50}, uses=10, maxlevel=1}
		},
		damage_groups = {fleshy=2},
	},
	after_use = toolranks.new_afteruse
})

minetest.register_tool("shovel:stone", {
	original_description = "Stone Shovel",
	description = toolranks.create_description("Stone Shovel", 0, 1),
	inventory_image = "default_tool_stoneshovel.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			crumbly={times={[1]=1.20, [2]=0.50, [3]=0.30}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=3},
	},
	after_use = toolranks.new_afteruse
})

minetest.register_tool("shovel:steel", {
	original_description = "Steel Shovel",
	description = toolranks.create_description("Steel Shovel", 0, 1),
	inventory_image = "default_tool_steelshovel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.00, [2]=0.70, [3]=0.60}, uses=10, maxlevel=2}
		},
		damage_groups = {fleshy=4},
	},
	after_use = toolranks.new_afteruse
})
