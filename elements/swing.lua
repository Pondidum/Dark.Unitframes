local addon, ns = ...
local core = Dark.core
local style = core.style

ns.elements.swing = {
	
	create = function(self, unit)

		local _, class = UnitClass(unit)
		local color = self.colors.class[class]

		local swing = CreateFrame("Frame", nil, self)
		style.addShadow(swing)
		style.addBackground(swing)

		local twoHand = CreateFrame("StatusBar", nil, swing)
		twoHand:SetAllPoints(swing)
		twoHand:SetStatusBarTexture(core.textures.normal)
		twoHand:SetStatusBarColor(unpack(color))
		twoHand:Hide()

		local mainHand = CreateFrame("StatusBar", nil, swing)
		mainHand:SetAllPoints(swing)
		mainHand:SetStatusBarTexture(core.textures.normal)
		mainHand:SetStatusBarColor(unpack(color))
		mainHand:Hide()
		
		local offHand = CreateFrame("StatusBar", nil, swing)
		offHand:SetAllPoints(swing)
		offHand:SetStatusBarTexture(core.textures.normal)
		offHand:SetStatusBarColor(unpack(color))
		offHand:Hide()

		swing.Twohand = twoHand
		swing.Mainhand = mainHand
		swing.Offhand = offHand

		swing.hideOoc = true
		swing:Hide()
		
	 	self.Swing = swing

	end,

	layout = function(self)

		self.Swing:SetPoint("TOPLEFT", self.Power, "BOTTOMLEFT", 0, -ns.config.spacing)
		self.Swing:SetPoint("TOPRIGHT", self.Power, "BOTTOMRIGHT", 0, -ns.config.spacing)
		self.Swing:SetHeight(5)

	end,

	filter = function(self, unit)
		return unit == "player"
	end,

}
