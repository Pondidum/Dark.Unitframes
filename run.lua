local addon, ns = ...
local ouf = ns.oUF or oUF

local run = function()

	for unit, action in ns.unitSpecific do

		ouf:RegisterStyle(ns.prefix .. unit:gsub("^%l", string.upper), action)

	end
	
	ouf:Factory(ns.factory)
	
end

run()