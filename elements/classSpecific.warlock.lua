local addon, ns = ...
local core = Dark.core
local style = core.style

local warlockSpecific = function(self, unit)

	local frame = CreateFrame("Frame", nil, self)
	frame:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
	frame:SetPoint("BOTTOMRIGHT", self.Health, "BOTTOMRIGHT", 0, ns.config.spacing)
	frame:SetHeight(8)

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

end

ns.elements.specific.warlock = warlockSpecific