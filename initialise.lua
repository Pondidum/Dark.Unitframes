local addon, ns = ...
local oUF = ns.oUF or oUF

local boot = function()

	ns.elements = {}
	ns.tags = {}

	ns.name = "DarkUnitFrames"
	ns.core = Dark.core

	setmetatable(ns.config.colors, { __index = oUF.colors})
	setmetatable(ns.config.colors.power, { __index = oUF.colors.power })
	setmetatable(ns.config.colors.class, { __index = oUF.colors.class })

	--setmetatable(ns.config.elements, { __index = function() return {} end })

end

boot()