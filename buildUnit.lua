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

	print("building unit " .. unit)

	local unitConfig = config.units[unit]

	for name, element in pairs(ns.elements) do

		if not tContains(unitConfig.hide, name) then
			element.create(self, unit, ...)
		end

	end

	self:SetSize(unpack(unitConfig.size))

	for name, element in pairs(ns.elements) do

		if not tContains(unitConfig.hide, name) then

			local layout = unitConfig.customise[name] or element.layout
			layout(self, unit, ...)

		end

	end

end

ns.buildUnit = buildUnit