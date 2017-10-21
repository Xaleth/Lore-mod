local S = mobs.intllib
mobs:register_mob("dungeon_crawl:kobold", {
  type = "monster",
  passive = false,
  attack_type = "dogfight",
  hp_max = 12,
  gravity = 20,
  hp_min = 12,
  visual = "mesh",
  fear_height = 10,
  textures = {
    "kobold.png"
  },
  initial_inventory = {
	{"default:sword_steel", chance = 1},
	{"default:sword_bronze", chance 1}
  },
  if initial_inventory={"default:sword_steel"}; then
		"default:sword_bronze" = nil
  end,
  if initial_inventory={"default:sword_bronze"}; then
		"default:sword_steel" = nil
  end,
  visual_size = {x=1, y=2},
  mesh = "character.b3d",
  collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
  makes_footstep_sound = true,
  view_range = 15,
  walk_velocity = 1.0,
  run_velocity = 1.5,
  rotate = 360,
  armor = 70,
  light_resistant = true,
  sounds = {
      -- TODO, make sounds.
  },
  damage = 4,
  jump = true,
  drops = {
	{name = "dungeon_crawl:kobold_corpse", chance = 1, min = 1, max = 1},
	
      -- TODO, Drop everything the kobold is wielding.
  },
  animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 0,
		stand_end = 15,
		walk_start = 14,
		walk_end = 30,
		run_start = 30,
		run_end = 60,
		punch_start = 30,
		punch_end = 70,
  },
  water_damage = 0,
  lava_damage = 12,
  light_damage = 0,
})
mobs:spawn({
  name = "dungeon_crawl:kobold",
  nodes = {"default:cobble", "default:mossycobble"},
  max_light = 10,
  chance 350,
  active_object_count = 1,
  max_height = -100,
})
mobs:register_egg("dungeon_crawl:kobold", S("Kobold"), "kobold.png", 1, true)

-- Wielded weapon

--TODO, Make kobold model, make kobold slightly more difficult than goblin.
