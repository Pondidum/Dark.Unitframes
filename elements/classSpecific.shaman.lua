local addon, ns = ...

local textures = ns.lib.media.textures
local style = ns.lib.style

local TOTEM_HEIGHT = 25

ns.elements.specific.shaman = {

	create = function(self, unit)

		local spacing = ns.config.spacing
		local totems = CreateFrame("Frame", nil, self)

		local middle = MAX_TOTEMS / 2

		for index = 1, MAX_TOTEMS do

			local totem = CreateFrame('Frame', nil, totems)
			totem:SetSize(TOTEM_HEIGHT, TOTEM_HEIGHT)
			totem:SetPoint('BOTTOM', totems, 'BOTTOM', ((index - middle) * (totem:GetWidth() + spacing)) - ((totem:GetWidth() + spacing) / 2) , 0)
			style:frame(totem)

			local icon = totem:CreateTexture(nil, "OVERLAY")
			icon:SetTexCoord(.08, .92, .08, .92)
			icon:SetAllPoints()

			local cd = CreateFrame("Cooldown", nil, totem, "CooldownFrameTemplate")
			cd:SetAllPoints()
			cd:SetReverse(true)

			totem.Icon = icon
			totem.Cooldown = cd

			totems[index] = totem
		end

		self.Totems = totems
		self.classSpecific = totems

	end,

	layout = function(self)

		self.Totems:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.Totems:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
		self.Totems:SetHeight(TOTEM_HEIGHT)

	end,
}
