local addon, ns = ...

ns.elements.role = {
	
	create = function(self)

		self.LFDRole = self:CreateTexture(self:GetName() .. "Role", 'OVERLAY')
		
	end,

	layout = function(self)

		local role = self.LFDRole

		role:SetParent(self.Health)
		role:SetPoint("RIGHT", self.Health, "LEFT", -ns.config.spacing, 0)
		role:SetSize(18, 18)
		
	end,

	filter = function(self, unit)
		return unit == "raid"
	end,

}
