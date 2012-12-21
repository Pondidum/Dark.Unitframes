local addon, ns = ..

local health = function(self)

	local health = CreateFrame('StatusBar', nil, self)
	health:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0)
	health:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0)

	health:SetStatusBarTexture(ns.core.textures.normal)
	ns.core.style.addShadow(health)

	health.frequentUpdates = true
	health.colorDisconnected = true
	health.colorTapping = true	
	health.colorClass = true
	health.colorReaction = true


	local background = health:CreateTexture(nil, 'BORDER')
	background:SetAllPoints(health)
	background:SetTexture(ns.core.textures.normal)
	background.multiplier = 0.3

	health.bg = background

	local text = ns.core.ui.createFont(health, S.fonts.unitframe, 12)
	text:SetPoint("RIGHT", health, "RIGHT", -4, 0)
	text.frequentUpdates = true

	self:Tag(text, '[' .. ns.name .. ':health]')

	self.Health = health
	self.HealthValue = text

end

ns.elements.health = health