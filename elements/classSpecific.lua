local addon, ns = ...

local blank =  { 
	create = function() end, 
	layout = function() end,
}

local getSpecific = function(unit)

	local class, classFile = UnitClass(unit)
	local spec = ns.elements.specific[string.lower(classFile)]

	return spec or blank

end

ns.elements.specific = {
	
	create = function(self, unit, ...)

		getSpecific(unit).create(self, unit, ...)

	end,

	layout = function(self, unit, ...)

		getSpecific(unit).layout(self, unit, ...)

	end,

	filter = function(self, unit)
		return unit == "player"
	end,

}
