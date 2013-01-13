local addon, ns = ...
local config = ns.config

local elements = ns.elements


local runElement = function(self, ignoreElements, element, unit, ...)

	if tContains(ignoreElements, element) then
		return
	end

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

	local unitConfig = config.elements[unit]
	local ignoreElements = unitConfig.remove or {}

	local commonConfig = config.elements.common

	for i, element in ipairs(commonConfig) do
		runElement(self, ignoreElements, element, unit, ...)
	end

	for i, element in ipairs(unitConfig) do
		runElement(self, ignoreElements, element, unit, ...)
	end

end

ns.buildUnit = buildUnit