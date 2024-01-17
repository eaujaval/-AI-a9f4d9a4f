global:printMessage("--------- DEMARRAGE ------------")
global:printMessage("METTEZ VOTRE PERSONNAGE AU Zaap pandala")
global:printMessage("----------------------------")
MAX_PODS = 75

ELEMENTS_TO_GATHER = {
-- AGRICULTURE
    111, --Riz
-- PECHEUR
    266, --Dorade Grise
    267, --Perche
    269, --Lotte
-- ALCHIMISTE
    112, --Pandouille
-- AUTRE
84, -- Puits
}

function move()
    compteurpause()

    if global:isInDialog() then
        global:printMessage("[INFO] Fermeture des fenetres encombrantes...")
        global:leaveDialog()
    end

    gather_verif()
    checkBag()

    return {
        { map = "0,0", changeMap = "zaap(121,217,207619076)" },
        { map = "207619076", custom=function() global.delay(800) global:clickPosition(135, 370, false) end },
        { map = "20,-29", gather = true, changeMap = "right" },
        { map = "21,-29", gather = true, changeMap = "bottom" },
        { map = "21,-28", gather = true, changeMap = "bottom" },
        { map = "21,-27", gather = true, changeMap = "bottom" },
        { map = "21,-26", gather = true, changeMap = "bottom" },
        { map = "21,-25", gather = true, changeMap = "bottom" },
        { map = "21,-24", gather = true, changeMap = "right" },
        { map = "22,-24", gather = true, changeMap = "bottom" },
        { map = "22,-23", gather = true, changeMap = "right" },
        { map = "23,-23", gather = true, changeMap = "bottom" },
        { map = "23,-22", gather = true, changeMap = "left" },
        { map = "22,-22", gather = true, changeMap = "left" },
        { map = "21,-22", gather = true, changeMap = "left" },
        { map = "20,-22", gather = true, changeMap = "top" },
        { map = "20,-23", gather = true, changeMap = "left" },
        { map = "19,-23", gather = true, changeMap = "bottom" },
        { map = "19,-22", gather = true, changeMap = "left" },
        { map = "18,-22", gather = true, changeMap = "top" },
        { map = "18,-23", gather = true, changeMap = "top" },
        { map = "18,-24", gather = true, changeMap = "right" },
        { map = "19,-24", gather = true, changeMap = "right" },
        { map = "20,-24", gather = true, changeMap = "top" },
        { map = "20,-25", gather = true, changeMap = "top" },
        { map = "20,-26", gather = true, changeMap = "right" },
    }
end

function bank()
	return {
		{ map = "0,0", changeMap = "zaap(121,217,191105026)" },
		{ map = "5,-18", changeMap = "left" },
		{ map = "191104002", changeMap = "247" },
		{ map = "192415750", npcBank = true, havenbag = true },
		{ map = map.currentMapId(), havenbag = true },
	}
end

function phoenix()
        global.printMessage("[ERREUR] Le personnage est devenu un fantome car il n'a plus d'energie.")
    return {
        { map = "35,-42", changeMap = "bottom" },
        { map = "35,-41", changeMap = "bottom" },
        { map = "35,-40", custom=function() global.delay(800) global:clickPosition(570, 163, false) end, havenbag = true },
    }
end

function lost()
    move()
	return {
		{ map = map.currentMapId(), havenbag=true },
	}
end

--- OTHER FUNCTION

function checkBag()
	while inventory:itemCount(7947) > 0	-- Sac de Riz
	or inventory:itemCount(7970) > 0	-- Sac de Graines de Pandouille
	or inventory:itemCount(7994) > 0	-- Sac de Perches
	or inventory:itemCount(16535) > 0	-- Sac de Dorades Grises
	or inventory:itemCount(16536) > 0	-- Sac de Lottes
	do openBag()
    end
end

function openBag()
    global:delay(500)
    global:sendKey(73) -- I
	global:printMessage("[INFO] Ouverture de l'inventaire.")
    global:delay(1000)
    global:clickPosition(545,65) -- Onglet Consommables
	global:printMessage("[INFO] Ouverture de l'onglet consommables")
    global:delay(500)
    global:clickPosition(485, 105) -- Sac de ressource
    global:delay(100)
    global:clickPosition(477, 112) -- Sac de ressource
    global:clickPosition(477, 112) -- Sac de ressource
	global:printMessage("[INFO] Ouverture des sacs a ressources")
    global:delay(500)
    global:sendKey(73) -- I
	global:printMessage("[INFO] Referme l'inventaire")
    global:delay(1000)
end

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
