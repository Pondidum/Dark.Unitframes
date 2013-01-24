local addon, ns = ...
local core = Dark.core
local style = core.style

local POINT_HEIGHT = 8
local NUM_COMBO_POINTS = 5

ns.elements.combopoints = {
	
	create = function(self)

		local points = CreateFrame("Frame", nil, self)

		points.unit = PlayerFrame.unit

		for i = 1, NUM_COMBO_POINTS do

			local point = CreateFrame("Frame", nil, self)
			point:SetHeight(POINT_HEIGHT)

			style.addBackground(point)
			style.addShadow(point)
			point.bg:SetBackdropColor(0.65, 0.63, 0.35, 0.6)

			points[i] = point

		end

		--i cant think of a better way of doing this without hardcoding widths, or creating surplus frames
		points:SetScript("OnSizeChanged", function(self, w, h) 

			local totemWidth = (w - (ns.config.spacing * 3)) / NUM_COMBO_POINTS

			points[1]:SetPoint("BOTTOMLEFT", points, "BOTTOMLEFT", 0, 0)
			points[1]:SetWidth(totemWidth)

			for i = 2, NUM_COMBO_POINTS do 

				points[i]:SetPoint("LEFT", points[i - 1], "RIGHT", ns.config.spacing, 0)
				points[i]:SetWidth(totemWidth)

			end

		end)
		

		self.CPoints = points

	end,

	layout = function(self)

		self.CPoints:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.CPoints:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
		self.CPoints:SetHeight(POINT_HEIGHT)

	end,

}
