local addon, ns = ...
local core = Dark.core
local style = core.style

ns.elements.power = {
	
	create = function(self)

		local power = CreateFrame('StatusBar', nil, self)

		power.frequentUpdates = true
		power.Smooth = true
		
		power.colorDisconnected = true	
		power.colorTapping = true
		power.colorPower = true
		
		power:SetStatusBarTexture(core.textures.normal)

		style.addShadow(power)
		style.addBackground(power)

		bg.multiplier = 0.3
		
		self.Power = power

	end,

	layout = function(self)

		self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -ns.config.spacing)
		self.Power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -ns.config.spacing)
		self.Power:SetHeight(5)

	end,

}
