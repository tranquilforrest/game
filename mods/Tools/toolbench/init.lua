--TODO: Depends - wood, gear, steel, stick, stone
--TODO: Steel requires forgin of head
--TODO: Tiles

crafting.register_type('tools')

workbench.register('toolbench:lvl1', 'tools', 1, {
	description = 'Tool workbench',
	tiles = {
		"workbench_top.png^level1.png", "workbench_bottom.png^level1.png",
		{name = "workbench_side.png^level1.png^default_tool_woodpick.png", tileable_vertical = false}
	},
})

workbench.register('toolbench:lvl2', 'tools', 2, {
	description = 'Tool workbench',
	tiles = {
		"workbench_top.png^level2.png", "workbench_bottom.png^level2.png",
		{name = "workbench_side.png^level2.png^default_tool_stonepick.png", tileable_vertical = false}
	},
	inventory = { x = 8, y = 3 },
})

workbench.register('toolbench:lvl3', 'tools', 3, {
	description = 'Tool workbench',
	tiles = {
		"workbench_top.png^level3.png", "workbench_bottom.png^level3.png",
		{name = "workbench_side.png^level3.png^default_tool_steelpick.png", tileable_vertical = false}
	},
	inventory = { x = 8, y = 4 },
})

--[[
-- Awards
--------------------------------------

awards.register_award("toolbench:lvl1", {
	description = "Creating tools",

	-- Optional:

	--requires = { "amod:an_award" },
	--background = "background_image.png",

	trigger = {
		type = "craft",
		item = "toolbench:lvl1"

	},
	
	on_unlock = function(name, award_def) end,
})

awards.register_award("toolbench:lvl2", {
	description = "Upgrading the toolbench",

	requires = { "toolbench:level1" },
	--background = "background_image.png",

	trigger = {
		type = "craft",
		item = "toolbench:lvl2"
	},
	
	on_unlock = function(name, award_def) end,
})
]]
--
-- Crafts
---------------------------------------
dofile(minetest.get_modpath("toolbench").."/crafts.lua")