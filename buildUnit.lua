local addon, ns = ...
local config = ns.config

local common = config.elements.common 	--needed once per unit

local applyCommon = function(specific)

	local result = {}

	for k,v in pairs(common) do
		result[k] = v
	end

	for k,v in pairs(specific) do
		result[k] = v
	end
	
end


local buildUnit = function(self, ...)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	self.colors = config.colors

	local unitConfig = applyCommon(config.elements[unit])

	for i, element in ipairs(unitConfig) do
		print(i,v)
	end

end

ns.buildUnit = buildUnit