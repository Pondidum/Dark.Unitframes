local addon, ns = ...
local style = ns.core.style
local ui = ns.core.ui

local customCastTimeText = function(self, duration)
	self.Time:SetText(("%.1f / %.1f"):format(self.channeling and duration or self.max - duration, self.max))
end

local checkInterrupt = function(self, unit)

	if unit == "vehicle" then 
		unit = "player" 
	end

	if self.interrupt and UnitCanAttack("player", unit) then
		self:SetStatusBarColor(1, 1, 1, 1)	
	else
		self:SetStatusBarColor(0.31, 0.45, 0.63, 1)		
	end

end

local createCastbar = function(self)

	local castbar = CreateFrame("StatusBar", nil, self)
	castbar:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, castOffset)
	castbar:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, castOffset)
	castbar:SetHeight(16)

	castbar:SetStatusBarTexture(ns.core.textures.normal)
	style.addShadow(castbar)
	style.addBackground(castbar)

	castbar.Text = ui.createFont(castbar, ns.core.fonts.unitframes, 12)
	castbar.Text:SetPoint("LEFT", castbar, "LEFT", 4, 0)
	castbar.Text:SetTextColor(1, 1, 1)

	castbar.Time = ui.createFont(castbar, ns.core.fonts.unitframes, 12)
	castbar.Time:SetPoint("RIGHT", castbar, "RIGHT", -4, 0)
	castbar.Time:SetTextColor(0.8, 0.8, 0.8)
	castbar.Time:SetJustifyH("RIGHT")
	
	castbar.button = CreateFrame("Frame", nil, castbar)
	castbar.button:SetHeight(20)
	castbar.button:SetWidth(20)
	castbar.button:SetPoint("RIGHT", castbar, "LEFT", -5, 0)

	castbar.Icon = castbar.button:CreateTexture(nil, "ARTWORK")
	castbar.Icon:SetPoint("TOPLEFT", castbar.button, 0, 0)
	castbar.Icon:SetPoint("BOTTOMRIGHT", castbar.button, 0, 0)
	castbar.Icon:SetTexCoord(0.08, 0.92, 0.08, .92)

	style.addShadow(castbar.button)

	castbar.CustomTimeText = customCastTimeText
	castbar.PostCastStart = checkInterrupt
	castbar.PostChannelStart = checkInterrupt

	self.Castbar = castbar

end

ns.elements.castbar = createCastbar