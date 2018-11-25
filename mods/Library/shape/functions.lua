-- Node will be called stair:<subname>
function shape.register_stair(subname, recipeitem, groups, images, description)
	minetest.register_node(":stair:" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
	})

	crafting.register_recipe({
		type   = "shape",
		output  = 'stair:' .. subname .. ' 3',
		items  = { recipeitem .. ' 2' },
		level = 1,
		always_known = true
	})
end

-- Node will be called slab:<subname>
function shape.register_slab(subname, recipeitem, groups, images, description)
	minetest.register_node(":slab:" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		is_ground_content = true,
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
	})


	crafting.register_recipe({
		type   = "shape",
		output  = 'slab:' .. subname .. ' 4',
		items  = { recipeitem .. ' 2' },
		level = 1,
		always_known = true
	})
end

-- Nodes will be called {stair,slab}:<subname>
function shape.register_all(subname, recipeitem, groups, images, desc_stair, desc_slab)
	shape.register_stair(subname, recipeitem, groups, images, desc_stair)
	shape.register_slab(subname, recipeitem, groups, images, desc_slab)
end