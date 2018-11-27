crafting.register_type('shape')

--[[
workbench.register('shape:workbench', 'shape', 1, {
	description = 'Shape workbench',
	tiles = {
		"workbench_top.png^level1.png", "workbench_bottom.png^level1.png",
		{name = "workbench_side.png^level1.png^default_tool_woodpick.png", tileable_vertical = false}
	},
})
]]--

crafting.create_async_station("shape:workbench", "shape", 1, {
	description = "Shaping/Carpenters Workbench", -- TODO: Naming
	tiles = {
		"shape_workbench_top.png", "shape_workbench_bottom.png",
		"shape_workbench_side.png^shape_workbench_hammer.png", "shape_workbench_side.png^shape_workbench_shears.png",
		"shape_workbench_side.png^shape_workbench_saw.png", "shape_workbench_side.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
}, {
	description = "Shaping Workbench (active)",
	tiles = {
		"shape_workbench_top.png", "shape_workbench_bottom.png",
		"shape_workbench_side.png", "shape_workbench_side.png",
		"shape_workbench_side.png",
		{
			image = "crafting_furnace_front_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "shape:workbench",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
})