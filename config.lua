local addon, ns = ...


local largeFrame = {239, 28}
local smallFrame = {132, 28}

local config = {

	units = {"player", "pet", "target", "focus", "targettarget", "focustarget", "boss", "raid"},
	layout = {
		player 			= { point = { "RIGHT", UIParent, "CENTER", -100, -50 }, 		size = largeFrame 	},
		target 			= { point = { "LEFT", UIParent, "CENTER", 100, -50 }, 			size = largeFrame 	},
		focus 			= { point = { "LEFT", UIParent, "CENTER", 100, -150 }, 			size = largeFrame 	},
		pet 			= { point = { "RIGHT", "player", "LEFT", -25, 0 }, 				size = smallFrame 	},
		targettarget 	= { point = { "LEFT", "target", "RIGHT", 25, 0 }, 				size = smallFrame 	},
		focustarget 	= { point = { "LEFT", "focus", "RIGHT", 25, 0 }, 				size = smallFrame 	},
		bossunit		= { point = { "TOPLEFT", "", "BOTTOMLEFT", 0, 5 }, 				size = smallFrame 	},
		bossheader		= {	point = { "LEFT", UIParent, "LEFT", 0, 0 }, 									},
		raidunit 		= { point = { "BOTTOMRIGHT", "", "TOPRIGHT", 0, 5 }, 			size = smallFrame 	},
		raidgroup 		= { point = { "RIGHT", -5, 0 },														},
		raidheader 		= { point = { "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0 },	 					},
	},
	elements = {
		common = { "menu", "health", "power", "name", "raidIcon" }, --, "castbar"},
		player = { "debuffs", "castbar", "classSpecific" }, --"combopoints" },
		target = { "debuffs", "buffs" },
		focus  = { "debuffs", "buffs" },
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
	},

}

ns.config = config
