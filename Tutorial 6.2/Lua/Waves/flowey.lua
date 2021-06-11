frametimer = 0
bullets = {}

bulletamount = 40
spawntime = 200

Player.hp = 1

function CreateBullet(x, y)
	local bullet = CreateProjectile("bullet", x, y)
	bullet["velx"] = -bullet.x / 200
	bullet["vely"] = -bullet.y / 200
	table.insert(bullets, bullet)
end

function Update()
	
	bulletAmountMultiplier = spawntime / bulletamount / 2
	
	if frametimer % 5 == 0 and frametimer < spawntime then
		local xPos = math.sin(frametimer / (bulletamount * bulletAmountMultiplier) * math.pi) * (Arena.width / 2 + 40)
		local yPos = math.cos(frametimer / (bulletamount * bulletAmountMultiplier) * math.pi) * (Arena.height / 2 + 40)
		CreateBullet(xPos, yPos)
	end
	
	for i = #bullets, 1, -1
	do
		currentBullet = bullets[i]
		
		if frametimer > spawntime then
			currentBullet.Move(currentBullet["velx"], currentBullet["vely"])
		end
	end
	
	frametimer = frametimer + 1
end

function OnHit(bullet)
	if bullet.isactive then
		for i = #bullets, 1, -1
		do
			currentBullet = bullets[i]
			currentBullet.Remove()
			table.remove(bullets, i)
		end
		Player.Heal(20)
	end
end