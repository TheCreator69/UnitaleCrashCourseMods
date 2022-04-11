blasters = require("gaster_blasters")
time = 0

function Update()
  if time == 30 then
    local direction = math.random(-90, 90) -- -90 = pointing left, 90 = pointing right, 0 = pointing down
    local endX = math.sin(-direction * math.pi / 180) * (Arena.width / 2 + 200)
    local endY = math.cos(-direction * math.pi / 180) * (Arena.height / 2 + 200)
    local xOffset = 320 -- Offsets to add, so endX & endY = 0 position blaster in the center of the arena (easier for debugging)
    local yOffset = 160

    local directionOffset = math.random(-10, 10) -- Add some random rotation after calculating position, so blasters don't fire to the dead center of the arena
    local coolBlaster = blasters.New(endX + xOffset, -100, endX + xOffset, endY + yOffset, direction + directionOffset)

    function coolBlaster.OnBeam(bullet)
      coolBlaster.sprite.color32 = {255, 0, 0}
    end
    time = 0
  end

  time = time + 1
  blasters.Update()
end

function OnHit(bullet)
  Player.Hurt(1)
end
