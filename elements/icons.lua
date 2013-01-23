local addon, ns = ...
local core = Dark.core

local raidIcon = function(self)

	local raidIcon = self.Health:CreateTexture(nil, "OVERLAY")
	raidIcon:SetTexture(core.textures.raidmarks) -- thx hankthetank for texture
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


	local combat = self.Health:CreateTexture(nil, "OVERLAY")
	combat:SetHeight(19)
	combat:SetWidth(19)
	combat:SetPoint("LEFT", self.Name, "Right", 0, 1)
	combat:SetVertexColor(0.69, 0.31, 0.31)
	
	self.Combat = combat

end

ns.elements.raidIcon = raidIcon
