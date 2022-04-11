--Use this to reference the library
require "gasterblasters"
--Starts the Library
StartBlasters()
time = 0

function Update()
	--[[
	if time == 50 then
		--Creates the blasters
		--Usage: CreateBlasters(xpos,ypos,direction,shape,beamsize,playsound) Directions: 0 = pointing right, 1 = pointing down, 2 = pointing left, 3 = pointing up Shapes: 0 = regular 1 = small
		CreateBlaster(-150,0,0,1,1,false)
		CreateBlaster(-150,-75,0,1,1,false)
		CreateBlaster(-150,75,0,1,1,false)
		CreateBlaster(Player.x,150,1,1,1,false)
		Audio.PlaySound("blaster")
		time = 0
	end
	]]
	if time == 30 then
		local direction = math.random(0, 2)
		local size = math.random(0, 1)
		if direction == 0 then	-- Pointing right
			CreateBlaster(-100, math.random(-75, 75), direction, size, size, true)
		elseif direction == 1 then	-- Pointing down
			CreateBlaster(math.random(-75, 75), 100, direction, size, size, true)
		else	-- Pointing left
			CreateBlaster(100, math.random(-75, 75), direction, size, size, true)
		end
		time = 0
	end

	for i = 1, #bullets - 1, 1
	do
		if CheckFired(i) then
			bullets[i].sprite.color = {1, 0, 0}
		end
	end

	time = time + 1
	--Moves and fires the blasters. Must be used in all blaster scripts.
	HandleBlasters()
end
