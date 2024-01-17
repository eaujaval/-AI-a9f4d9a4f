global:printMessage("--------- DEMARRAGE ------------")
global:printMessage("METTEZ VOTRE PERSONNAGE ZAAP VILLAGE D'AMAKNA")
global:printMessage("----------------------------")
MAX_PODS = 90

-- N'OUBLIEZ PAS UN AI à votre personnage!
-- NE METTEZ PAS D'AI SI VOUS VOULEZ GERER SEULEMENT LE CMBT : https://forum.cheat-gam3.com/threads/noai-retrait-de-lai-pour-g%C3%A9rer-le-combat.213376/#post-1819999

-- mettre 17528 si pas de nourriture
-- choissiez votre nourriture si vous voulez regenerer votre bot avec nourriture : https://snowbot.eu/objets.txt
NOURRITURE = 17528

-- LE BOT COMMENCE VIA QUEL DOPEUL? par defaut SRAM ensuite 2 = Huppermage...
DOPEUL = 1

dopeuls = {
	"Sram",
	"Huppermage",
	"Sacrieur",
	"Enutrof",
	"Ecaflip",
	"Zobal",
	"Pandawa",
	"Eliotrope",
	"Xelor",
	"Eniripsa",
	"Osamodas",
	"Steamer",
	"Feca",
	"Ouginiak",
	"Roublard",
	"Iop",
	"Cra",
	"Sadida",
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

    if global:isInDialog() then
        global:printMessage("[INFO] Fermeture des fenetres encombrantes...")
        global:leaveDialog()
    end

    if(DOPEUL <= 18) then
        global:printMessage('[INFO] Bot en route vers le dopeul ' .. dopeuls[DOPEUL])
        return dopeul[dopeuls[DOPEUL]]()
    elseif(DOPEUL > 18) then
	    global:printMessage("[FIN] Le bot a fini tous les dopeuls, si il vous en manque configurez à partir de quel dopeul commencer dans la configuration")
        global:stopScript()
    end

end

dopeul = {
	["Sram"] = function()
		return {
		{ map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
        { map = "-2,0", changeMap = "left" },
        { map = "-3,0", changeMap = "left" },
        { map = "88214295", custom=function() global.delay(800) global:clickPosition(413, 222, false) end },
        { map = "183768064", custom=function() global.delay(800) global:clickPosition(79, 148, false) end },
        { map = "183768066", custom=function() clickPNJ(1,290,219) end },
		}
	end,
	["Huppermage"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
		    { map = "-2,0", changeMap = "left" },
            { map = "183768066", custom=function() global.delay(800) global:clickPosition(616, 437, false) end },
            { map = "183768064", custom=function() global:clickPosition(610, 384, false) end },
            { map = "88214295", changeMap = "right" },
            { map = "-3,0", changeMap = "top" },
            { map = "-3,-1", changeMap = "top" },
            { map = "-3,-2", changeMap = "left" },
            { map = "88214297", custom=function() global:clickPosition(313, 193, true) end },
            { map = "37,-19", changeMap = "top" },
            { map = "38,-20", changeMap = "right" },
            { map = "38,-20", changeMap = "right" },
            { map = "39,-20", changeMap = "top" },
            { map = "163055361", custom=function() global:clickPosition(606, 366, false) end },
            { map = "163053570", custom=function() clickPNJ(2,295,303) end },
		}
	end,
	["Sacrieur"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "-2,0", changeMap = "right" },
            { map = "-1,0", changeMap = "top" },
            { map = "-1,-1", changeMap = "top" },
            { map = "-1,-2", changeMap = "top" },
            { map = "-1,-3", changeMap = "left" },
            { map = "-2,-3", changeMap = "left" },
            { map = "-3,-3", changeMap = "top" },
            { map = "39,-21", changeMap="bottom" },
            { map = "39,-20", changeMap="left" },
            { map = "38,-20", changeMap="bottom" },
            { map = "37,-19", custom=function() global:clickPosition(423, 113, false) end },
            { map = "-4,-2", changeMap="right" },
            { map = "-3,-2", changeMap="right" },
            { map = "-2,-2", changeMap="top" },
            { map = "-2,-3", changeMap="top" },
            { map = "-2,-4", changeMap="left" },
            { map = "185861637", custom=function() global:clickPosition(217, 164, true) end },
            { map = "183767054", custom=function() global:clickPosition(133, 112, false) end },
            { map = "183767052", custom=function() global:clickPosition(580, 138, false) end },
            { map = "183767050", custom=function() clickPNJ(3,403,223) end },
		}
	end,
	["Enutrof"] = function()
		return {
		    { map = "-2,0", changeMap = "right" },
            { map = "-1,0", changeMap = "top" },
            { map = "-1,-1", changeMap = "top" },
            { map = "-1,-2", changeMap = "top" },
            { map = "-1,-3", changeMap = "top" },
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "183767050", changeMap="bottom" },
            { map = "183767052", changeMap="bottom" },
            { map = "183767054", changeMap="right" },
            { map = "185861637", changeMap="right" },
            { map = "-2,-4", changeMap="right" },
            { map = "185862661", custom=function() global.delay(800) global:clickPosition(408, 300, true) end },
            { map = "17048576", custom=function() global.delay(800) global:clickPosition(129, 239, false) end },
            { map = "17048578", custom=function() clickPNJ(4,401,252) end },
		}
	end,
	["Ecaflip"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "-2,0", changeMap = "right" },
            { map = "-1,0", changeMap = "top" },
            { map = "-1,-1", changeMap = "top" },
            { map = "-1,-2", changeMap = "top" },
            { map = "-1,-3", changeMap = "right" },
            { map = "0,-3", changeMap = "right" },
            { map = "1,-3", changeMap = "top" },
            { map = "1,-4", changeMap = "top" },
            { map = "17048578", custom=function() global.delay(800) global:clickPosition(161, 246, false) end },
            { map = "17048576", custom=function() global:clickPosition(359, 394, false) end },
            { map = "185862661", changeMap="right" },
            { map = "0,-4", changeMap="right" },
            { map = "1,-4", changeMap="top" },
            { map = "185863684", custom=function() global:clickPosition(306, 266, true) end },
            { map = "183766016", custom=function() global:clickPosition(451, 205, false) end },
            { map = "183766018", custom=function() global:clickPosition(323, 156, false) end },
            { map = "183766020", custom=function() clickPNJ(5,562,214) end },
		}
	end,
	["Zobal"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "-2,0", changeMap = "right" },
            { map = "-1,0", changeMap = "top" },
            { map = "-1,-1", changeMap = "top" },
            { map = "-1,-2", changeMap = "top" },
            { map = "-1,-3", changeMap = "right" },
            { map = "0,-3", changeMap = "top" },
            { map = "0,-4", changeMap = "top" },
            { map = "183766020", custom=function() global.delay(800) global:clickPosition(508, 90, false) end },
            { map = "183766018", custom=function() global.delay(800) global:clickPosition(201, 403, false) end },
            { map = "183766016", custom=function() global.delay(800) global:clickPosition(183, 394, false) end },
            { map = "185863684", changeMap="left" },
            { map = "0,-5", changeMap="top" },
            { map = "0,-6", changeMap="top" },
            { map = "0,-7", changeMap="right" },
            { map = "1,-7", changeMap="top" },
            { map = "70778880", custom=function() global.delay(800) global:clickPosition(179, 56, false) end },
            { map = "69206274", custom=function() global.delay(800) global:clickPosition(520, 25, false) end },
            { map = "69207298", custom=function() global.delay(800) global:clickPosition(96, 107, false) end },
            { map = "69209346", custom=function() global.delay(800) global:clickPosition(344, 224, false) end },
            { map = "69208064", custom=function() global.delay(800) global:clickPosition(486, 213, false) end },
            { map = "69207040", custom=function() clickPNJ(6,426,236) end },
		}
	end,
	["Pandawa"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "bottom" },
            { map = "-2,1", changeMap = "right" },
            { map = "-1,1", changeMap = "right" },
            { map = "0,1", changeMap = "right" },
            { map = "1,1", changeMap = "right" },
            { map = "2,1", changeMap = "top" },
            { map = "2,0", changeMap = "right" },
            { map = "3,0", changeMap = "top" },
            { map = "3,-1", changeMap = "right" },
            { map = "4,-1", changeMap = "top" },
            { map = "69207040", custom=function() global.delay(800) global:clickPosition(181, 213, false) end },
            { map = "69208064", custom=function() global.delay(800) global:clickPosition(338, 428, false) end },
            { map = "69209346", custom=function() global.delay(800) global:clickPosition(508, 368, false) end },
            { map = "69207298", custom=function() global.delay(800) global:clickPosition(73, 354, false) end },
            { map = "69206274", custom=function() global.delay(800) global:clickPosition(550, 326, false) end },
            { map = "70778880", changeMap="556" },
            { map = "1,-7", changeMap="bottom" },
            { map = "1,-6", changeMap="left" },
            { map = "0,-6", changeMap="bottom" },
            { map = "0,-5", changeMap="bottom" },
            { map = "0,-4", changeMap="right" },
            { map = "1,-4", changeMap="bottom" },
            { map = "1,-3", changeMap="bottom" },
            { map = "1,-2", changeMap="right" },
            { map = "2,-2", changeMap="right" },
            { map = "3,-2", changeMap="right" },
            { map = "88082201", custom=function() global.delay(800) global:clickPosition(175, 245, false) end },
            { map = "183769088", custom=function() global.delay(800) global:clickPosition(491, 152, false) end },
            { map = "183769090", custom=function() clickPNJ(7,358,247) end },
		}
	end,
	["Eliotrope"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "bottom" },
            { map = "-2,1", changeMap = "right" },
            { map = "-1,1", changeMap = "right" },
            { map = "0,1", changeMap = "right" },
            { map = "1,1", changeMap = "right" },
            { map = "2,1", changeMap = "top" },
            { map = "2,0", changeMap = "right" },
            { map = "3,0", changeMap = "right" },
            { map = "183769090", custom=function() global.delay(800) global:clickPosition(177, 368, false) end },
            { map = "183769088", custom=function() global.delay(800) global:clickPosition(454, 345, false) end },
            { map = "88082201", changeMap="bottom" },
            { map = "4,-1", changeMap="bottom" },
            { map = "88082199", changeMap="274" },
            { map = "16,33", changeMap="right" },
            { map = "16,32", changeMap="left" },
            { map = "15,32", custom=function() clickPNJ(8,294,207) end },
		}
	end,
	["Xelor"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "bottom" },
            { map = "-2,1", changeMap = "right" },
            { map = "-1,1", changeMap = "right" },
            { map = "0,1", changeMap = "right" },
            { map = "1,1", changeMap = "right" },
            { map = "2,1", changeMap = "right" },
            { map = "15,32", changeMap="right" },
            { map = "16,32", changeMap="bottom" },
            { map = "16,33", custom=function() AmaknaTempleOrReverse(407, 391, 422, 417) end },
            { map = "4,0", changeMap="bottom" },
            { map = "4,1", changeMap="left" },
            { map = "88081686", custom=function() global.delay(800) global:clickPosition(464, 277, false) end },
            { map = "183763982", custom=function() global.delay(800) global:clickPosition(517, 113, false) end },
            { map = "183763980", custom=function() clickPNJ(9,402,203) end },
		}
	end,
	["Eniripsa"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "bottom" },
            { map = "-2,1", changeMap = "bottom" },
            { map = "-2,2", changeMap = "right" },
            { map = "-1,2", changeMap = "bottom" },
            { map = "-1,3", changeMap = "right" },
            { map = "0,3", changeMap = "right" },
            { map = "1,3", changeMap = "right" },
            { map = "2,3", changeMap = "right" },
            { map = "3,3", changeMap = "right" },
            { map = "4,3", changeMap = "right" },
            { map = "5,3", changeMap = "right" },
            { map = "6,3", changeMap = "right" },
            { map = "7,3", changeMap = "top" },
            { map = "7,2", changeMap = "top" },
            { map = "183763980", custom=function() global.delay(800) global:clickPosition(181, 326, false) end },
            { map = "183763982", custom=function() global.delay(800) global:clickPosition(154, 382, false) end },
            { map = "88081686", changeMap="right" },
            { map = "4,1", changeMap="right" },
            { map = "5,1", changeMap="right" },
            { map = "6,1", changeMap="right" },
            { map = "88083734", custom=function() global.delay(800) global:clickPosition(315, 307, false) end },
            { map = "183763968", custom=function() global.delay(800) global:clickPosition(473, 249, false) end },
            { map = "183763970", custom=function() global.delay(800) global:clickPosition(428, 149, false) end },
            { map = "183763974", custom=function() clickPNJ(10,449,228) end },
		}
	end,
	["Osamodas"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "bottom" },
            { map = "-2,1", changeMap = "bottom" },
            { map = "-2,2", changeMap = "right" },
            { map = "-1,2", changeMap = "bottom" },
            { map = "-1,3", changeMap = "right" },
            { map = "0,3", changeMap = "right" },
            { map = "1,3", changeMap = "right" },
            { map = "2,3", changeMap = "right" },
            { map = "3,3", changeMap = "right" },
            { map = "4,3", changeMap = "right" },
            { map = "5,3", changeMap = "right" },
            { map = "6,3", changeMap = "right" },
            { map = "7,3", changeMap = "right" },
            { map = "8,3", changeMap = "top" },
            { map = "183763974", custom=function() global.delay(800) global:clickPosition(158, 379, false) end },
            { map = "183763970", custom=function() global.delay(800) global:clickPosition(593, 207, false) end },
            { map = "183763968", changeMap="bottom" },
            { map = "88083734", changeMap="bottom" },
            { map = "7,2", changeMap="right" },
            { map = "88084245", custom=function() global.delay(800) global:clickPosition(432, 296, false) end },
            { map = "183762946", custom=function() global.delay(800) global:clickPosition(155, 177, false) end },
            { map = "183762944", custom=function() clickPNJ(11,360,271) end },
		}
	end,
	["Steamer"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "bottom" },
            { map = "-2,1", changeMap = "bottom" },
            { map = "-2,2", changeMap = "right" },
            { map = "-1,2", changeMap = "bottom" },
            { map = "-1,3", changeMap = "right" },
            { map = "0,3", changeMap = "right" },
            { map = "1,3", changeMap = "right" },
            { map = "2,3", changeMap = "right" },
            { map = "3,3", changeMap = "right" },
            { map = "4,3", changeMap = "right" },
            { map = "5,3", changeMap = "right" },
            { map = "6,3", changeMap = "right" },
            { map = "7,3", changeMap = "right" },
            { map = "8,3", changeMap = "right" },
            { map = "9,3", changeMap = "top" },
            { map = "9,2", changeMap = "top" },
            { map = "183762944", custom=function() global.delay(800) global:clickPosition(530, 400, false) end },
            { map = "183762946", custom=function() global.delay(800) global:clickPosition(140, 386, false) end },
            { map = "88084245", changeMap="right" },
            { map = "9,2", changeMap="top" },
            { map = "68420616", custom=function() global.delay(800) global:clickPosition(418, 109, false) end },
            { map = "95423492", custom=function() global.delay(800) global:clickPosition(400, 239, false) end },
            { map = "96470786", custom=function() global.delay(800) global:clickPosition(340, 315, false) end },
            { map = "96470528", custom=function() global.delay(800) global:clickPosition(450, 413, false) end },
            { map = "96471552", custom=function() clickPNJ(12,200,399) end },
		}
	end,
	["Feca"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88082704)" }, -- Zaap Coin bouf
		    { map = "5,7", changeMap = "right" },
            { map = "6,7", changeMap = "right" },
            { map = "7,7", changeMap = "right" },
            { map = "8,7", changeMap = "right" },
            { map = "9,7", changeMap = "right" },
            { map = "10,7", changeMap = "top" },
            { map = "10,6", changeMap = "top" },
            { map = "10,5", changeMap = "right" },
            { map = "11,5", changeMap = "right" },
            { map = "96471552", custom=function() global.delay(800) global:clickPosition(186, 227, false) end },
            { map = "96470528", custom=function() global.delay(800) global:clickPosition(221, 413, false) end },
            { map = "96470528", custom=function() global.delay(800) global:clickPosition(221, 413, false) end },
            { map = "96470786", custom=function() global.delay(800) global:clickPosition(221, 392, false) end },
            { map = "95423492", custom=function() AmaknaTempleOrReverse(154, 360, 170, 389) end },
            { map = "9,1", changeMap="right" },
            { map = "10,1", changeMap="547" },
            { map = "10,2", changeMap="bottom" },
            { map = "10,3", changeMap="bottom" },
            { map = "10,4", changeMap="right" },
            { map = "11,4", changeMap="bottom" },
            { map = "11,5", changeMap="right" },
            { map = "88086290", custom=function() global.delay(800) global:clickPosition(442, 185, false) end },
            { map = "183764992", custom=function() global.delay(800) global:clickPosition(509, 120, false) end },
            { map = "183764996", changeMap="top" },
            { map = "183764998", custom=function() global.delay(800) global:clickPosition(47, 460, false) end },
            { map = "183764994", custom=function() clickPNJ(13,313,250) end },
		}
	end,
	["Ouginiak"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "bottom" },
            { map = "-2,1", changeMap = "bottom" },
            { map = "-2,2", changeMap = "right" },
            { map = "-1,2", changeMap = "bottom" },
            { map = "-1,3", changeMap = "right" },
            { map = "0,3", changeMap = "right" },
            { map = "1,3", changeMap = "right" },
            { map = "2,3", changeMap = "right" },
            { map = "3,3", changeMap = "right" },
            { map = "4,3", changeMap = "right" },
            { map = "5,3", changeMap = "right" },
            { map = "6,3", changeMap = "right" },
            { map = "7,3", changeMap = "right" },
            { map = "8,3", changeMap = "right" },
            { map = "9,3", changeMap = "right" },
            { map = "10,3", changeMap = "right" },
            { map = "11,3", changeMap = "right" },
            { map = "183764994", custom=function() global.delay(800) global:clickPosition(497, 135, false) end },
            { map = "183764998", custom=function() global.delay(800) global:clickPosition(540, 455, false) end },
            { map = "183764996", changeMap="left" },
            { map = "183764992", custom=function() global.delay(800) global:clickPosition(45, 460, false) end },
            { map = "88086290", changeMap="top" },
            { map = "12,4", changeMap="top" },
            { map = "88086292", custom=function() AmaknaTempleOrReverse(362, 262, 350, 386) end },
            { map = "7,-66", changeMap="top" },
            { map = "7,-67", changeMap="right" },
            { map = "176555008", custom=function() global.delay(800) global:clickPosition(419, 335, false) end },
            { map = "177209344", custom=function() global.delay(800) global:clickPosition(526, 233, false) end },
            { map = "177210368", custom=function() global.delay(800) global:clickPosition(125, 190, false) end },
            { map = "177210626", custom=function() global.delay(400) clickPNJ(14,303,181) end },
		}
	end,
	["Roublard"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "right" },
            { map = "-1,0", changeMap = "right" },
            { map = "0,0", changeMap = "bottom" },
            { map = "0,1", changeMap = "right" },
            { map = "1,1", changeMap = "right" },
            { map = "2,1", changeMap = "bottom" },
            { map = "2,2", changeMap = "bottom" },
            { map = "2,3", changeMap = "right" },
            { map = "177210626", custom=function() global.delay(800) global:clickPosition(414, 420, false) end },
            { map = "177210368", custom=function() global.delay(800) global:clickPosition(76, 376, false) end },
            { map = "177209344", custom=function() global.delay(800) global:clickPosition(35, 439, false) end },
            { map = "176555008", changeMap="bottom" },
            { map = "8,-66", changeMap="left" },
            { map = "7,-66", custom=function() AmaknaTempleOrReverse(204, 136, 257, 386) end },
            { map = "12,3", changeMap="left" },
            { map = "11,3", changeMap="left" },
            { map = "10,3", changeMap="left" },
            { map = "9,3", changeMap="left" },
            { map = "8,3", changeMap="left" },
            { map = "7,3", changeMap="left" },
            { map = "6,3", changeMap="left" },
            { map = "5,3", changeMap="left" },
            { map = "4,3", changeMap="left" },
            { map = "88081684", custom=function() global.delay(800) global:clickPosition(448, 142, false) end },
            { map = "67373056", custom=function() AmaknaTempleOrReverse(472, 261, 290, 384) end },
            { map = "67112960", custom=function() global.delay(800) global:clickPosition(290, 106, false) end },
            { map = "67111936", custom=function() global.delay(800) global:clickPosition(98, 265, true) end },
            { map = "67110912", custom=function() global.delay(800) global:clickPosition(177, 245, true) end },
            { map = "67108864", custom=function() global.delay(800) global:clickPosition(97, 227, true) end },
            { map = "67109888", custom=function() clickPNJ(15,470,207) end },
		}
	end,
	["Iop"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "right" },
            { map = "-1,0", changeMap = "right" },
            { map = "0,0", changeMap = "bottom" },
            { map = "0,1", changeMap = "bottom" },
            { map = "0,2", changeMap = "right" },
            { map = "1,2", changeMap = "bottom" },
            { map = "67109888", custom=function() global.delay(800) global:clickPosition(266, 424, true) end },
            { map = "67108864", custom=function() global.delay(800) global:clickPosition(516, 291, true) end },
            { map = "67110912", custom=function() global.delay(800) global:clickPosition(269, 406, true) end },
            { map = "67111936", custom=function() global.delay(800) global:clickPosition(367, 294, true) end },
            { map = "67112960", custom=function() AmaknaTempleOrReverse(201, 151, 251, 397) end },
            { map = "67373056", custom=function() global.delay(800) global:clickPosition(173, 123, false) end },
            { map = "67373056", custom=function() global.delay(800) global:clickPosition(173, 123, false) end },
            { map = "88081684", changeMap="left" },
            { map = "2,3", changeMap="left" },
            { map = "88080660", custom=function() global.delay(800) global:clickPosition(361, 230, false) end },
            { map = "183762952", custom=function() global.delay(800) global:clickPosition(537, 306, false) end },
            { map = "183762956", custom=function() clickPNJ(16,384,300) end },
		}
	end,
	["Cra"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88213271)" }, -- Zaap Amakna
            { map = "9,7", changeMap = "right" },
            { map = "-2,0", changeMap = "right" },
            { map = "-1,0", changeMap = "right" },
            { map = "0,0", changeMap = "bottom" },
            { map = "0,1", changeMap = "bottom" },
            { map = "0,2", changeMap = "bottom" },
            { map = "183762956", custom=function() global.delay(800) global:clickPosition(104, 203, false) end },
            { map = "183762952", custom=function() global.delay(800) global:clickPosition(44, 437, false) end },
            { map = "88080660", changeMap="left" },
            { map = "88212244", custom=function() global.delay(800) global:clickPosition(403, 285, false) end },
            { map = "183765004", custom=function() global.delay(800) global:clickPosition(408, 109, true) end },
            { map = "183765002", custom=function() clickPNJ(17,382,297) end },
		}
	end,
	["Sadida"] = function()
		return {
		    { map = "0,0", changeMap = "zaap(121,217,88082704)" }, -- Zaap Coin bouf
		    { map = "5,7", changeMap = "bottom" },
            { map = "5,8", changeMap = "bottom" },
            { map = "5,9", changeMap = "left" },
            { map = "4,9", changeMap = "left" },
            { map = "3,9", changeMap = "left" },
            { map = "2,9", changeMap = "left" },
            { map = "1,9", changeMap = "left" },
            { map = "0,9", changeMap = "left" },
            { map = "183765002", changeMap="left" },
            { map = "183765004", custom=function() global.delay(800) global:clickPosition(136, 411, true) end },
            { map = "88212244", changeMap="bottom" },
            { map = "0,4", changeMap="bottom" },
            { map = "0,5", changeMap="bottom" },
            { map = "0,6", changeMap="bottom" },
            { map = "0,7", changeMap="bottom" },
            { map = "0,8", changeMap="bottom" },
            { map = "0,9", changeMap="left" },
            { map = "88212750", custom=function() global.delay(800) global:clickPosition(307, 240, false) end },
            { map = "183768078", custom=function() global.delay(800) global:clickPosition(221, 201, false) end },
            { map = "183768076", custom=function() clickPNJ(18,292,254) end },
		}
	end,

}

