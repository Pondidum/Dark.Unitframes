local addon, ns = ...
local core = Dark.core
local style = core.style

local RUNE_HEIGHT = 8

local deathknightSpecific = function(self, unit)

	local anchor = self.Health
	local runes = CreateFrame("Frame", nil, self)

	runes:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, ns.config.spacing)
	runes:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, ns.config.spacing)
	runes:SetHeight( (3 * RUNE_HEIGHT) + (2 * ns.config.spacing) )

	for i = 1, 6 do

		local rune = CreateFrame("StatusBar", nil, runes)

		rune:SetStatusBarTexture(core.textures.normal)
		rune:GetStatusBarTexture():SetHorizTile(false)

		style.addBackground(rune)
		style.addShadow(rune)

		rune:SetHeight(RUNE_HEIGHT)

		if i % 2 == 0 then
			rune:SetPoint("RIGHT")
			rune:SetPoint("LEFT", runes, "CENTER", ns.config.spacing, 0)
		else
			rune:SetPoint("LEFT")
			rune:SetPoint("RIGHT", runes, "CENTER", -ns.config.spacing, 0)
		end

		local j = i - 1
		local yOffset = (j - (j % 2)) / 2
		local delta = (yOffset * RUNE_HEIGHT) + (yOffset * ns.config.spacing)

		rune:SetPoint("BOTTOM", runes, "BOTTOM", 0, delta)

		runes[i] = rune

	end

	self.DarkRunes = runes
	self.classSpecific = runes
	
end

ns.elements.specific.deathknight = deathknightSpecific
