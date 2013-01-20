local addon, ns = ...
local core = Dark.core
local style = core.style

local TOTEM_HEIGHT = 8

local shamanSpecific = function(self, unit)

	local totems = CreateFrame("Frame", nil, self)
	totems:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
	totems:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
	totems:SetHeight(TOTEM_HEIGHT)

	for i = 1, MAX_TOTEMS do

		local totem = CreateFrame("StatusBar", nil, totems)
		totem:SetHeight(TOTEM_HEIGHT)
		totem:SetStatusBarTexture(core.textures.normal)
		totem:GetStatusBarTexture():SetHorizTile(false)

		style.addShadow(totem)
		style.addBackground(totem)

		totem.bg = totem:CreateTexture(nil, 'BORDER')

		totems[i] = totem

	end

	--i cant think of a better way of doing this without hardcoding widths, or creating surplus frames
	totems:SetScript("OnSizeChanged", function(self, w, h) 

		local totemWidth = (w - (ns.config.spacing * 3)) / MAX_TOTEMS

		totems[1]:SetPoint("BOTTOMLEFT", totems, "BOTTOMLEFT", 0, 0)
		totems[1]:SetWidth(totemWidth)

		for i = 2, MAX_TOTEMS do 

			totems[i]:SetPoint("LEFT", totems[i - 1], "RIGHT", ns.config.spacing, 0)
			totems[i]:SetWidth(totemWidth)

		end

	end)
	
	self.DarkTotems = totems
	self.classSpecific = totems
end

ns.elements.specific.shaman = shamanSpecific
