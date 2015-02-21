local addon, ns = ...

local textures = ns.lib.media.textures
local style = ns.lib.style

local TOTEM_HEIGHT = 8

ns.elements.specific.shaman = {

	create = function(self, unit)

		local totems = CreateFrame("Frame", nil, self)

		ns.builder.autoSegments("StatusBar", totems, MAX_TOTEMS, ns.config.spacing, function(segment, i)

			segment:SetMinMaxValues(0, 1)
			segment:SetStatusBarTexture(textures.normal)
			segment:GetStatusBarTexture():SetHorizTile(false)

			style:frame(segment)

			segment:SetHeight(TOTEM_HEIGHT)

		end)

		local colors = self.colors

		totems:SetScript("OnUpdate", function(self)

			for i = 1, MAX_TOTEMS do

				local id = totems[i]:GetID()
				local haveTotem, name, start, duration, icon = GetTotemInfo(id)

				if haveTotem then
					totems[i]:SetValue(1 - ((GetTime() - start) / duration))
					totems[i]:SetStatusBarColor(unpack(colors.totems[id]))
				end

			end

		end)

		self.Totems = totems
		self.classSpecific = totems

	end,

	layout = function(self)

		self.Totems:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.Totems:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
		self.Totems:SetHeight(TOTEM_HEIGHT)

	end,
}
