local addon, ns = ...
local core = Dark.core
local style = core.style

local ECLIPSE_HEIGHT = 8

-- local eclipseDirection = function(self)

-- 	if ( GetEclipseDirection() == "sun" ) then
-- 			self.Text:SetText("|cffE5994C".."Starfire".."|r")
-- 	elseif ( GetEclipseDirection() == "moon" ) then
-- 			self.Text:SetText("|cff4478BC".."Wrath".."|r")
-- 	else
-- 			self.Text:SetText("")
-- 	end

-- end

local druidSpecific = function(self, unit)
	
	local eclipse = CreateFrame("Frame", nil, self)
	eclipse:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, ns.config.spacing)
	eclipse:SetPoint("BOTTOMRIGHT", self.Health, "TOPRIGHT", 0, ns.config.spacing)
	eclipse:SetHeight(ECLIPSE_HEIGHT)

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


	self.EclipseBar = eclipse
	self.classSpecific = eclipse

end

ns.elements.specific.druid = druidSpecific