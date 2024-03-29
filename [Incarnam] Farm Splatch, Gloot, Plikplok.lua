global:printMessage("--------- DEMARRAGE ------------")
global:printMessage("METTEZ VOTRE PERSONNAGE DANS INCARNAM")
global:printMessage("----------------------------")
global:printMessage("eaujaval")

MAX_PODS = 85
MIN_MONSTERS = 1
MAX_MONSTERS = 8

-- COMMENTEZ LES RESSOURCES NON A FARMER
ELEMENTS_TO_GATHER = {
}

-- COMMENTEZ LES MONSTRES SI VOUS VOULEZ ACTIVER LE MODE COMBAT (chasseur)
-- N'OUBLIEZ PAS UN AI à votre personnage!
FORBIDDEN_MONSTERS = {
}


-- Liste objets: https://docs.google.com/document/d/1fJKn5iY20RyERkruyfejeIFjDXydv9qrHHJJ3jrvpEE/edit?usp=sharing
-- Suppression si dépasse le pod max % ( MAX_PODS )
AUTO_DELETE = {
	--303, -- Bois de Frêne
}

if global:isInDialog() then
    global:printMessage("[INFO] Fermeture des fenetres encombrantes...")
    global:leaveDialog()
end

function move()
    compteurpause()
    if global:isInDialog() then
        global:printMessage("[INFO] Fermeture des fenetres encombrantes...")
        global:leaveDialog()
    end
    gather_verif()
    return {
        { map = "5,-1", changeMap = "left" },
        { map = "22,1", changeMap = "top" },
        { map = "-3,-7", changeMap = "bottom" },
        { map = "-2,-7", changeMap = "bottom" },
        { map = "-1,-7", changeMap = "bottom" },
        { map = "0,-6", changeMap = "bottom" },
        { map = "1,-6", changeMap = "bottom" },
        { map = "2,-6", changeMap = "bottom" },
        { map = "3,-6", changeMap = "bottom" },
        { map = "4,-6", changeMap = "bottom" },
        { map = "4,-5", changeMap = "left" },
        { map = "5,-5", changeMap = "left" },
        { map = "5,-4", changeMap = "left" },
        { map = "5,-3", changeMap = "left" },
        { map = "5,-2", changeMap = "left" },
        { map = "6,-2", changeMap = "left" },
        { map = "6,-1", changeMap = "left" },
        { map = "6,0", changeMap = "left" },
        { map = "6,1", changeMap = "left" },
        { map = "6,2", changeMap = "left" },
        { map = "5,2", changeMap = "top" },
        { map = "4,2", changeMap = "top" },
        { map = "3,2", changeMap = "top" },
        { map = "2,2", changeMap = "top" },
        { map = "2,1", changeMap = "top" },
        { map = "0,2", changeMap = "top" },
        { map = "-1,2", changeMap = "top" },
        { map = "-2,2", changeMap = "top" },
        { map = "-3,1", changeMap = "top" },
        { map = "-3,0", changeMap = "right" },
        { map = "-3,-1", changeMap = "right" },
        { map = "-3,-2", changeMap = "right" },
        { map = "-3,-3", changeMap = "right" },
        { map = "-3,-4", changeMap = "right" },
        { map = "-4,-4", changeMap = "right" },
        { map = "-4,-5", changeMap = "right" },
        { map = "-4,-6", changeMap = "right" },
        { map = "-4,-7", changeMap = "right" },
        { map = "4,-18", changeMap = "top" },
        { map = "4,-19", changeMap = "right" },
        { map = "5,-19", changeMap = "right" },
        { map = "1,1", changeMap = "top" },
        { map = "0,-1", changeMap = "top" },
        { map = "0,-2", gather = true, fight = true, changeMap = "left" },
        { map = "-1,-1", gather = true, fight = true, changeMap = "top|left" },
        { map = "-1,-2", gather = true, fight = true, changeMap = "bottom|left|right" },
        { map = "-2,-2", gather = true, fight = true, changeMap = "bottom" },
        { map = "-2,-1", gather = true, fight = true, changeMap = "top|bottom|right" },
        { map = "-2,0", gather = true, fight = true, changeMap = "top|right" },
        { map = "-1,0", gather = true, fight = true, changeMap = "top|bottom|left|right" },
        { map = "-1,1", gather = true, fight = true, changeMap = "top|right" },
        { map = "0,1", gather = true, fight = true, changeMap = "top|left" },
        { map = "0,0", gather = true, fight = true, changeMap = "right" },
        { map = "1,0", changeMap = "top" },
        { map = "1,-1", changeMap = "top" },
        { map = "1,-2", changeMap = "left" },
        { map = "-2,-3", changeMap = "bottom" },
        { map = "-2,-4", changeMap = "bottom" },
        { map = "-2,-5", changeMap = "bottom" },
        { map = "-2,-6", changeMap = "bottom" },
        { map = "-1,-6", changeMap = "bottom" },
        { map = "-1,-5", changeMap = "bottom" },
        { map = "-1,-4", changeMap = "bottom" },
        { map = "-1,-3", changeMap = "bottom" },
        { map = "0,-3", changeMap = "bottom" },
        { map = "0,-4", changeMap = "bottom" },
        { map = "0,-5", changeMap = "bottom" },
        { map = "1,-5", changeMap = "bottom" },
        { map = "1,-4", changeMap = "bottom" },
        { map = "1,-3", changeMap = "bottom" },
        { map = "2,-3", changeMap = "bottom" },
        { map = "2,-4", changeMap = "bottom" },
        { map = "2,-5", changeMap = "bottom" },
        { map = "3,-5", changeMap = "bottom" },
        { map = "3,-4", changeMap = "bottom" },
        { map = "3,-3", changeMap = "bottom" },
        { map = "2,-2", changeMap = "left" },
        { map = "3,-2", changeMap = "left" },
        { map = "3,-1", changeMap = "left" },
        { map = "2,-1", changeMap = "left" },
        { map = "2,0", changeMap = "left" },
        { map = "3,0", changeMap = "left" },
        { map = "4,0", changeMap = "left" },
        { map = "4,-1", changeMap = "left" },
        { map = "4,-2", changeMap = "left" },
        { map = "4,-3", changeMap = "left" },
        { map = "4,-4", changeMap = "left" },
        { map = "5,0", changeMap = "left" },
        { map = "4,1", changeMap = "left" },
        { map = "3,1", changeMap = "left" },
        { map = "-2,1", changeMap = "top" },
        { map = "-3,-6", changeMap = "right" },
        { map = "-3,-5", changeMap = "right" },
        { map = "4,-18", changeMap = "top" },
        { map = "4,-19", changeMap = "right" },
        { map = "5,-19", changeMap = "right" },
        { map = "6,-19", custom = astrubToIncarm_takePortal },
    }
