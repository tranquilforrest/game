

minetest.register_abm({
	nodenames = {"soil:dirt"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			if name == "default:snow" or name == "default:snowblock" then
				minetest.set_node(pos, {name = "default:dirt_with_snow"})
			else
				minetest.set_node(pos, {name = "soil:grass"})
			end
		end
	end
})

function check_reg(set, key)
    return set[key] ~= nil
end

local function get_type(pos)  --1 for left, 2 for right, 3 for behind, 4 for front
	local l1 = minetest.env:get_node({x=pos.x+1, y=pos.y, z=pos.z}).name
	local l2 = minetest.env:get_node({x=pos.x, y=pos.y, z=pos.z+1}).name
	local r1 = minetest.env:get_node({x=pos.x-1, y=pos.y, z=pos.z}).name
	local r2 = minetest.env:get_node({x=pos.x, y=pos.y, z=pos.z-1}).name
	if l1 == nil or l2 == nil or r1 == nil or r2 == nil then return end
	if not check_reg(minetest.registered_nodes, l1) or not check_reg(minetest.registered_nodes, r1) or not check_reg(minetest.registered_nodes, l2) or not check_reg(minetest.registered_nodes, r2) then return end
	if l1 == "air" or not minetest.registered_nodes[l1].walkable then
		return 1
	elseif r1 == "air" or not minetest.registered_nodes[r1].walkable then
		return 2
	elseif l2 == "air" or not minetest.registered_nodes[l2].walkable then
		return 3
	elseif r2 == "air" or not minetest.registered_nodes[r2].walkable then
		return 4
	else
		return 0
	end
end

local function is_edge(pos)
	local l1 = minetest.env:get_node({x=pos.x-1, y=pos.y, z=pos.z}).name
	local l2 = minetest.env:get_node({x=pos.x, y=pos.y, z=pos.z-1}).name
	local r1 = minetest.env:get_node({x=pos.x+1, y=pos.y, z=pos.z}).name
	local r2 = minetest.env:get_node({x=pos.x, y=pos.y, z=pos.z+1}).name
	if l1 == nil or l2 == nil or r1 == nil or r2 == nil then return end
	if not check_reg(minetest.registered_nodes, l1) or not check_reg(minetest.registered_nodes, r1) or not check_reg(minetest.registered_nodes, l2) or not check_reg(minetest.registered_nodes, r2) then return end
	if l1 == "air" or not minetest.registered_nodes[l1] or
	l2 == "air" or not minetest.registered_nodes[l2].walkable or
	l3 == "air" or not minetest.registered_nodes[r1].walkable or
	l4 == "air" or not minetest.registered_nodes[r2].walkable then
		return true
	end

end

local function check(pos)
	if string.find(minetest.env:get_node(pos).name, "grass") then
		return true
	else
		return false
	end
end

minetest.register_abm({
	nodenames = {"soil:grass", "soil:grass_1", "soil:grass_2", "soil:grass_3", "soil:grass_4"},
	interval = 2,
	chance = 20,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local under = {x=pos.x, y=pos.y-1, z=pos.z}
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local under_front = {x=pos.x+1, y=pos.y-1, z=pos.z}
		local under_front2 = {x=pos.x, y=pos.y-1, z=pos.z+1}
		local under_back = {x=pos.x-1, y=pos.y-1, z=pos.z}
		local under_back2 = {x=pos.x, y=pos.y-1, z=pos.z-1}
		local name = minetest.env:get_node(above).name
		local nodedef = minetest.registered_nodes[name]

		if name == nil or not nodedef then return end

		if name ~= "ignore"
				and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "soil:dirt"})
		end

		if name == "air" or not minetest.registered_nodes[name].walkable then
		if get_type(pos) ~= 0 then
			local typ = get_type(pos)
			local ok = false
			if typ == 1 then
				ok = check(under_front)
			elseif typ == 2 then
				ok = check(under_back)
			elseif typ == 3 then
				ok = check(under_front2)
			elseif typ == 4 then
				ok = check(under_back2)
			end
			if ok then
				if minetest.env:get_node(under).name == "soil:dirt" then 
					if not is_edge(under) then
						minetest.env:set_node(pos, {name="soil:grass_full_"..math.random(1,4)})	
					end
				else
					minetest.env:set_node(pos, {name="soil:grass_full_"..math.random(1,4)})
				end
			end
		end
		end

	end
})