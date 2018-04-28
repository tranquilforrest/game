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

function game.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hotbar_bg_"..i..".png]"
	end
	return out
end


dofile(game.path.."/functions.lua")
dofile(game.path.."/mapgen.lua")


minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 0,
		groupcaps = {
			fleshy = {times={[2]=2.00, [3]=1.00}, uses=0, maxlevel=1},
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=7.00,[2]=4.00,[3]=1.40}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	}
})


minetest.register_on_chat_message(function(playername, line)
	if line:sub(1, 1) == "@" then
		local recipient, message = string.match(line, "^@([^%s:]*)[%s:](.*)")

		if not empty(recipient) or not empty(message) then
			if minetest.get_player_by_name(recipient) ~= nil then
				message = string.format("(%s) %s", playername, message)
				minetest.chat_send_player(recipient, message)
			else
				message = string.format("Player %s does not exist or is not online.", recipient)
				minetest.chat_send_player(playername, message)
			end
		else
			minetest.chat_send_player(playername, "Usage: @playername: message text")
		end

		return true
	end
end)

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