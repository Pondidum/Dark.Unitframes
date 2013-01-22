local addon, ns = ...

local BAR_HEIGHT = 8
local MAX_BARS = 3

local generic = function(self, unit)

	local bars = CreateFrame("Frame", nil, self)
	bars:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
	bars:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
	bars:SetHeight(BAR_HEIGHT)

	for i = 1, 3 do

		local bar = CreateFrame("StatusBar", nil, frame)
		bar:SetHeight(8)
		bar:SetStatusBarTexture(core.textures.normal)
		bar:GetStatusBarTexture():SetHorizTile(false)
		
		style.addShadow(bar)
		style.addBackground(bar)

		bars[i] = bar

	end

	--i cant think of a better way of doing this without hardcoding widths, or creating surplus frames
	bars:SetScript("OnSizeChanged", function(self, w, h) 

		local totemWidth = (w - (ns.config.spacing * (MAX_BARS - 1) )) / MAX_BARS

		bars[1]:SetPoint("BOTTOMLEFT", bars, "BOTTOMLEFT", 0, 0)
		bars[1]:SetWidth(totemWidth)

		for i = 2, MAX_BARS do 

			bars[i]:SetPoint("LEFT", bars[i - 1], "RIGHT", ns.config.spacing, 0)
			bars[i]:SetWidth(totemWidth)

		end

	end)

	self.ClassIcons = bars
	self.classSpecific = bars

end

ns.elements.specific.monk = generic
ns.elements.specific.paladin = generic
ns.elements.specific.priest = generic