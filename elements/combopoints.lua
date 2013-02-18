local addon, ns = ...
local core = Dark.core
local style = core.style

local POINT_HEIGHT = 8
local NUM_COMBO_POINTS = 5

ns.elements.combopoints = {
	
	create = function(self, unit)

		local points = CreateFrame("Frame", nil, self)

		points.unit = PlayerFrame.unit
		
		ns.builder.autoSegments("Frame", points, NUM_COMBO_POINTS, ns.config.spacing, function(segment)

			style.addBackground(segment)
			style.addShadow(segment)

			segment.bg:SetBackdropColor(0.65, 0.63, 0.35, 0.6)
			segment:SetHeight(POINT_HEIGHT)
			
		end)

		self.CPoints = points

	end,

	layout = function(self, unit)

		if unit ~= "player" then
			return
		end
		
		self.CPoints:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.CPoints:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
		self.CPoints:SetHeight(POINT_HEIGHT)

	end,

	filter = function(self, unit)
		return unit == "player"
	end,
	
}
