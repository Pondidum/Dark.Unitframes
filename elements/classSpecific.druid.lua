local addon, ns = ...
local core = Dark.core
local style = core.style

local ECLIPSE_HEIGHT = 8
local MAX_MUSHROOMS = 3

local createEclipseBar = function(self, unit)

	local eclipse = CreateFrame("Frame", nil, self)

	style.addBackground(eclipse)
	style.addShadow(eclipse)
	
	local lunar = CreateFrame("StatusBar", "dlunar", eclipse)
	lunar:SetAllPoints(eclipse)
	lunar:SetStatusBarTexture(core.textures.normal)
	lunar:SetStatusBarColor(0.5, 0.52, 0.6)

	eclipse.LunarBar = lunar

	local solar = CreateFrame("StatusBar", "dsolar", eclipse)
	solar:SetReverseFill(true)
	solar:SetAllPoints(eclipse)
	solar:SetStatusBarTexture(core.textures.normal)
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

	for i = 1, MAX_MUSHROOMS do

		local mushroom = CreateFrame("StatusBar", nil, mushrooms)
		mushroom:SetHeight(ECLIPSE_HEIGHT)
		mushroom:SetStatusBarTexture(core.textures.normal)
		mushroom:GetStatusBarTexture():SetHorizTile(false)

		style.addShadow(mushroom)
		style.addBackground(mushroom)

		mushrooms[i] = mushroom

	end

	--i cant think of a better way of doing this without hardcoding widths, or creating surplus frames
	mushrooms:SetScript("OnSizeChanged", function(self, w, h) 

		local mushroomWidth = (w - (ns.config.spacing *  (MAX_MUSHROOMS - 1))) / MAX_MUSHROOMS

		mushrooms[1]:SetPoint("BOTTOMLEFT", mushrooms, "BOTTOMLEFT", 0, 0)
		mushrooms[1]:SetWidth(mushroomWidth)

		for i = 2, MAX_MUSHROOMS do 

			mushrooms[i]:SetPoint("LEFT", mushrooms[i - 1], "RIGHT", ns.config.spacing, 0)
			mushrooms[i]:SetWidth(mushroomWidth)

		end

	end)

	return mushrooms

end

ns.elements.specific.druid = {
	
	create = function(self)

		self.EclipseBar = createEclipseBar(self, unit)
		self.DarkTotems = createMushrooms(self, unit)

		self.classSpecific = self.DarkTotems

	end,

	layout = function(self)

		self.EclipseBar:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
		self.EclipseBar:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
		self.EclipseBar:SetHeight(ECLIPSE_HEIGHT)

		self.DarkTotems:SetPoint("BOTTOMLEFT", self.EclipseBar, "TOPLEFT", 0, ns.config.spacing)
		self.DarkTotems:SetPoint("BOTTOMRIGHT", self.EclipseBar, "TOPRIGHT", 0, ns.config.spacing)
		self.DarkTotems:SetHeight(ECLIPSE_HEIGHT)

	end,

}
