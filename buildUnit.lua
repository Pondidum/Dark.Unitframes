local addon, ns = ...
local config = ns.config

local elements = ns.elements
local common = config.elements.common 	--needed once per unit

local applyCommon = function(specific)

	local result = {}

	for k, v in ipairs(common) do
		table.insert(result, v)
	end

	for k,v in ipairs(specific) do
		table.insert(result, v)
	end
	
	return result

end


local buildUnit = function(self, unit, ...)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	self.colors = config.colors

	local unitConfig = applyCommon(config.elements[unit])

	for i, element in ipairs(unitConfig) do

		if elements[element] then
			elements[element](self, unit, ...)
		else
			print("unkown", element)
		end
	end

end

ns.buildUnit = buildUnit