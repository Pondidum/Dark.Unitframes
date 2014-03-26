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
	colors = Dark.core.colors,
	auraWatch = {
		120629, --huddle in terror
		136513,
	}

}

ns.config = config
