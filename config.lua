local addon, ns = ...

local auraHeight = 27
local spacing = 3
local largeFrame = {237, 28}
local smallFrame = {147, 28}
local tinyFrame = {80, auraHeight - spacing}
local raidFrame = {132, 18}

local customDebuffs = function(self, unit, base)

	local debuffs = self.Debuffs
	debuffs:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -ns.config.spacing)
	debuffs:SetPoint("TOPRIGHT", self.Power, "BOTTOMRIGHT", 0, -ns.config.spacing)
	debuffs:SetHeight(auraHeight)

end

local customBuffs = function(self, unit, base)

	local anchor = self.classSpecific or self.Health
	local buffs = self.Buffs

	buffs:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, ns.config.spacing)
	buffs:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, ns.config.spacing)
	buffs:SetHeight(auraHeight)
end

local config = {
	spacing = spacing,

	units = {

		player = {
			size = largeFrame,
			location = { "RIGHT", UIParent, "CENTER", -100, -150 },
			hide = { "buffs", "range" },
			customise = {
				castbar = function(self, unit, base)
					self.Castbar:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, auraHeight + ns.config.spacing + ns.config.spacing)
					self.Castbar:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, auraHeight + ns.config.spacing + ns.config.spacing)
					self.Castbar:SetHeight(16)
				end,
				debuffs =  function(self, unit, base)
					customDebuffs(self, unit, base)
					self.Debuffs['growth-x'] = "LEFT"
					self.Debuffs.initialAnchor = "BOTTOMRIGHT"
				end,
			},
		},

		target = {
			size = largeFrame,
			location = { "LEFT", UIParent, "CENTER", 100, -150 },
			hide = { "classSpecific", "experience", "range"},
			customise = {
				debuffs = customDebuffs,
				buffs = customBuffs,
			},
		},

		focus = {
			size = largeFrame,
			location = { "LEFT", "target", "RIGHT", 45, 0 },
			hide = { "classSpecific", "experience", "range"},
			customise = {
				debuffs = customDebuffs,
				buffs = customBuffs,
			},
		},

		pet = {
			size = smallFrame,
			location = { "RIGHT", "player", "LEFT", -45, 0 },
			hide = { "classSpecific", "experience", "range"},
			customise = {
				debuffs = customDebuffs,
				buffs = function(self, unit, base)
					customBuffs(self, unit, base)
					self.Buffs.num = 5
				end,
			},
		},

		targettarget = {
			size = tinyFrame,
			location = { "BOTTOMRIGHT", "target", "TOPRIGHT", 0, spacing + 2 },
			hide = { "classSpecific", "experience", "range", "buffs", "debuffs", "castbar", "power"},
		},

		focustarget = {
			size = tinyFrame,
			location = { "BOTTOMRIGHT", "focus", "TOPRIGHT", 0, spacing + 2 },
			hide = { "classSpecific", "experience", "range", "buffs", "debuffs", "castbar", "power"},
		},

		raid = {
			unitSize = raidFrame,
			unitLocation = { "TOP", 0, -spacing },
			groupLocation = { "TOP" , "", "BOTTOM", 0, -spacing },
			headerLocation = { "TOPRIGHT", MultiBarRightButton1, "TOPLEFT", -spacing, 0 },

			hide = { "classSpecific", "power", "buffs", "debuffs", "castbar"},
		},

		boss = {
			unitSize = smallFrame,
			unitLocation = { "TOPLEFT", "", "BOTTOMLEFT", 0, -spacing*2 },
			headerLocation = { "LEFT", UIParent, "LEFT", spacing, 0 },
			hide = { "castbar", "buffs", "debuffs" }
		},

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
		totems = {
			[1] = { 0.752,	0.172,	0.02  },		-- fire
			[2] = { 0.441,  0.280,  0.1   }, 		-- earth
			[3] = { 0,		0.443,	0.631 },		-- water
			[4] = { 0.6,	1,		0.945 },		-- air
		}

	},
	auraWatch = {
		120629, --huddle in terror
		136513,
	}

}

ns.config = config
