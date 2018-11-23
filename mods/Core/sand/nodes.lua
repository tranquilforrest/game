minetest.register_node("sand:sand", {
	description = "Sand",
	tiles = {
		"sand_sand_top.png",
		{name = "sand_sand_side.png", tileable_vertical = false}
	},
	groups = {crumbly=3, falling_node=1, sand=1},
	drops = "sand:sand",
	sounds = sound.sand(),
})

minetest.register_node("sand:desert", {
	description = "Desert Sand",
	tiles = {
		"sand_desert_top.png",
		{name = "sand_desert_side.png", tileable_vertical = false}
	},
	groups = {crumbly=3, falling_node=1, sand=1},
	drops = "sand:desert",
	sounds = sound.sand(),
})

minetest.register_node("sand:stone", {
	description = "Sandstone",
	tiles ={"sand_stone.png"},
	groups = {crumbly=2,cracky=2, rock=1, stone=1},
	drop = 'sand:stone',
	sounds = sound.stone(),
})