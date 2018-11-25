-- bucket (Minetest 0.4 mod)
-- A bucket, which can pick up water and lava

minetest.register_alias("bucket", "bucket:bucket")
minetest.register_alias("bucket_water", "bucket:water")
minetest.register_alias("bucket_lava", "bucket:lava")

bucket = {}
bucket.liquids = {}

local function check_protection(pos, name, text)
	if minetest.is_protected(pos, name) then
		minetest.log("action", (name ~= "" and name or "A mod")
			.. " tried to " .. text
			.. " at protected position "
			.. minetest.pos_to_string(pos)
			.. " with a bucket")
		minetest.record_protection_violation(pos, name)
		return true
	end
	return false
end

-- Register a new liquid
--    source = name of the source node
--    flowing = name of the flowing node
--    itemname = name of the new bucket item (or nil if liquid is not takeable)
--    inventory_image = texture of the new bucket item (ignored if itemname == nil)
--    name = text description of the bucket item
--    groups = (optional) groups of the bucket item, for example {water_bucket = 1}
--    force_renew = (optional) bool. Force the liquid source to renew if it has a
--                  source neighbour, even if defined as 'liquid_renewable = false'.
--                  Needed to avoid creating holes in sloping rivers.
-- This function can be called from any mod (that depends on bucket).
function bucket.register(source, flowing, itemname, inventory_image, name,
		groups, force_renew)
	bucket.liquids[source] = {
		source = source,
		flowing = flowing,
		itemname = itemname,
		force_renew = force_renew,
	}
	bucket.liquids[flowing] = bucket.liquids[source]

	if itemname ~= nil then
		minetest.register_craftitem(itemname, {
			description = name,
			inventory_image = inventory_image,
			stack_max = 1,
			liquids_pointable = true,
			groups = groups,

			on_place = function(itemstack, user, pointed_thing)
				-- Must be pointing to node
				if pointed_thing.type ~= "node" then
					return
				end

				local node = minetest.get_node_or_nil(pointed_thing.under)
				local ndef = node and minetest.registered_nodes[node.name]

				-- Call on_rightclick if the pointed node defines it
				if ndef and ndef.on_rightclick and
						not (user and user:is_player() and
						user:get_player_control().sneak) then
					return ndef.on_rightclick(
						pointed_thing.under,
						node, user,
						itemstack)
				end

				local lpos

				-- Check if pointing to a buildable node
				if ndef and ndef.buildable_to then
					-- buildable; replace the node
					lpos = pointed_thing.under
				else
					-- not buildable to; place the liquid above
					-- check if the node above can be replaced

					lpos = pointed_thing.above
					node = minetest.get_node_or_nil(lpos)
					local above_ndef = node and minetest.registered_nodes[node.name]

					if not above_ndef or not above_ndef.buildable_to then
						-- do not remove the bucket with the liquid
						return itemstack
					end
				end

				if check_protection(lpos, user
						and user:get_player_name()
						or "", "place "..source) then
					return
				end

				minetest.set_node(lpos, {name = source})
				return ItemStack("bucket:bucket_empty")
			end
		})
	end
end

minetest.register_craftitem("bucket:empty", {
	inventory_image = "bucket_empty.png",
	stack_max = 1,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		-- Must be pointing to node
		if pointed_thing.type ~= "node" then
			return
		end
		-- Check if pointing to a liquid source
		n = minetest.get_node(pointed_thing.under)
		liquiddef = bucket.liquids[n.name]
		if liquiddef ~= nil and liquiddef.source == n.name and liquiddef.itemname ~= nil then
			minetest.add_node(pointed_thing.under, {name="air"})
			return {name=liquiddef.itemname}
		end
	end,
})

bucket.register (
	"water:source",
	"water:flowing",
	":water:bucket",
	"bucket_water.png",
	"Water Bucket",
	{water_bucket = 1}
)

bucket.register (
	":riverwater:source",
	":riverwater:flowing",
	":riverwater:bucket",
	"bucket_river_water.png",
	"River Water Bucket",
	{water_bucket = 1},
	true
)

bucket.register (
	"lava:source",
	"lava:flowing",
	":lava:bucket",
	"bucket_lava.png",
	"Lava Bucket"
)

crafting.register_recipe({
	type   = "inv",
	output = "bucket:empty",
	items  = { "ingot:steel 3" },
	always_known = true,
	level  = 2,
})