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

	local blank = { 
		__index = {
			hide = {},
			customise = {},
		}
	}


	for unit, unitConfig in pairs(ns.config.units) do
		setmetatable(unitConfig, blank)
	end

end

boot()