local addon, ns = ...
local core = Dark.core

local createPower = function(self)

	local power = CreateFrame('StatusBar', nil, self)
	power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -5)
	power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -5)
	power:SetHeight(5)
	
	power:SetStatusBarTexture(core.textures.normal)
	core.style.addShadow(power)
	
	local bg = power:CreateTexture(nil, 'BORDER')
	bg:SetAllPoints(power)
	bg:SetTexture(core.textures.normal)
	bg.multiplier = 0.3
	
	power.bg = bg 
	
	power.frequentUpdates = true
	power.Smooth = true
	
	power.colorDisconnected = true	
	power.colorTapping = true
	power.colorPower = true

	self.Power = power

end

ns.elements.power = createPower