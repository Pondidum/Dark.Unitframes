local addon, ns = ...

local style = ns.lib.style
local textures = ns.lib.media.textures

ns.elements.power = {

	create = function(self)

		local power = CreateFrame('StatusBar', nil, self)

		power.frequentUpdates = true
		power.Smooth = true

		power.colorDisconnected = true
		power.colorTapping = true
		power.colorPower = true

		power:SetStatusBarTexture(textures.normal)

		style:frame(power)

		local bg = power:CreateTexture(nil, 'BORDER')
		bg:SetAllPoints(power)
		bg:SetTexture(textures.normal)
		bg.multiplier = 0.3

		power.bg = bg

		self.Power = power

	end,

	layout = function(self)

		self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -ns.config.spacing)
		self.Power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -ns.config.spacing)
		self.Power:SetHeight(5)

	end,

}
