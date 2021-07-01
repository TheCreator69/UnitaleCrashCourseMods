legs = CreateSprite("legs")
legs.Move(0, 0)
legs.SetPivot(0.5, 0)

torso = CreateSprite("torso")
torso.Move(0, 30)
torso.SetParent(legs)
torso.SetAnchor(0.5, 1)

head = CreateSprite("head1")
head.Move(0, 90)
head.SetParent(torso)
head.SetAnimation({"head1", "head2", "head3"}, 1/2)

function AnimatePapyrus()
	legs.MoveTo(math.sin(Time.time) * 15 + 320, legs.y)
	legs.Scale(1, 1 + math.sin(Time.time) * 0.1)
end