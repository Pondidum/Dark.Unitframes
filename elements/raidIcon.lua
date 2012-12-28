local addon, ns = ...
local core = Dark.core

local raidIcon = function(self)

	local raidIcon = self.Health:CreateTexture(nil, "OVERLAY")
	raidIcon:SetTexture(core.textures.raidicons) -- thx hankthetank for texture
	raidIcon:SetHeight(20)
	raidIcon:SetWidth(20)
	raidIcon:SetPoint("TOP", 0, 11)

	self.RaidIcon = raidIcon

end

ns.elements.raidIcon = raidIcon