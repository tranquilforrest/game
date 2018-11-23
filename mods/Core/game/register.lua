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