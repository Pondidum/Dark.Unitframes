local addon, ns = ...

local classSpecific = function(self, unit)

	local spec = ns.elements.specific[unit]

	if spec then
		spec(self, unit)
	end

end


ns.elements.specific = {}
ns.elements.classSpecific = classSpecific
