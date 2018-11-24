local random = math.random

--
-- Grow trees from saplings
--

-- 'can grow' function

function tree.can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil = minetest.get_item_group(name_under, "soil")
	if is_soil == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end
	return true
end


-- 'is snow nearby' function

local function is_snow_nearby(pos)
	return minetest.find_node_near(pos, 1, {"group:snowy"})
end


-- Grow sapling

function tree.grow_sapling(pos)
	if not tree.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	end

	local mg_name = minetest.get_mapgen_setting("mg_name")
	local node = minetest.get_node(pos)
	if node.name == "apple:sapling" then
		minetest.log("action", "A sapling grows into a tree at "..
			minetest.pos_to_string(pos))
			tree.grow_new_apple_tree(pos)
	elseif node.name == "jungle:sapling" then
		minetest.log("action", "A jungle sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		tree.grow_new_jungle_tree(pos)
	elseif node.name == "pine:sapling" then
		minetest.log("action", "A pine sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		local snow = is_snow_nearby(pos)
		if snow then
			tree.grow_new_snowy_pine_tree(pos)
		else
			tree.grow_new_pine_tree(pos)
		end
	elseif node.name == "acacia:sapling" then
		minetest.log("action", "An acacia sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		tree.grow_new_acacia_tree(pos)
	elseif node.name == "aspen:sapling" then
		minetest.log("action", "An aspen sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		tree.grow_new_aspen_tree(pos)
	elseif node.name == "bush:sapling" then
		minetest.log("action", "A bush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		tree.grow_bush(pos)
	elseif node.name == "acacia:bush_sapling" then
		minetest.log("action", "An acacia bush sapling grows into a bush at "..
			minetest.pos_to_string(pos))
		tree.grow_acacia_bush(pos)
	end
end

minetest.register_lbm({
	name = "tree:convert_saplings_to_node_timer",
	nodenames = {"apple:sapling", "jungle:sapling",
			"pine:sapling", "acacia:sapling",
			"aspen:sapling"},
	action = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end
})

-- New apple tree

function tree.grow_new_apple_tree(pos)
	local path = tree.path ..
		"/schematics/apple_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


-- New jungle tree

function tree.grow_new_jungle_tree(pos)
	local path = tree.path ..
		"/schematics/jungle_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


-- New pine tree

function tree.grow_new_pine_tree(pos)
	local path = tree.path ..
		"/schematics/pine_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "0", nil, false)
end


-- New snowy pine tree

function tree.grow_new_snowy_pine_tree(pos)
	local path = tree.path ..
		"/schematics/snowy_pine_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end


-- New acacia tree

function tree.grow_new_acacia_tree(pos)
	local path = tree.path ..
		"/schematics/acacia_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 4, y = pos.y - 1, z = pos.z - 4},
		path, "random", nil, false)
end


-- New aspen tree

function tree.grow_new_aspen_tree(pos)
	local path = tree.path ..
		"/schematics/aspen_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "0", nil, false)
end


-- Bushes do not need 'from sapling' schematic variants because
-- only the stem node is force-placed in the schematic.

-- Bush

function tree.grow_bush(pos)
	local path = tree.path ..
		"/schematics/bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end


-- Acacia bush

function tree.grow_acacia_bush(pos)
	local path = tree.path ..
		"/schematics/acacia_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, false)
end


--
-- Sapling 'on place' function to check protection of node and resulting tree volume
--

function tree.sapling_on_place(itemstack, placer, pointed_thing,
		sapling_name, minp_relative, maxp_relative, interval)
	-- Position of sapling
	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local pdef = node and minetest.registered_nodes[node.name]

	if pdef and pdef.on_rightclick and not placer:get_player_control().sneak then
		return pdef.on_rightclick(pos, node, placer, itemstack, pointed_thing)
	end

	if not pdef or not pdef.buildable_to then
		pos = pointed_thing.above
		node = minetest.get_node_or_nil(pos)
		pdef = node and minetest.registered_nodes[node.name]
		if not pdef or not pdef.buildable_to then
			return itemstack
		end
	end

	local player_name = placer:get_player_name()
	-- Check sapling position for protection
	if minetest.is_protected(pos, player_name) then
		minetest.record_protection_violation(pos, player_name)
		return itemstack
	end
	-- Check tree volume for protection
	if game.intersects_protection(
			vector.add(pos, minp_relative),
			vector.add(pos, maxp_relative),
			player_name,
			interval) then
		minetest.record_protection_violation(pos, player_name)
		-- Print extra information to explain
		minetest.chat_send_player(player_name, "Tree will intersect protection")
		return itemstack
	end

	minetest.log("action", player_name .. " places node "
			.. sapling_name .. " at " .. minetest.pos_to_string(pos))

	local take_item = not (creative and creative.is_enabled_for
		and creative.is_enabled_for(player_name))
	local newnode = {name = sapling_name}
	local ndef = minetest.registered_nodes[sapling_name]
	minetest.set_node(pos, newnode)

	-- Run callback
	if ndef and ndef.after_place_node then
		-- Deepcopy place_to and pointed_thing because callback can modify it
		if ndef.after_place_node(table.copy(pos), placer,
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	-- Run script hook
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		-- Deepcopy pos, node and pointed_thing because callback can modify them
		if callback(table.copy(pos), table.copy(newnode),
				placer, table.copy(node or {}),
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	if take_item then
		itemstack:take_item()
	end

	return itemstack
end


function tree.register_log(type, name, tiles)
	minetest.register_node(":"..type..":log", {
		description = name.." Tree",
		tiles = tiles,
		paramtype2 = "facedir",
		drawtype = 'mesh',
		mesh = 'cylindrical_cube.obj',
		selection_box = { type = "full", },
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 0, flammable = 2},
		sound = sound:wood(),
		drops = type..':bark',

		on_place = minetest.rotate_node
	})
end

function tree.register_sappling(type, name, tile)
	minetest.register_node(":"..type..":sapling", {
		description = name.." Tree Sapling",
		drawtype = "plantlike",
		tiles = {tile},
		inventory_image = tile,
		wield_image = tile,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = tree.grow_sapling,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sound = sound:leaves(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(tree.time.min, tree.time.max))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = tree.sapling_on_place(itemstack, placer, pointed_thing,
				type..":sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -2, y = 1, z = -2},
				{x = 2, y = 6, z = 2},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
end

function tree.register_leaf(type, name, tile, stile)
	minetest.register_node(":"..type..":leaves", {
		description = name.." Tree Leaves",
		drawtype = "allfaces_optional",
		waving = 1,
		tiles = {tile},
		special_tiles = {stile},
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{
					items = {type..':sapling'},
					rarity = 20,
				},
				{
					-- player will get leaves only if he get no saplings,
					-- this is because max_items is 1
					items = {type..':leaves'},
				},
				{
					-- player will get sapling with 1/20 chance
					items = {'craft:stick'},
					rarity = 10,
				},
			}
		},
		sound = sound:leaves(),
		climbable = true,

		after_place_node = tree.after_place_leaves,
	})
end

function tree.register_needle(type, name, tile)
	minetest.register_node(":"..type..":needles",{
		description = name.." Needles",
		drawtype = "allfaces_optional",
		tiles = {tile},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {type..":sapling"}, rarity = 20},
				{items = {type..":needles"}}
			}
		},
		sound = sound:leaves(),
		climbable = true,

		after_place_node = tree.after_place_leaves,
	})
end

function tree.register_fruit(type, name, tile)
	minetest.register_node(":"..type..":fruit", {
		description = name,
		drawtype = "plantlike",
		tiles = {tile},
		inventory_image = tile,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
		},
		groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
			leafdecay = 3, leafdecay_drop = 1},
		on_use = minetest.item_eat(2),
		sounds = sound:leaves(),

		after_place_node = function(pos, placer, itemstack)
			if placer:is_player() then
				minetest.set_node(pos, {name = type..":fruit", param2 = 1})
			end
		end,
	})
end