local addon, ns = ...
local oUF = ns.oUF or oUF

local registerTags = function()

	for name, action in pairs(ns.tags) do
		oUF.Tags.Methods[name] = action
	end

end

local registerUnitStyles = function()

	for unit, unitConfig in pairs(ns.config.units) do
		oUF:RegisterStyle(ns.name .. unit:gsub("^%l", string.upper), ns.buildUnit)
	end

end

local run = function()
	
	registerTags()
	registerUnitStyles()

	oUF:Factory(ns.factory)
	
end

run()