local addon, ns = ...
local ouf = ns.oUF or oUF

local boot = function()

	ns.elements = {}
	ns.tags = {}

	ns.name = "DarkUnitFrames"
	ns.core = Dark.core

	setmetatable(ns.config.colors, { __index = ouf.colors})
	setmetatable(ns.config.elements, { __index = function(t, v) return t.common end })

end

boot()