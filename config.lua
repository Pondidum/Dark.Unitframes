local addon, ns = ...

local spacing = 3
local largeFrame = {237, 28}
local smallFrame = {132, 28}

local config = {
	spacing = spacing,
	units = {"player", "pet", "target", "focus", "targettarget", "focustarget", "boss", "raid"},
	layout = {
		player 			= { point = { "RIGHT", UIParent, "CENTER", -150, -150 }, 		size = largeFrame 	},
		target 			= { point = { "LEFT", UIParent, "CENTER", 150, -150 }, 			size = largeFrame 	},
		focus 			= { point = { "LEFT", UIParent, "CENTER", 150, 150 }, 			size = largeFrame 	},
		pet 			= { point = { "RIGHT", "player", "LEFT", -45, 0 }, 				size = smallFrame 	},
		targettarget 	= { point = { "LEFT", "target", "RIGHT", 45, 0 }, 				size = smallFrame 	},
		focustarget 	= { point = { "LEFT", "focus", "RIGHT", 45, 0 }, 				size = smallFrame 	},
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
		boss   = { "range", remove = { "debuffs", "buffs" } },
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
