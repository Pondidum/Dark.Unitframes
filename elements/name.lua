local addon, ns = ...
local core = Dark.core

ns.elements.name = {
	
	create = function(self)

		local name =  core.ui.createFont(self, core.fonts.unitframes, 12, "OUTLINE")
		name:SetTextColor(1, 1, 1)
		name:SetJustifyH("LEFT")	

		self.Name = name
		self:Tag(name, '[name]')

	end,

	layout = function(self)

		self.Name:SetParent(self.Health)
		self.Name:SetPoint("LEFT", self.Health, "LEFT", 4, 0)
		self.Name:SetPoint("TOP", self.Health, "TOP", 4, 0)
		self.Name:SetPoint("BOTTOM", self.Health, "BOTTOM", 4, 0)

	end,

}
