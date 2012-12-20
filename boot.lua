local addon, ns = ...
local ouf = ns.oUF or oUF

local boot = function()

	ns.key = "DarkUnitFrames"
	ns.unitSpecific = {}

	setmetatable(ns.config.colors, { __index = ouf.colors})
	
end

boot()