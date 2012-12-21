local addon, ns = ...

local power = function(self)

	local powerBar = CreateFrame('StatusBar', nil, self)
	powerBar:SetPoint("TOPLEFT", health, "BOTTOMLEFT", 0, -5)
	powerBar:SetPoint("TOPRIGHT", health, "BOTTOMRIGHT", 0, -5)
	powerBar:SetHeight(5)

	powerBar:SetStatusBarTexture(ns.core.textures.normal)
	ns.core.style.addShadow(powerBar)

	local background = powerBar:CreateTexture(nil, 'BORDER')
	background:SetAllPoints(powerBar)
	background:SetTexture(ns.core.textures.normal)
	background.multiplier = 0.3

	powerBar.bg = background 

	powerBar.frequentUpdates = true
	powerBar.Smooth = true

	powerBar.colorDisconnected = true	
	powerBar.colorTapping = true
	powerBar.colorPowerBar = true

	self.Power = power

end

ns.elements.power = power