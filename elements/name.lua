local addon, ns = ...

local name = function(self)

	local name =  ns.core.ui.createFont(self.Health, ns.core.fonts.unitframe, 12, "OUTLINE")
	
	name:SetPoint("LEFT", self.Health, "LEFT", 4, 0)
	name:SetPoint("TOP", self.Health, "TOP", 4, 0)
	name:SetPoint("BOTTOM", self.Health, "BOTTOM", 4, 0)	
	name:SetTextColor(1, 1, 1)
	name:SetJustifyH("LEFT")

	self.Name = name
	self:Tag(name, '[name]')

end

ns.elements.name = name