end


function bank()
    return {
        { map = "-3,-6", changeMap = "bottom" },
        { map = "-2,-5", changeMap = "bottom" },
        { map = "-2,-6", changeMap = "bottom" },
        { map = "-1,-6", changeMap = "bottom" },
        { map = "-1,-5", changeMap = "bottom" },
        { map = "0,-5", changeMap = "bottom" },
        { map = "1,-5", changeMap = "bottom" },
        { map = "2,-5", changeMap = "bottom" },
        { map = "3,-5", changeMap = "bottom" },
        { map = "4,-4", changeMap = "left" },
        { map = "3,-4", changeMap = "bottom" },
        { map = "3,-3", changeMap = "right" },
        { map = "-3,-5", changeMap = "right" },
        { map = "-2,-4", changeMap = "right" },
        { map = "-1,-4", changeMap = "right" },
        { map = "0,-4", changeMap = "right" },
        { map = "1,-4", changeMap = "right" },
        { map = "2,-4", changeMap = "right" },
        { map = "0,-3", changeMap = "top" },
        { map = "-1,-3", changeMap = "top" },
        { map = "-1,-2", changeMap = "top" },
        { map = "0,-2", changeMap = "top" },
        { map = "-2,-2", changeMap = "top" },
        { map = "-2,-1", changeMap = "top" },
        { map = "-1,-1", changeMap = "top" },
        { map = "-2,0", changeMap = "top" },
        { map = "-1,0", changeMap = "top" },
        { map = "-1,1", changeMap = "top" },
        { map = "0,1", changeMap = "top" },
        { map = "0,0", changeMap = "right" },
        { map = "1,0", changeMap = "top" },
        { map = "1,-1", changeMap = "top" },
        { map = "1,-2", changeMap = "top" },
        { map = "1,-3", changeMap = "top" },
        { map = "4,-3", custom = incarnamToAstrub },
        { map = "6,-19", changeMap = "left" },
		{ map="5,-19",changeMap="left" },
		{ map="4,-19",changeMap="bottom" },
		{ map = "191104002", changeMap = "247" },
		{ map = "192415750", npcBank = true, changeMap="424" },
	}

end

function astrubToIncarm_takePortal()
	npc:npc(4398,1)
	global:delay(2500)
	npc:reply(248,400)
	npc:reply(248,383)
end

function incarnamToAstrub()
    global:clickPosition(440, 350, false)
    global:delay(1000)
    global:clickPosition(323, 399, false)
    global:delay(1000)
    global:clickPosition(341, 385, false)
end



-- THANKS TO KingDJulian#5008
function tryHavenbag()
	global.sendKey(72)
	global.delay(5000)
	global.printMessage("[AVERTISSEMENT] Havre-sac inaccessible sur la carte [" .. map.currentPos() .. "].")
	return move()
end
--


function phenix()
    return {
        global.printMessage("[ERREUR] Le personnage est devenu un fantome car il n'a plus d'energie.")
    }
end

function lost()
	global.printMessage("[AVERTISSEMENT] Personnage perdu sur la carte [" .. map.currentPos() .. "].")
    global:delay(2500)
    global:sendKey(72)
	global:printMessage("[SECURITE] Le personnage entre dans l'havre sac, en attente de debug")
    global:stopScript()
    global:printMessage("[SECURITE] SCRIPT arreté.")
end


--- OTHER FUNCTION
-- DONT TOUCH
seuil_alea = math.random(50,150)
n = 0
-- THANKS TO #migrou

function compteurpause()
	n = n + 1 	
	if n > seuil_alea then
		local pausealea = math.random(30000,90000)
		global.printMessage("Pause = " .. pausealea .. "millisec.")
	 	n = 0
		seuil_alea = math.random(50,150)
		global:delay(pausealea)
	end
end

function gather_verif()
    if (not gather()) then gather() end
end 


