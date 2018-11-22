WATER_ALPHA = 160
WATER_VISC = 1
LAVA_VISC = 7
LIGHT_MAX = 14

game = {}
game.path = minetest.get_modpath("game")
game.gui_bg = "bgcolor[#212121;true]"
game.gui_bg_img = "background[5,5;1,1;gui_background.png;true]"
game.gui_slots = "listcolors[#cfe3f369;#A1C4DE;#cfe3f3;#4a7a9e;#FFF]" -- TODO: Change colors
game.color = {
	text = minetest.get_color_escape_sequence("#424242"), -- gray
	title = minetest.get_color_escape_sequence("#4fc3f7"), -- blue
	decription = minetest.get_color_escape_sequence("#00897b"), -- turquoise
	warning = minetest.get_color_escape_sequence("#ff5722"), -- orange
	success = minetest.get_color_escape_sequence("#2baf2b"), -- green
	info = minetest.get_color_escape_sequence("#80deea"), -- light blue
	level1 = minetest.get_color_escape_sequence("#ffca28"), -- yellow
	level2 = minetest.get_color_escape_sequence("#2baf2b"), -- green
	level3 = minetest.get_color_escape_sequence("#26a69a"), -- turquoise
	level4 = minetest.get_color_escape_sequence("#7e57c2"), -- purple
	background = minetest.get_background_escape_sequence("#212121"), -- dark grey
	reset = minetest.get_color_escape_sequence("#ffffff") -- white
}



dofile(game.path.."/functions.lua")
dofile(game.path.."/mapgen.lua")
dofile(game.path.."/register.lua")




--[[
minetest.register_on_newplayer(function(player)
player:get_inventory():add_item("main", "playerxp:book")
end)


-- Global environment step function
function on_step(dtime)
	-- print("on_step")
end
minetest.register_globalstep(on_step)

function on_placenode(p, node)
	--print("on_placenode")
end
minetest.register_on_placenode(on_placenode)

function on_dignode(p, node)
	--print("on_dignode")
end
minetest.register_on_dignode(on_dignode)

function on_punchnode(p, node)
end
minetest.register_on_punchnode(on_punchnode)]]--