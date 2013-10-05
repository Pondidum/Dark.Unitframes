local addon, ns = ...
local core = Dark.core
local style = core.style

ns.elements.swing = {
	
	create = function(self)

		local swing = CreateFrame("Frame", nil, self)
		swing.texture = [=[Interface\TargetingFrame\UI-StatusBar]=]
		swing.color = {1, 0, 0, 0.8}
		swing.textureBG = [=[Interface\TargetingFrame\UI-StatusBar]=]
		swing.colorBG = {0, 0, 0, 0.8}
	 
	 	self.Swing = swing

	end,

	layout = function(self)

		self.Swing:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -ns.config.spacing)
		self.Swing:SetPoint("TOPRIGHT", self.Power, "BOTTOMRIGHT", 0, -ns.config.spacing)
		self.Swing:SetHeight(5)

	end,

}
