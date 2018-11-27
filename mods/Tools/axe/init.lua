minetest.register_tool("axe:wood", {
	description = toolranks.create_description("Wooden Axe", 0, 1),
	original_description = "Wooden Axe",
	inventory_image = "axe_wood.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[2]=1.40, [3]=0.80}, uses=10, maxlevel=1},
			fleshy={times={[2]=1.50, [3]=0.80}, uses=10, maxlevel=1}
		},
		damage_groups = {fleshy=2},
	},
	after_use = toolranks.new_afteruse
})

minetest.register_tool("axe:stone", {
	description = toolranks.create_description("Stone Axe", 0, 1),
	original_description = "Stone Axe",
	inventory_image = "axe_stone.png",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=1.50, [2]=1.00, [3]=0.60}, uses=20, maxlevel=1},
			fleshy={times={[2]=1.30, [3]=0.70}, uses=20, maxlevel=1}
		},
		damage_groups = {fleshy=3},
	},
	after_use = toolranks.new_afteruse
})

minetest.register_tool("axe:steel", {
	description = toolranks.create_description("Steel Axe", 0, 1),
	original_description = "Steel Axe",
	inventory_image = "default_tool_steelaxe.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.00, [2]=1.60, [3]=1.00}, uses=10, maxlevel=2},
			fleshy={times={[2]=1.10, [3]=0.60}, uses=40, maxlevel=1}
		},
		damage_groups = {fleshy=3},
	},
	after_use = toolranks.new_afteruse
})
