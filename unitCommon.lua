local addon, ns = ...
local config = ns.config

local common = function(self)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	self.colors = config.colors

end

ns.unitCommon = common