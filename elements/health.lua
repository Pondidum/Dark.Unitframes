local addon, ns = ...
local core = Dark.core

ns.elements.health = {

	create = function(self)

		local health = CreateFrame('StatusBar', nil, self)
		
		health:SetStatusBarTexture(core.textures.normal)
		core.style.addShadow(health)

		health.frequentUpdates = true
		health.colorDisconnected = true
		health.colorTapping = true	
		health.colorClass = true
		health.colorReaction = true


		local background = health:CreateTexture(nil, 'BORDER')
		background:SetAllPoints(health)
		background:SetTexture(core.textures.normal)
		background.multiplier = 0.3

		health.bg = background

		local text = core.ui.createFont(health, core.fonts.unitframes, 12)
		text.frequentUpdates = true

		self:Tag(text, '[' .. ns.name .. ':health]')

		self.Health = health
		self.HealthValue = text

	end,

	layout = function(self)
		self.Health:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0)
		self.Health:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0)
		
		self.HealthValue:SetPoint("RIGHT", self.Health, "RIGHT", -4, 0)
	end,

}
