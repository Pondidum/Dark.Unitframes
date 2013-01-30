local addon, ns = ...
local core = Dark.core
local style = core.style

local TOTEM_HEIGHT = 8

ns.elements.specific.shaman = {
	
	create = function(self, unit)
		
		local totems = CreateFrame("Frame", nil, self)
		
		ns.builder.autoSegments("StatusBar", totems, MAX_TOTEMS, ns.config.spacing, function(segment)

			segment:SetStatusBarTexture(core.textures.normal)
			segment:GetStatusBarTexture():SetHorizTile(false)

			style.addShadow(segment)
			style.addBackground(segment)

			segment:SetHeight(TOTEM_HEIGHT)

		end)
		
		self.DarkTotems = totems
		self.classSpecific = totems
		
	end,

	layout = function(self)

		self.DarkTotems:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.DarkTotems:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
		self.DarkTotems:SetHeight(TOTEM_HEIGHT)

	end,
}
