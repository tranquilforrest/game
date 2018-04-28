notify = {}
notify.hudids = {}
notify.messages = {}
notify.settings = {}
notify.next_msgids = {}

notify.settings.max_messages = 7
local setting = minetest.setting_get("notify_max")
if type(tonumber(setting)) == "number" then
	if tonumber(setting) == 0 then
		-- Infinite messages
		notify.settings.max_messages = nil
	else
		notify.settings.max_messages = tonumber(setting)
	end
end

notify.settings.color = 0xFFFFFF
setting = minetest.setting_get("notify_color")
if setting then
	local r, g, b = string.match(setting, "%((%d+),(%d+),(%d+)%)")
	r = tonumber(r)
	g = tonumber(g)
	b = tonumber(b)
	if type(r) == "number" and type(g) == "number" and type(b) == "number" and
		r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
		notify.settings.color = r * 0x10000 + g * 0x100 + b
	else
		minetest.log("warning", "[notify] Invalid syntax of notify_color setting!")
	end
end

notify.settings.display_time = 5
local setting = minetest.setting_get("notify_time")
if type(tonumber(setting)) == "number" then
	if tonumber(setting) >= 1 then
		notify.settings.display_time = tonumber(setting)
	else
		minetest.log("warning", "[notify] Invalid value for notify_time! Using default display time of 5 seconds.")
	end
end



local function update_display(player, pname)
	local messages = {}
	local start, stop
	stop = #notify.messages[pname]
	if notify.settings.max_messages ~= nil then
		local max = math.min(notify.settings.max_messages, #notify.messages[pname])
		if #notify.messages[pname] > notify.settings.max_messages then
			start = stop - max
		else
			start = 1
		end
	else
		start = 1
	end
	for i=start, stop do
		table.insert(messages, notify.messages[pname][i].text)
	end
	local concat = table.concat(messages, "\n")
	player:hud_change(notify.hudids[pname], "text", concat)
end

notify.push_message_player = function(player, text)
	local function push(tbl)
		-- Horrible Workaround code starts here
		if not (notify.last_push < notify.steps) then
			minetest.after(0, push, tbl)
			return
		end

		local player = tbl.player
		local text = tbl.text
		-- Horrible Workaround code ends here

		if not player then
			return
		end
		local pname = player:get_player_name()
		if (not pname) then
			return
		end
		if notify.hudids[pname] == nil then
			notify.hudids[pname] = player:hud_add({
				hud_elem_type = "text",
				text = text,
				number = notify.settings.color,
				position = {x=0.5, y=0.5},
				offset = {x=-0,y=-256},
				direction = 3,
				alignment = {x=0,y=1},
				scale = {x=800,y=20*notify.settings.max_messages},
			})
			notify.messages[pname] = {}
			notify.next_msgids[pname] = 0
			table.insert(notify.messages[pname], {text=text, msgid=notify.next_msgids[pname]})
		else
			notify.next_msgids[pname] = notify.next_msgids[pname] + 1
			table.insert(notify.messages[pname], {text=text, msgid=notify.next_msgids[pname]})
			update_display(player, pname)
		end

		minetest.after(notify.settings.display_time, function(param)
			if not param.player then
				return
			end
			local pname = param.player:get_player_name()
			if (not pname) or (not notify.messages[pname]) then
				return
			end
			for i=1, #notify.messages[pname] do
				if param.msgid == notify.messages[pname][i].msgid then
					table.remove(notify.messages[pname], i)
					break
				end
			end
			update_display(player, pname)
		end, {player=player, msgid=notify.next_msgids[pname]})
	
		-- Update timer for Horrible Workaround
		notify.last_push = notify.steps
	end

	if notify.last_push < notify.steps then
		push({player=player, text=text})
	else
		minetest.after(0, push, {player=player, text=text})
	end
end

notify.push_message_all = function(text)
	local players = minetest.get_connected_players()
	for i=1,#players do
		notify.push_message_player(players[i], text)
	end
end

minetest.register_on_leaveplayer(function(player)
	notify.hudids[player:get_player_name()] = nil
end)

-- Horrible Workaround code starts here
notify.steps = 0
notify.last_push = -1
minetest.register_globalstep(function(dtime)
	notify.steps = notify.steps + 1
end)
-- Horrible Workaround code ends here

minetest.register_on_joinplayer(function(player)
	notify.push_message_player(player, "Welcome on the server")
end)