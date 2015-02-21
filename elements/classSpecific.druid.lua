local addon, ns = ...

local textures = ns.lib.media.textures
local style = ns.lib.style

local ECLIPSE_HEIGHT = 8
local MAX_MUSHROOMS = 3

local createEclipseBar = function(self, unit)

	local eclipse = CreateFrame("Frame", nil, self)

	style:frame(eclipse)

	local lunar = CreateFrame("StatusBar", "dlunar", eclipse)
	lunar:SetAllPoints(eclipse)
	lunar:SetStatusBarTexture(textures.normal)
	lunar:SetStatusBarColor(0.5, 0.52, 0.6)

	eclipse.LunarBar = lunar

	local solar = CreateFrame("StatusBar", "dsolar", eclipse)
	solar:SetReverseFill(true)
	solar:SetAllPoints(eclipse)
	solar:SetStatusBarTexture(textures.normal)
	solar:SetStatusBarColor(0.8, 0.82, 0.6)

	eclipse.SolarBar = solar

	return eclipse

end

local createMushrooms = function(self, unit)

	local mushrooms = CreateFrame("Frame", nil, self)

	mushrooms.colors = {
		[1] = {0.65, 0.63, 0.35, 0.6},
		[2] = {0.65, 0.63, 0.35, 0.6},
		[3] = {0.65, 0.63, 0.35, 0.6},
	}

	ns.builder.autoSegments("StatusBar", mushrooms, MAX_MUSHROOMS, ns.config.spacing, function(segment)

		style:frame(segment)

		segment:SetStatusBarTexture(textures.normal)
		segment:GetStatusBarTexture():SetHorizTile(false)

		segment:SetHeight(ECLIPSE_HEIGHT)

	end)

	return mushrooms

end

ns.elements.specific.druid = {

	create = function(self)
		self.EclipseBar = createEclipseBar(self, unit)
	end,

	layout = function(self)

		self.EclipseBar:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.EclipseBar:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
		self.EclipseBar:SetHeight(ECLIPSE_HEIGHT)

	end,

}
