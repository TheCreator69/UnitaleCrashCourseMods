wavetimer = 0
bullet = CreateProjectile("bullet", 30, 30)

function Update()
	if wavetimer < 60 then
		bullet.Move(0, -1)
	elseif wavetimer < 120 then
		bullet.Move(-1, 0)
	elseif wavetimer < 180 then
		bullet.Move(0, 1)
	elseif wavetimer < 240 then
		bullet.Move(1, 0)
	end
	
	wavetimer = wavetimer + 1
end