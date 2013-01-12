local addon, ns = ...
local config = ns.config

local elements = ns.elements

local buildUnit = function(self, unit, ...)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	self.colors = config.colors

	local unitConfig = config.elements[unit]

	for i, element in ipairs(unitConfig) do

		if elements[element] then
			elements[element](self, unit, ...)
		else
			print("unkown", element)
		end
	end

end

ns.buildUnit = buildUnit