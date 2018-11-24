
box.small = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "size[8,7]" ..
		game.gui_bg ..
		game.gui_bg_img ..
		game.gui_slots ..
		"list[current_name;main;0,0.3;8,2]" ..
		game.get_hotbar_bg(0,2.85)..
		"list[current_player;main;0,2.85;8,4]" ..
		"listring[current_name;main]" ..
		"listring[current_player;main]"
	)
	local inv = meta:get_inventory()
	inv:set_size("main", 8*2)
end


box.large = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "size[8,8]" ..
		game.gui_bg ..
		game.gui_bg_img ..
		game.gui_slots ..
		"list[current_name;main;0,0.3;8,3]" ..
		game.get_hotbar_bg(0,3.85)..
		"list[current_player;main;0,3.85;8,4]" ..
		"listring[current_name;main]" ..
		"listring[current_player;main]"
	)
	local inv = meta:get_inventory()
	inv:set_size("main", 8*3)
end


box.huge = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "size[8,10]" ..
		game.gui_bg ..
		game.gui_bg_img ..
		game.gui_slots ..
		"list[current_name;main;0,0.3;8,5]" ..
		game.get_hotbar_bg(0,5.85)..
		"list[current_player;main;0,5.85;8,4]" ..
		"listring[current_name;main]" ..
		"listring[current_player;main]"
	)
	local inv = meta:get_inventory()
	inv:set_size("main", 8*5)
end

box.place = function(pos, placer, itemstack, pointed_thing)
	local meta = minetest.get_meta(pos)
	local stuff = minetest.deserialize(itemstack:get_metadata())
	if stuff then
		meta:from_table(stuff)
	end
	itemstack:take_item()
end

box.dig = function(pos, node, digger)
	if minetest.is_protected(pos, digger:get_player_name()) then
		return false
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local list = {}
	for i, stack in ipairs(inv:get_list("main")) do
		if stack:get_name() == "" then
			list[i] = ""
		else 
			list[i] = stack:to_string()
		end
	end
	local new_list = {inventory = {main = list},
			fields = {infotext = "Storage", formspec = meta:get_string("formspec")}}
	local new_list_as_string = minetest.serialize(new_list)
	local new = ItemStack(node)
	new:set_metadata(new_list_as_string)
	minetest.remove_node(pos)
	local player_inv = digger:get_inventory()
	if player_inv:room_for_item("main", new) then
		player_inv:add_item("main", new)
	else
		minetest.add_item(pos, new)
	end
end

box.put = function(pos, listname, index, stack, player)
	if not string.match(stack:get_name(), "box:") then
		return stack:get_count()
	else
		return 0
	end
end