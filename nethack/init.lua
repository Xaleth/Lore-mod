-- Nethack init.lua
local path = minetest.get_modpath("nethack")
nethack = {}
-- Intllib
local S
if minetest.global_exists("intllib") then
	if intllib.make_gettext_pair then
		S = intllib.make_gettext_pair()
	else
		S = intllib.Getter()
	end
else
	S = function(s) return s end
end
nethack.intllib = S

dofile(path.."/mobs/hill_orc.lua")

print("Nethack mod loaded")
