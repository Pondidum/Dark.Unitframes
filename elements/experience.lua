local addon, ns = ...
local core = Dark.core

local createExperience = function(self, unit)

	local experience = CreateFrame("StatusBar", nil, self)
	experience:SetPoint("BOTTOMLEFT", DarkuiBar4, "TOPLEFT",0, 5)
	experience:SetPoint("BOTTOMRIGHT", DarkuiBar4, "TOPRIGHT",0, 5)
	experience:SetHeight(5)

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
	--D.CreateBackground(experience.Rested)

	local resting = experience:CreateTexture(nil, "OVERLAY")
	resting:SetPoint("CENTER", self.Health, "TOPLEFT", -2, 5) 
	resting:SetSize(28, 28)

	resting:SetTexture([=[Interface\CharacterFrame\UI-StateIcon]=])
	resting:SetTexCoord(0, 0.5, 0, 0.421875)

	self.Resting = resting
	self.Experience = experience

end

ns.elements.experience = createExperience