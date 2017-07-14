-- Gravestones, Mobs, and lore found in default dungeons.
local path = minetest.get_modpath("dungeon-crawl")
dungeon-crawl = {}

dofile(path.."/spawn.lua")

minetest.register_node(":dungeon-crawl:dudresser", {
    description = "Dungeon drawer",
    tiles = {"dresser_top.png", "dresser_front.png"},
    drop = "dungeon-crawl:dudresser",
    
