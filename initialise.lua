local addon, ns = ...
local oUF = ns.oUF or oUF


local parseElementConfig = function()

	local common = ns.config.elements.common

	setmetatable(ns.config.elements, { __index = function(t, v) return common end })

	for unitName, specific in pairs(ns.config.elements) do

		local result = {}

		for k, v in ipairs(common) do
			table.insert(result, v)
		end

		for k,v in ipairs(specific) do

			if tContains(result, v) == nil then
				table.insert(result, v)
			end

		end

		ns.config.elements[unitName] = result

	end

end



local boot = function()

	ns.elements = {}
	ns.tags = {}

	ns.name = "DarkUnitFrames"
	ns.core = Dark.core

	setmetatable(ns.config.colors, { __index = oUF.colors})
	setmetatable(ns.config.colors.power, { __index = oUF.colors.power })


	parseElementConfig()

end

boot()