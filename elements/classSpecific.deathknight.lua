local addon, ns = ...
local core = Dark.core
local style = core.style

local RUNE_HEIGHT = 8

local deathknightSpecific = function(self, unit)

	local runes = CreateFrame("Frame", nil, self)

	runes:SetPoint("BOTTOMLEFT", anchor, "BOTTOMLEFT", 0, 0)
	runes:SetPoint("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", 0, 0)
	runes:SetHeight( (3 * RUNE_HEIGHT) + (2 * ns.config.spacing) )

	for i = 1, 6 do

		local rune = CreateFrame("StatusBar", nil, runes)

		rune:SetStatusBarTexture(core.textures.normal)
		rune:GetStatusBarTexture():SetHorizTile(false)

		style.addBackground(rune)
		style.addShadow(rune)

		rune:SetHeight(RUNE_HEIGHT)

		if i % 2 = 0 then
			rune:SetPoint("LEFT")
			rune:SetPoint("RIGHT", runes, "CENTER")
		else
			rune:SetPoint("RIGHT")
			rune:SetPoint("LEFT", runes, "CENTER")
		end

		local j = i - 1
		local yOffset = (j - (j % 2)) / 2

		rune:SetPoint("BOTTOM", runes, "BOTTOM", 0, (yOffset * RUNE_HEIGHT) + ((yOffset - 1) * ns.config.spacing))


		runes[i] = rune

	end

	-- runes[1]:SetPoint("BOTTOM", runes, "BOTTOM", 0, 0)
	-- runes[3]:SetPoint("BOTTOM", runes[1], "TOP", 0, ns.config.spacing)
	-- runes[5]:SetPoint("BOTTOM", runes[3], "TOP", 0, ns.config.spacing)

	self.DarkRunes = runes

end

ns.elements.specific.deathknight = deathknightSpecific
