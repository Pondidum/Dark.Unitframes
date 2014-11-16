local addon, ns = ...
local core = Dark.core

ns.elements.experience = {

	create = function(self, unit)

		local experience = CreateFrame("StatusBar", nil, self)
		experience:SetStatusBarTexture(core.textures.normal)
		experience:SetStatusBarColor(0, 0.4, 1, .8)

		experience:SetFrameLevel(10)
		experience:SetAlpha(0)

		experience:SetScript("OnEnter", function(x) x:SetAlpha(1) end)
		experience:SetScript("OnLeave", function(x) x:SetAlpha(0) end)

		self:SetScript("OnEnter", function(x) x.Experience:SetAlpha(1) end)
		self:SetScript("OnLeave", function(x) x.Experience:SetAlpha(0) end)

		experience.Tooltip = true

		experience.Rested = CreateFrame('StatusBar', nil, self)
		experience.Rested:SetParent(experience)
		experience.Rested:SetAllPoints(experience)
		experience.Rested:SetStatusBarTexture(core.textures.normal)

		core.style.addShadow(experience.Rested)

		local resting = experience:CreateTexture(nil, "OVERLAY")
		resting:SetTexture([=[Interface\CharacterFrame\UI-StateIcon]=])
		resting:SetTexCoord(0, 0.5, 0, 0.421875)

		self.Resting = resting
		self.Experience = experience

	end,

	layout = function(self, unit)

		self.Experience:SetPoint("TOPLEFT", MainMenuBar, "BOTTOMLEFT", 0, -5)
		self.Experience:SetPoint("TOPRIGHT", MainMenuBar, "BOTTOMRIGHT", 0, -5)
		self.Experience:SetHeight(5)

		self.Resting:SetPoint("CENTER", self.Health, "TOPLEFT", -2, 5)
		self.Resting:SetSize(28, 28)

	end,

	filter = function(self, unit)
		return unit == "player"
	end,
}
