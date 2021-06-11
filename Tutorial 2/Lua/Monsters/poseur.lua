-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Smells like the work\rof an enemy stand.", "Poseur is posing like his\rlife depends on it.", "Poseur's limbs shouldn't be\rmoving in this way."}
commands = {"Apologize", "Pose"}
randomdialogue = {"Random\nDialogue\n1.", "Random\nDialogue\n2.", "Random\nDialogue\n3."}

sprite = "poseur" --Always PNG. Extension is added automatically.
name = "Poseur"
hp = 100
atk = 1
def = 1
check = "Check message goes here."
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

posecounter = 0

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "APOLOGIZE" then
		canspare = true
        currentdialogue = {"You've learned your lesson. Good."}
		BattleDialog({"You get on your knees and plead for your life."})
    elseif command == "POSE" then
        if posecounter == 0 then
			currentdialogue = {"What are you doing?"}
			BattleDialog({"You strike an awkward pose."})
		elseif posecounter == 1 then
			currentdialogue = {"You're getting better..."}
			BattleDialog({"You strike a less awkward pose."})
		else
			currentdialogue = {"You're really good!"}
			BattleDialog({"You strike an amazing pose."})
		end
		posecounter = posecounter + 1
    end
end