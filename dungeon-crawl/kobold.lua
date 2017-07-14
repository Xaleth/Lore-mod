-- The kobold mob that is rarer than the goblin and slightly larger.
mobs:register_mob("dungeon-crawl:kobold", {
    type = "monster",
    hp_max = 35,
    hp_min = 30,
    visual = "mesh",
    fear_height = 10,
    textures = -- How do I add .png files to GitHub repo? What do you think the Kobold should look like?
    visual_size = {x=1, y=3},
    mesh = -- How do I create meshes?
    collisionbox = -- What the heck is a collisionbox?
    makes_footstep_sound = true,
    view_range = 15,
    walk_velocity = 1.0,
    run_velocity = 1.5,
    lifetimer = -- What does this do?
    rotate = 360,
  sounds = {
      -- TODO, make sounds.
      }
    damage = 4,
    jump = true,
    drops = {
      -- TODO, drop a kobold corpse with a chance of 100%, drop everything the kobold is wielding, low chance of potions.
      }
    water_damage = 0,
    lava_damage = 12,
    light_damage = 0,
    end
  end
})
-- TODO, make kobold spawn only occasionally in the catacombs. Make kobold model, make kobold animations. Make kobold slightly more difficult than goblin.
