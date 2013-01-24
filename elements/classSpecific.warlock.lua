local addon, ns = ...
local core = Dark.core
local style = core.style

ns.elements.specific.warlock = {
	
	create = function(self)

		local frame = CreateFrame("Frame", nil, self)
		
		style.addBackground(frame)
		style.addShadow(frame)

		for i = 1, 4 do

			frame[i] = CreateFrame("StatusBar", nil, frame)
			frame[i]:SetHeight(8)
			frame[i]:SetStatusBarTexture(core.textures.normal)
			
			if i == 1 then
				frame[i]:SetWidth((250 / 4) - 2)
				frame[i]:SetPoint("LEFT", frame, "LEFT", 0, 0)
			else
				frame[i]:SetWidth((250 / 4) - 1)
				frame[i]:SetPoint("LEFT", frame[i-1], "RIGHT", ns.config.spacing, 0)
			end
		end
		
		self.WarlockSpecBars = frame
		self.classSpecific = frame

	end,

	layout = function(self)
	
		self.WarlockSpecBars:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.WarlockSpecBars:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", 0, ns.config.spacing)
		self.WarlockSpecBars:SetHeight(8)

	end,

}
