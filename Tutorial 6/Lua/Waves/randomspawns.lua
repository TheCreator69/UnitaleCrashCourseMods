spawndelay = 0
bullets = {}

function CreateBullet(x, y)
	local bullet = CreateProjectile("bullet", x, y)
	table.insert(bullets, bullet)
end

function Update()
	
	if spawndelay == 0 then
		local randX = math.random(0, Arena.width / 2 + 40)
		local randY = 0
		if randX < Arena.width / 2 + 20 then
			randY = math.random(Arena.height / 2 + 20, Arena.height / 2 + 40)
		else
			randY = math.random(0, Arena.height / 2 + 40)
		end
		
		randomizer = math.random(0, 3)
		if randomizer == 1 then
			randX = -randX
		elseif randomizer == 2 then
			randY = -randY
		elseif randomizer == 3 then
			randX = -randX
			randY = -randY
		end
		CreateBullet(randX, randY)
		
		spawndelay = math.random(15, 45)
	end
	
	for i = #bullets, 1, -1
	do
		currentBullet = bullets[i]
		
		--currentBullet.Move(0, -2)
		
		if currentBullet.y < -170 then
			currentBullet.Remove()
			table.remove(bullets, i)
		end
	end
	
	spawndelay = spawndelay - 1
end