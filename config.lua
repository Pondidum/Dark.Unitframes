local addon, ns = ...


local largeFrame = {240, 18}
local smallFrame = {132, 18}

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
		common = { "menu", "health", "power", "name", "raidIcon" },
		player = { "combopoints" },
	}
}

ns.config = config