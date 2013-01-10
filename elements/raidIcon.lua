local addon, ns = ...
local core = Dark.core

local raidIcon = function(self)

	local raidIcon = self.Health:CreateTexture(nil, "OVERLAY")
	raidIcon:SetTexture(core.textures.raidicons) -- thx hankthetank for texture
	raidIcon:SetHeight(20)
	raidIcon:SetWidth(20)
	raidIcon:SetPoint("TOP", 0, 11)

	self.RaidIcon = raidIcon

	
	local leader = self.Health:CreateTexture(nil, "OVERLAY")
	leader:SetHeight(14)
	leader:SetWidth(14)
	leader:SetPoint("CENTER", self.Health, "CENTER", -15, 1)

	self.Leader = leader


	local masterLooter = self.Health:CreateTexture(nil, "OVERLAY")
	masterLooter:SetHeight(14)
	masterLooter:SetWidth(14)
	masterLooter:SetPoint("CENTER", self.Health, "CENTER", 15, 1)

	self.MasterLooter = masterLooter

end

ns.elements.raidIcon = raidIcon
