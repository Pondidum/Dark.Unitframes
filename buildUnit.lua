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

local buildUnit = function(self, unit)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	self.colors = config.colors
	local configUnit = unit:gsub("%d", '')
	local unitConfig = config.units[configUnit]

	for name, element in pairs(ns.elements) do

		if not tContains(unitConfig.hide, name) then
			element.create(self, unit)
		end

	end

	if unitConfig.size then
		self:SetSize(unpack(unitConfig.size))
	end

	for name, element in pairs(ns.elements) do

		if not tContains(unitConfig.hide, name) then

			local customLayout = unitConfig.customise[name] 

			if customLayout then
				customLayout(self, unit, element.layout)
			else
				element.layout(self, unit)
			end 

		end

	end

end

ns.buildUnit = buildUnit