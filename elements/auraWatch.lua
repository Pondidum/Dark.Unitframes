local addon, ns = ...
local config = ns.config
local core = Dark.core

local AURA_HEIGHT = 15

ns.elements.aurawatch = {
	
	create = function(self)

		local auras = CreateFrame("Frame", nil, self)

		auras.presentAlpha = 1
		auras.missingAlpha = 0
		auras.onlyShowPresent = true
		auras.customIcons = true
		auras.icons = {}

		for i, spellID in ipairs(config.auraWatch) do 
			
			local icon = CreateFrame("Frame", nil, auras)
			icon.spellID = spellID
			icon.anyUnit = true
			icon:SetWidth(AURA_HEIGHT)
			icon:SetHeight(AURA_HEIGHT)
			icon:SetPoint("CENTER", auras, "CENTER", 0, 0)
			icon.count = nil

			local tex = icon:CreateTexture(nil, "OVERLAY")
			tex:SetAllPoints(icon)
			tex:SetTexCoord(.08, .92, .08, .92)
			tex:SetTexture(GetSpellTexture(spellID)) --core.textures.normal)

			auras.icons[spellID] = icon

		end

		self.AuraWatch = auras

	end,

	layout = function(self)

		local auras = self.AuraWatch

		auras:SetPoint("CENTER", self, "CENTER", 0, 0)
		auras:SetSize(AURA_HEIGHT, AURA_HEIGHT)

	end,

	filter = function(self, unit)
		return unit == "raid" or unit == "party"
	end,

}