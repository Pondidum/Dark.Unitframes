local addon, ns = ...
local config = ns.config

local elements = ns.elements
local commonConfig = config.elements.common

local runElement = function(self, element, unit, ...)

	if elements[element] then
		elements[element](self, unit, ...)
	else
		print("unkown", element)
	end

end

local buildUnit = function(self, unit, ...)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	self.colors = config.colors

	for i, element in ipairs(commonConfig) do
		runElement(self, element, unit, ...)
	end

	local unitConfig = config.elements[unit]

	for i, element in ipairs(unitConfig) do
		runElement(self, element, unit, ...)
	end

end

ns.buildUnit = buildUnit