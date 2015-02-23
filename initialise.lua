local addon, ns = ...
local oUF = ns.oUF or oUF

local boot = function()

	local dark = Darker

	ns.lib = {
		media = dark.media,
		style = dark.style
	}

	ns.elements = {}
	ns.tags = {}

	ns.name = "DarkUnitFrames"

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