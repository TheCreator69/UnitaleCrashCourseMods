frametimer = 0
bullets = {}

function CreateBullet(x, y)
	local bullet = CreateProjectile("bullet", x, y)
	xDifference = Player.x - bullet.x
	yDifference = Player.y - bullet.y
	lengthSquared = math.pow(xDifference, 2) + math.pow(yDifference, 2)
	length = math.sqrt(lengthSquared)
	bullet["velx"] = xDifference / length * 2
	bullet["vely"] = yDifference / length * 2
	bullet["frame_spawned"] = frametimer
	table.insert(bullets, bullet)
end

function Update()
	
	if frametimer % 120 == 0 then
		for i = 0, 4, 1
		do
			local xPos = -Arena.width / 2 + i * Arena.width / 4
			local yPos = Arena.height / 2 + 50
			CreateBullet(xPos, yPos)
		end
	end
	
	for i = #bullets, 1, -1
	do
		currentBullet = bullets[i]
		bulletAge = frametimer - currentBullet["frame_spawned"]
		
		if bulletAge > 45 then
			currentBullet.Move(currentBullet["velx"], currentBullet["vely"])
		end
		
		if currentBullet.y < -170 then
			currentBullet.Remove()
			table.remove(bullets, i)
		end
	end
	
	frametimer = frametimer + 1
end