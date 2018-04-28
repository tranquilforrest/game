--
-- LEVEL 1 - Wood
-------------------------------------
crafting.register_recipe({
	type   = "inv",
	output  = "toolbench:lvl1",
	items  = { "group:wood 4", "group:stick 2", "gear:wood" },
	level = 1,
	always_known = true,
})

crafting.register_recipe({
	type   = "tools",
	output = "pick:wood",
	items  = { "group:wood 3", "group:stick 2" },
	level = 1,
	always_known = true,
})

crafting.register_recipe({
	type   = "tools",
	output = "shovel:wood",
	items  = { "group:wood 1", "group:stick 2" },
	level = 1,
	always_known = true,
})

crafting.register_recipe({
	type   = "tools",
	output = "axe:wood",
	items  = { "group:wood 3", "group:stick 2" },
	level = 1,
	always_known = true,
})

crafting.register_recipe({
	type   = "tools",
	output = "sword:wood",
	items  = { "group:wood 2", "group:stick 1" },
	level = 1,
	always_known = true,
})

--
-- LEVEL 2 - Stone
-------------------------------------

crafting.register_recipe({
	type   = "inv",
	output = "toolbench:lvl2",
	items  = { "toolbench:lvl1", "gear:stone" },
	level = 2,
	always_known = false,
})

crafting.register_recipe({
	type   = "tools",
	output = "pick:stone",
	items  = { "group:stone 3", "group:stick 2" },
	level = 2,
	always_known = false,
})

crafting.register_recipe({
	type   = "tools",
	output = "shovel:stone",
	items  = { "group:stone 1", "group:stick 2" },
	level = 2,
	always_known = false,
})

crafting.register_recipe({
	type   = "tools",
	output = "axe:stone",
	items  = { "group:stone 3", "group:stick 2" },
	level = 2,
	always_known = false,
})

crafting.register_recipe({
	type   = "tools",
	output = "sword:stone",
	items  = { "group:stone 2", "group:stick 1" },
	level = 2,
	always_known = false,
})

--
-- LEVEL 3 - Steel
-------------------------------------

crafting.register_recipe({
	type   = "inv",
	output = "toolbench:lvl2",
	items  = { "toolbench:lvl1", "gear:steel" },
	level = 3,
	always_known = false,
})

crafting.register_recipe({
	type   = "tools",
	output = "pick:steel",
	items  = { "group:steel 3", "group:stick 2" },
	level = 3,
	always_known = false,
})

crafting.register_recipe({
	type   = "tools",
	output = "shovel:steel",
	items  = { "group:steel 1", "group:stick 2" },
	level = 3,
	always_known = false,
})

crafting.register_recipe({
	type   = "tools",
	output = "axe:steel",
	items  = { "group:steel 3", "group:stick 2" },
	level = 3,
	always_known = false,
})

crafting.register_recipe({
	type   = "tools",
	output = "sword:steel",
	items  = { "group:steel 2", "group:stick 1" },
	level = 3,
	always_known = false,
})