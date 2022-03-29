spawntimer = 0
bullets = {}

function CreateBullet(x, y)
	local bullet = CreateProjectile("bullet", x, y)
	table.insert(bullets, bullet)
end

function Update()

	if spawntimer % 120 == 0 then
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

		currentBullet.Move(0, -2)

		if currentBullet.y < -170 then
			currentBullet.Remove()
			table.remove(bullets, i)
		end
	end

	t = t + 1
end
