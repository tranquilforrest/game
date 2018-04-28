minetest.register_node("sand:sand", {
	description = "Sand",
	tiles ={"default_sand.png"},
	groups = {crumbly=3, falling_node=1, sand=1},
	drops = "sand:sand",
	sounds = sound.sand(),
})
