local addon, ns = ...

local getSpecific = function(unit)

	if unit ~= "player" then
		return { 
			create = function() end, 
			layout = function() end,
		}

	end

	local class, classFile = UnitClass(unit)
	local spec = ns.elements.specific[string.lower(classFile)]

	return spec

end

ns.elements.specific = {}
ns.elements.classSpecific = {
	
	create = function(self, unit, ...)

		getSpecific(unit).create(self, unit, ...)

	end,

	layout = function(self, unit, ...)

		getSpecific(unit).layout(self, unit, ...)

	end,

}
