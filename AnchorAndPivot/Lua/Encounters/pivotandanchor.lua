encountertext = "Poseur strikes a pose!"
nextwaves = {"bullettest_chaserorb"}
wavetimer = 4.0
arenasize = {155, 130}

enemies = {
"poseur"
}

enemypositions = {
{0, 0}
}

possible_attacks = {"bullettest_bouncy", "bullettest_chaserorb", "bullettest_touhou"}

function EncounterStarting()
    background = CreateSprite("black", "Top")
    --[[pivotsAndAnchors = {
        { 0,   1   }, { 0,   1   },
        { 0.5, 0   }, { 0.5, 1   },
        { 1,   1   }, { 1,   1   },
        { 1,   0.5 }, { 0,   0.5 },
        { 0.5, 0.5 }, { 0.5, 0.5 },
        { 0,   0.5 }, { 1,   0.5 },
        { 0,   0   }, { 0,   0   },
        { 0.5, 1   }, { 0.5, 0   },
        { 1,   0   }, { 1,   0   }
    }]]
	--Left: PIVOTS   Right: ANCHORS
    pivotsAndAnchors = {
        { 0.5, 0   }, { 1,   0   }, --Top Left
        { 0.5, 0   }, { 0.5, 0   }, --Top Middle
        { 0.5, 0   }, { 0,   0   }, --Top Right
        { 0.5, 0   }, { 1,   0.5 }, --Middle Left
        { 0.5, 0   }, { 0.5, 0.5 }, --Middle Middle
        { 0.5, 0   }, { 0,   0.5 }, --Middle Right
        { 0.5, 0   }, { 1,   1   }, --Bottom Left
        { 0.5, 0   }, { 0.5, 1   }, --Bottom Middle
        { 0.5, 0   }, { 0,   1   }  --Bottom Right
    }
    for i = 1, 9 do
        sprite1 = CreateSprite("bullet", "Top")
        sprite2 = CreateSprite("bullet")
        sprite1.Scale(3, 3)
        sprite2.color = { 0, 1, 0 }
        sprite2.SetParent(sprite1)
        local pivot = pivotsAndAnchors[i * 2 - 1]
        local anchor = pivotsAndAnchors[i * 2]
        sprite2.SetPivot(pivot[1], pivot[2])
        sprite2.SetAnchor(anchor[1], anchor[2])
        sprite2.MoveTo(0, 0)
        sprite1.MoveToAbs(100 + ((i - 1) % 3) * 220, 430 - math.floor((i - 1) / 3) * 160)
        text = CreateText("[font:uidialog][novoice][instant]" ..
                          "P: (" .. pivot[1] .. ", " .. pivot[2] .. ")\n" ..
                          "A: (" .. anchor[1] .. ", " .. anchor[2] .. ")",
                          { 0, 370 - math.floor((i - 1) / 3) * 160 }, 500, "Top")
        text.HideBubble()
        text.progressmode = "none"
        text.absx = sprite1.absx - text.GetTextWidth() / 2
    end
end