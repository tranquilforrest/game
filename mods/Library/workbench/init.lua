workbench = {}

function workbench.description( title, level )

	return game.color.background..game.color.title..title..game.color.info.."\nLevel: "..level..game.color.reset

end

--[[
type: crafting type
lvl: crafting level
def: {description, tiles, groups?, inventory? }
]]--
function workbench.register( name, type, lvl, def)
	local inv = def.inventory or { x = 8, y = (lvl + 1) }

	minetest.register_node(name, {
		shortname = def.description,
		description = workbench.description(def.description, lvl),
		tiles = def.tiles,
		paramtype2 = "facedir",
		groups = def.groups or { cracky = 2 },
		on_rightclick = crafting.make_on_rightclick(type, lvl, inv),
	})
end