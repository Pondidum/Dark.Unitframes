local addon, ns = ...

local classSpecific = function(self, unit)

	local class, classFile = UnitClass(unit)

	local spec = ns.elements.specific[string.lower(classFile)]

	if spec then
		spec(self, unit)
	end

end


ns.elements.specific = {}
ns.elements.classSpecific = classSpecific
