local addon, ns = ...
local core = Dark.core
local style = core.style

local shamanSpecific = function(self, unit)

	local totems = {}

	for i = 1, MAX_TOTEMS do

		local totem = CreateFrame("StatusBar", nil, self)
		totem:SetStatusBarTexture(core.textures.normal)
		totem:GetStatusBarTexture():SetHorizTile(false)

		style.addShadow(totem)
		style.addBackground(totem)

		totem.bg = totem:CreateTexture(nil, 'BORDER')

		totems[i] = totem

	end


	self.DarkTotems = totems

end

ns.elements.specific.shaman = shamanSpecific