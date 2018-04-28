shapes = {}

-- Node will be called stair:<subname>
function shapes.register_stair(subname, recipeitem, groups, images, description)
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

	minetest.register_craft({
		output = ':stair:' .. subname .. ' 4',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called slab:<subname>
function shapes.register_slab(subname, recipeitem, groups, images, description)
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

	minetest.register_craft({
		output = ':slab:' .. subname .. ' 3',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Nodes will be called {stair,slab}:<subname>
function shapes.register_all(subname, recipeitem, groups, images, desc_stair, desc_slab)
	shapes.register_stair(subname, recipeitem, groups, images, desc_stair)
	shapes.register_slab(subname, recipeitem, groups, images, desc_slab)
end