local addon, ns = ...

local raidIcon = function(self)

	local raidIcon = self.Health:CreateTexture(nil, "OVERLAY")
	raidIcon:SetTexture(ns.core.textures.raidicons) -- thx hankthetank for texture
	raidIcon:SetHeight(20)
	raidIcon:SetWidth(20)
	raidIcon:SetPoint("TOP", 0, 11)

	self.RaidIcon = raidIcon

end

ns.raidIcon = raidIcon