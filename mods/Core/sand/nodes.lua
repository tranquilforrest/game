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
