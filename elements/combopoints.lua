local addon, ns = ...

local style = ns.lib.style

local POINT_HEIGHT = 8
local NUM_COMBO_POINTS = 5

ns.elements.combopoints = {

	create = function(self, unit)

		local points = CreateFrame("Frame", nil, self)

		points.unit = PlayerFrame.unit

		ns.builder.autoSegments("Frame", points, NUM_COMBO_POINTS, ns.config.spacing, function(segment)

			style:frame(segment)

			segment.bg:SetBackdropColor(0.65, 0.63, 0.35, 0.6)
			segment:SetHeight(POINT_HEIGHT)

		end)

		self.CPoints = points

	end,

	layout = function(self, unit)

		if unit ~= "player" then
			return
		end

		local anchor = self.classSpecific or self.Health

		self.CPoints:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, ns.config.spacing)
		self.CPoints:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, ns.config.spacing)
		self.CPoints:SetHeight(POINT_HEIGHT)

	end,

	filter = function(self, unit)
		return unit == "player"
	end,

}
