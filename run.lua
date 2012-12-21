local addon, ns = ...
local oUF = ns.oUF or oUF

local run = function()
	
	for name, action in pairs(ns.tags) do
		oUF.Tags.Methods[name] = action
	end

	for i, unit in ipairs(ns.config.units) do

		oUF:RegisterStyle(ns.name .. unit:gsub("^%l", string.upper), ns)

	end
	
	oUF:Factory(ns.factory)
	
end

run()