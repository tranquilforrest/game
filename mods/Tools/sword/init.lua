minetest.register_tool(":sword:wood", {
	original_description = "Wooden Sword",
	description = toolranks.create_description("Wooden Sword", 0, 1),
	inventory_image = "default_tool_woodsword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			fleshy={times={[2]=1.10, [3]=0.60}, uses=10, maxlevel=1},
			snappy={times={[2]=1.00, [3]=0.50}, uses=10, maxlevel=1},
			choppy={times={[3]=1.00}, uses=20, maxlevel=0}
		},
		damage_groups = {fleshy=2},
	},
	after_use = toolranks.new_afteruse
})

minetest.register_tool(":sword:stone", {
	original_description = "Stone Sword",
	description = toolranks.create_description("Stone Sword", 0, 1),
	inventory_image = "default_tool_stonesword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			fleshy={times={[2]=0.80, [3]=0.40}, uses=20, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.40}, uses=20, maxlevel=1},
			choppy={times={[3]=0.90}, uses=20, maxlevel=0}
		},
		damage_groups = {fleshy=4},
	},
	after_use = toolranks.new_afteruse
})

minetest.register_tool(":sword:steel", {
	original_description = "Steel Sword",
	description = toolranks.create_description("Steel Sword", 0, 1),
	inventory_image = "default_tool_steelsword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=10, maxlevel=2},
			snappy={times={[2]=0.70, [3]=0.30}, uses=40, maxlevel=1},
			choppy={times={[3]=0.70}, uses=40, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	},
	after_use = toolranks.new_afteruse
})