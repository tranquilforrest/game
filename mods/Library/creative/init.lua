creative = { users={} }

minetest.register_privilege("creative", {
	description = "Allow player to use creative inventory",
	give_to_singleplayer = false
})

minetest.register_privilege("gamemode", {
	description = "Allow player to switch between survival and creative mode",
	give_to_singleplayer = false
})

local creative_mode_cache = minetest.settings:get_bool("creative_mode")

function creative.is_enabled_for(name)
	return creative_mode_cache or
		minetest.check_player_privs(name, {creative = true})
end

dofile(minetest.get_modpath("creative") .. "/inventory.lua")


-- Unlimited node placement
minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
	return creative.is_enabled_for(placer:get_player_name())
end)

-- Don't pick up if the item is already in the inventory
local old_handle_node_drops = minetest.handle_node_drops
function minetest.handle_node_drops(pos, drops, digger)
	if not digger or not digger:is_player() then
		return
	end
	if not creative.is_enabled_for(digger:get_player_name()) then
		return old_handle_node_drops(pos, drops, digger)
	end
	local inv = digger:get_inventory()
	if inv then
		for _, item in ipairs(drops) do
			if not inv:contains_item("main", item, true) then
				inv:add_item("main", item)
			end
		end
	end
end


--
-- SWITCH CREATIVE MODE
--

minetest.register_chatcommand("creative", {
	description = "Set your mode to creative",
	privs = "gamemode",
	func = function(name)
		if not creative.is_enabled_for(name) then
			player=minetest.get_player_by_name(name)

			if player then
				game.set_player_priv(name, 'creative', true)
				sfinv.reload_player_formspec(player)
			
				minetest.chat_send_player(name, "Set game mode to creative.")
			end
		else
			minetest.chat_send_player(name, "Creative mode already enabled.")
		end
	end
})


minetest.register_chatcommand("survival", {
	description = "Set your mode to survival",
	privs = "gamemode",
	func = function(name)
		if creative.is_enabled_for(name) then
			player=minetest.get_player_by_name(name)

			if player then
				game.set_player_priv(name, 'creative', false)
				sfinv.reload_player_formspec(player)
			
				minetest.chat_send_player(name, "Set game mode to survival.")
			end
		else
			minetest.chat_send_player(name, "Survival mode already enabled.")
		end
	end
})