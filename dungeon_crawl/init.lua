-- Mobs, and runes found in dungeons.
dungeon_crawl = {}
local path = minetest.get_modpath("dungeon_crawl")
local worldpath=minetest.get_worldpath()
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end
local function initialize_inventory()
	return {
		[1] = "",  [2] = "",  [3] = "",  [4] = "",
		[5] = "",  [6] = "",  [7] = "",  [8] = "",
		[9] = "",  [10] = "", [11] = "", [12] = "",
		[13] = "", [14] = "", [15] = "", [16] = "",
	}
end
dungeon_crawl.intllib = S
dofile(path.."/spawn.lua")
dofile(path.."/mobs/kobold.lua")
dofile(path.."/nodes.lua")
print("Dungeon Crawl mod loaded")
