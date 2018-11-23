terrain = {}
terrain.path = minetest.get_modpath("terrain")

dofile(terrain.path.."/nodes.lua")
dofile(terrain.path.."/biomes.lua")
--dofile(terrain.path.."/ores.lua")
--dofile(terrain.path.."/decorations.lua")


--
-- Detect mapgen, flags and parameters to select functions
--

-- Get setting or default
local mgv7_spflags =
	minetest.get_mapgen_setting("mgv7_spflags") or	"mountains, ridges, floatlands, caverns"
local captures_float = string.match(mgv7_spflags, "floatlands")
local captures_nofloat = string.match(mgv7_spflags, "nofloatlands")

-- Get setting or default
-- Make global for mods to use to register floatland biomes
terrain.mgv7_floatland_level =
	minetest.get_mapgen_setting("mgv7_floatland_level") or 1280

terrain.mgv7_shadow_limit =
	minetest.get_mapgen_setting("mgv7_shadow_limit") or 1024

minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name == "v6" then
	terrain.register_ores_mgv6()
	--terrain.register_decorations_mgv6()
-- Need to check for 'nofloatlands' because that contains
-- 'floatlands' which makes the second condition true.
elseif mg_name == "v7" and
		captures_float == "floatlands" and
		captures_nofloat ~= "nofloatlands" then
	-- Mgv7 with floatlands and floatland biomes
	terrain.register_biomes(terrain.mgv7_shadow_limit - 1)
	terrain.register_floatland_biomes(
		terrain.mgv7_floatland_level, terrain.mgv7_shadow_limit)
	--terrain.register_ores()
	--terrain.register_decorations()
else
	terrain.register_biomes(31000)
	--terrain.register_ores()
	--terrain.register_decorations()
end
