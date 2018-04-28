
minetest.register_node(":water:flowing", {
	description = "Water (flowing)",
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{name = "default_water.png", backface_culling = false},
		{name = "default_water.png", backface_culling = true},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "water:flowing",
	liquid_alternative_source = "water:source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {water = 3, liquid = 3},
})

minetest.register_node(":water:source", {
	description = "Water",
	drawtype = "liquid",
	tiles = {"default_water.png"},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name = "default_water.png", backface_culling = false},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "water:flowing",
	liquid_alternative_source = "water:source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = {water = 3, liquid = 3},
})

minetest.register_node(":riverwater:source", {
	description = "River Water Source",
	drawtype = "liquid",
	tiles = {"default_river_water.png"},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name = "default_river_water.png", backface_culling = false},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "riverwater:flowing",
	liquid_alternative_source = "riverwater:source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
})

minetest.register_node(":riverwater:flowing", {
	description = "Flowing River Water",
	drawtype = "flowingliquid",
	tiles = {"default_river_water.png"},
	special_tiles = {
		{name = "default_river_water.png", backface_culling = false},
		{name = "default_river_water.png", backface_culling = true},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "riverwater:flowing",
	liquid_alternative_source = "riverwater:source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
})

minetest.register_node(":lava:flowing", {
	description = "Lava (flowing)",
	inventory_image = minetest.inventorycube("default_lava.png"),
	drawtype = "flowingliquid",
	tiles ={"default_lava.png"},
	special_tiles = {
		{
			image="default_lava_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
		{
			image="default_lava_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
	},
	paramtype = "light",
	light_source = LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "lava:flowing",
	liquid_alternative_source = "lava:source",
	liquid_viscosity = LAVA_VISC,
	damage_per_second = 4*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, hot=3},
})

minetest.register_node(":lava:source", {
	description = "Lava",
	inventory_image = minetest.inventorycube("default_lava.png"),
	drawtype = "liquid",
	--tiles ={"default_lava.png"},
	tiles = {
		{
			name = "default_lava_source_animated.png",
			animation = {type="sheet_2d", frames_w=3, frames_h=2, frame_length=0.5}
		}
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{name="default_lava.png", backface_culling=false},
	},
	paramtype = "light",
	light_source = LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "lava:flowing",
	liquid_alternative_source = "lava:source",
	liquid_viscosity = LAVA_VISC,
	damage_per_second = 4*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, hot=3},
})