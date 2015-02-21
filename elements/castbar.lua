local addon, ns = ...

local fonts = ns.lib.media.fonts
local textures = ns.lib.media.textures
local style = ns.lib.style

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

ns.elements.castbar = {

	create = function(self)

		local castbar = CreateFrame("StatusBar", nil, self)

		castbar:SetStatusBarTexture(textures.normal)
		style:frame(castbar)

		castbar.Text = fonts:create(castbar, fonts.unitframes, 12)
		castbar.Text:SetPoint("LEFT", castbar, "LEFT", 4, 0)
		castbar.Text:SetTextColor(1, 1, 1)

		castbar.Time = fonts:create(castbar, fonts.unitframes, 12)
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

		style:border(castbar.button)

		castbar.CustomTimeText = customCastTimeText
		castbar.PostCastStart = checkInterrupt
		castbar.PostChannelStart = checkInterrupt

		self.Castbar = castbar

	end,

	layout = function(self)

		local anchor = self.Buffs or self.ClassSpecific or self.Health
		local castbar = self.Castbar

		castbar:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, ns.config.spacing)
		castbar:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, ns.config.spacing)
		castbar:SetHeight(16)

	end,

}