local addon, ns = ...
local core = Dark.core
local style = core.style

local BAR_HEIGHT = 8

local composition = {
	
	create = function(self, unit)

		local bars = CreateFrame("Frame", nil, self)

		
		ns.builder.segments("Frame", bars, 5, function(segment)

			style.addShadow(segment)
			style.addBackground(segment)

			segment:SetHeight(8)

		end)

		--i cant think of a better way of doing this without hardcoding widths, or creating surplus frames
		bars.PostUpdate = function(elements, current, max, changed) 

			local w = elements:GetWidth()
			local totemWidth = (w - (ns.config.spacing * (max - 1) )) / max

			bars[1]:SetPoint("BOTTOMLEFT", bars, "BOTTOMLEFT", 0, 0)
			bars[1]:SetWidth(totemWidth)

			for i = 2, max do 

				bars[i]:SetPoint("LEFT", bars[i - 1], "RIGHT", ns.config.spacing, 0)
				bars[i]:SetWidth(totemWidth)

			end

		end

		bars.UpdateTexture = function(element, forceCP)

			local red, green, blue
			local colors = self.colors
			local class, classFile = UnitClass(unit)

			if not forceCP and colors ~= nil then		
				red, green, blue = unpack(colors.class[classFile])
			else
				red, green, blue = 1, 0.96, 0.41
			end

			for i = 1, 5  do
				element[i].bg:SetBackdropColor(red, green, blue)
			end

		end

		self.ClassIcons = bars
		self.classSpecific = bars

	end,

	layout = function(self)

		self.ClassIcons:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.ClassIcons:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
		self.ClassIcons:SetHeight(BAR_HEIGHT)

	end,

}

ns.elements.specific.monk = composition
ns.elements.specific.paladin = composition
ns.elements.specific.priest = composition