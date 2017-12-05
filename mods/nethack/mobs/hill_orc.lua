-- The hill orcs usually found in mines. They will spawn outside of dungeons and stay underground.
local S = nethack.intllib
mobs:register_mob("nethack:hill_orc", {
  gravity= 15,
  type = "monster",
  passive = false,
  hp_min = 30,
  hp_max = 30,
  visual = "mesh",
  fear_height = 30,
  textures = {
	"hill_orc.png",
  },
  visual_size = {x=1, y=3},
  mesh = -- TODO, Create mesh
  collisionbox = --What should I put in for collision box for 1 block wide and 1 block tall?
  makes_footstep_sound = true,
  view_range = 10,
  walk_velocity = 1.5,
  run_velocity = 2.0,
  rotate = 360,
  sounds = {
	-- TODO make growling and roaring orc sounds
  },
  damage = 7,
  jump = true,
  drops = {
	-- TODO drop orc corpse 100% of the time, drop armor 25% of the time, drop wielded weapons 100% of the time.
  },
  water_damage = 1,
  lava_damage = 10,
  light_damage = 0,
})
