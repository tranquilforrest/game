crafting.register_type('shape')

workbench.register('shape:workbench', 'shape', 1, {
	description = 'Shape workbench',
	tiles = {
		"workbench_top.png^level1.png", "workbench_bottom.png^level1.png",
		{name = "workbench_side.png^level1.png^default_tool_woodpick.png", tileable_vertical = false}
	},
})