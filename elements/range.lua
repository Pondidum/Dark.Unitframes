local addon, ns = ...

local rangeCheck = function(self, unit)

	self.Range = {insideAlpha = 1, outsideAlpha = 0.3}

end

ns.elements.range = rangeCheck