function AmaknaTempleOrReverse(x, y, x1, y2)
        global:clickPosition(x, y, false)
        global:delay(2000)
        global:clickPosition(x1, y2, false)
end

function clickPNJ(i,x,y)

    if (character.lifePoints() <= (character.maxLifePoints() * 0.95)) then
        global:printMessage('[INFO] Le bot se regenere')
        if(inventory:isEquiped(NOURRITURE)) then
            eat()
        elseif(not(inventory:isEquiped(NOURRITURE))) then
            global:printMessage('[INFO] Si vous voulez utiliser de la nourriture, configurer le dans le script')
        end
    elseif(character.lifePoints() >= (character.maxLifePoints() * 0.9)) then
        if(DOPEUL == i) then
            global:clickPosition(x, y, false)
            global:delay(2000)
            clickTrainDopeul()
        end
    end
    return move()
end

function clickTrainDopeul()
        global:clickPosition(275, 372, false)
        global:delay(2000)
        global:clickPosition(319, 399, false)
        DOPEUL = DOPEUL + 1
        global:delay(3000)

        return move()
end

function eat()
    if(inventory:isEquiped(NOURRITURE)) then
        while(character.lifePoints() ~= character.maxLifePoints()) do
            inventory:useItem(NOURRITURE)
        end
    end
end


function bank()
end


function phenix()
    return {
        global.printMessage("[ERREUR] Le personnage est devenu un fantome car il n'a plus d'energie.")
    }
end

function lost()
	global.printMessage("[AVERTISSEMENT] Personnage perdu sur la carte [" .. map.currentPos() .. "].")
    global:delay(2500)
    global:sendKey(72)
	global:printMessage("[SECURITE] Le personnage entre dans l'havre sac, test de prendre zaap")

	return {
	    {map = map:currentMapId(), custom=move},
	}
end
