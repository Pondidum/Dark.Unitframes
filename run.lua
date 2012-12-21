local addon, ns = ...
local ouf = ns.oUF or oUF

local run = function()

	for i, unit in ipairs(ns.config.units) do

		ouf:RegisterStyle(ns.name .. unit:gsub("^%l", string.upper), ns)

	end
	
	ouf:Factory(ns.factory)
	
end

run()