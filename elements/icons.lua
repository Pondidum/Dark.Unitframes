local addon, ns = ...

local textures = ns.lib.media.textures

ns.elements.raidIcon = {

	create = function(self)

		self.RaidIcon = self:CreateTexture(nil, "OVERLAY")
		self.Leader = self:CreateTexture(nil, "OVERLAY")
		self.MasterLooter = self:CreateTexture(nil, "OVERLAY")
		self.Combat = self:CreateTexture(nil, "OVERLAY")

		self.RaidIcon:SetTexture(textures.raidmarks) -- thx hankthetank for texture
		self.Combat:SetVertexColor(0.69, 0.31, 0.31)

	end,

	layout = function(self)

		self.RaidIcon:SetParent(self.Health)
		self.RaidIcon:SetHeight(20)
		self.RaidIcon:SetWidth(20)
		self.RaidIcon:SetPoint("TOP", 0, 11)

		self.Leader:SetParent(self.Health)
		self.Leader:SetHeight(14)
		self.Leader:SetWidth(14)
		self.Leader:SetPoint("CENTER", self.Health, "CENTER", -15, 1)

		self.MasterLooter:SetParent(self.Health)
		self.MasterLooter:SetHeight(14)
		self.MasterLooter:SetWidth(14)
		self.MasterLooter:SetPoint("CENTER", self.Health, "CENTER", 15, 1)

		self.Combat:SetParent(self.Health)
		self.Combat:SetHeight(19)
		self.Combat:SetWidth(19)
		self.Combat:SetPoint("LEFT", self.Name, "Right", 0, 1)

	end,

}
