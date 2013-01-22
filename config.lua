local addon, ns = ...

local spacing = 3
local largeFrame = {237, 28}
local smallFrame = {132, 28}

local config = {
	spacing = spacing,
	units = {"player", "pet", "target", "focus", "targettarget", "focustarget", "boss", "raid"},
	layout = {
		player 			= { point = { "CENTER", UIParent, "CENTER", 0, -200 }, 			size = largeFrame 	},
		target 			= { point = { "LEFT", UIParent, "CENTER", 200, -75 }, 			size = largeFrame 	},
		focus 			= { point = { "RIGHT", UIParent, "CENTER", -200, -75 }, 		size = largeFrame 	},
		pet 			= { point = { "RIGHT", "player", "LEFT", -45, 0 }, 				size = smallFrame 	},
		targettarget 	= { point = { "LEFT", "target", "RIGHT", 45, 0 }, 				size = smallFrame 	},
		focustarget 	= { point = { "RIGHT", "focus", "LEFT", -45, 0 }, 				size = smallFrame 	},
		bossunit		= { point = { "TOPLEFT", "", "BOTTOMLEFT", 0, -spacing*2 },		size = smallFrame 	},
		bossheader		= {	point = { "LEFT", UIParent, "LEFT", spacing, 0 }, 								},
		raidunit 		= { point = { "TOP", 0, -spacing }, 							size = {132, 18} 	},
		raidgroup 		= { point = { "TOP", "", "BOTTOM", 0, -spacing},									},
		raidheader 		= { point = { "TOPRIGHT", MultiBarRightButton1, "TOPLEFT", -spacing, 0 },	 				},
	},
	elements = {
		common = { "menu", "health", "power", "name", "castbar", "raidIcon", "classSpecific", "combopoints", "debuffs", },  
		player = { "experience" },
		target = { "buffs" },
		focus  = { "buffs" },
		pet    = { "buffs", remove = { "debuffs" } },
		raid   = { "range", remove = { "debuffs", "power", "castbar" } },
		boss   = { remove = { "debuffs", "buffs" } },
	}, 
	colors = {
		power = {
			["MANA"] = {0.31, 0.45, 0.63},
			["RAGE"] = {0.69, 0.31, 0.31},
			["FOCUS"] = {0.71, 0.43, 0.27},
			["ENERGY"] = {0.65, 0.63, 0.35},
			["RUNES"] = {0.55, 0.57, 0.61},
			["RUNIC_POWER"] = {0, 0.82, 1},
			["AMMOSLOT"] = {0.8, 0.6, 0},
			["FUEL"] = {0, 0.55, 0.5},
			["POWER_TYPE_STEAM"] = {0.55, 0.57, 0.61},
			["POWER_TYPE_PYRITE"] = {0.60, 0.09, 0.17},
		},
		class = {
			DEATHKNIGHT = { 196/255,  30/255,  60/255 },
			DRUID       = { 255/255, 125/255,  10/255 },
			HUNTER      = { 171/255, 214/255, 116/255 },
			MAGE        = { 104/255, 205/255, 255/255 },
			PALADIN     = { 245/255, 140/255, 186/255 },
			PRIEST      = { 212/255, 212/255, 212/255 },
			ROGUE       = { 255/255, 243/255,  82/255 },
			SHAMAN      = {  41/255,  79/255, 155/255 },
			WARLOCK     = { 148/255, 130/255, 201/255 },
			WARRIOR     = { 199/255, 156/255, 110/255 },
		},
	},

}

ns.config = config
