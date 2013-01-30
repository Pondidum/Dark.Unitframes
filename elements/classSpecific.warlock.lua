local addon, ns = ...
local core = Dark.core
local style = core.style

ns.elements.specific.warlock = {
	
	create = function(self)

		local frame = CreateFrame("Frame", nil, self)
		
		style.addBackground(frame)
		style.addShadow(frame)

		ns.builder.segments("StatusBar", frame, 4, function(segment, i)
			
			segment:SetStatusBarTexture(core.textures.normal)
			segment:GetStatusBarTexture():SetHorizTile(false)
			segment:SetHeight(8)

			if i == 1 then
				segment:SetWidth((250 / 4) - 2)
				segment:SetPoint("LEFT", frame, "LEFT", 0, 0)
			else
				segment:SetWidth((250 / 4) - 1)
				segment:SetPoint("LEFT", frame[i-1], "RIGHT", ns.config.spacing, 0)
			end

		end)

		self.WarlockSpecBars = frame
		self.classSpecific = frame

	end,

	layout = function(self)
	
		self.WarlockSpecBars:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.WarlockSpecBars:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", 0, ns.config.spacing)
		self.WarlockSpecBars:SetHeight(8)

	end,

}
