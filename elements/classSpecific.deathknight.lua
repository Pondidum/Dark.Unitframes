local addon, ns = ...

local config = ns.config
local colors = config.colors

local style = ns.lib.style
local textures = ns.lib.media.textures
local events = ns.lib.events

local RUNE_HEIGHT = 8


local createRunes = function(self, unit)

	local runes = CreateFrame("Frame", nil, self)
	runes:SetHeight( (3 * RUNE_HEIGHT) + (2 * ns.config.spacing) )

	for i = 1, 6 do

		local rune = CreateFrame("StatusBar", nil, runes)

		rune:SetStatusBarTexture(textures.normal)
		rune:GetStatusBarTexture():SetHorizTile(false)

		style:frame(rune)

		rune:SetHeight(RUNE_HEIGHT)

		if i % 2 == 0 then
			rune:SetPoint("RIGHT")
			rune:SetPoint("LEFT", runes, "CENTER", ns.config.spacing, 0)
		else
			rune:SetPoint("LEFT")
			rune:SetPoint("RIGHT", runes, "CENTER", -ns.config.spacing, 0)
		end

		local j = i - 1
		local yOffset = (j - (j % 2)) / 2
		local delta = (yOffset * RUNE_HEIGHT) + (yOffset * ns.config.spacing)

		rune:SetPoint("BOTTOM", runes, "BOTTOM", 0, delta)

		runes[i] = rune

	end

	self.DarkRunes = runes
	self.classSpecific = runes
end

local createPresenceColours = function(self)

	self.Health.colorTapping = false
	self.Health.colorDisconnected = false
	self.Health.colorClass = false
	self.Health.colorReaction = false
	self.Health.colorSmooth = false
	self.Health.colorHealth = false

	self.Health.PostUpdate = function(h, u, min, max)

		local index = GetShapeshiftForm()

		if not index or index <= 0 then
			return
		end

		local texture, name, isActive = GetShapeshiftFormInfo(index)

		if not texture then
			return
		end

		local r, g, b

		if index == 2 then
			r, g, b = 28/255, 109/255, 139/255 --frost
		elseif index == 3 then
			r, g, b = 0/255, 79/255, 0/255 --unholy
		else
			r, g, b = 196/255,  30/255, 60/255 --blood
		end

		h:SetStatusBarColor(r, g, b)

		local mu = h.bg.multiplier or 1
		h.bg:SetVertexColor(r * mu, g * mu, b * mu)

	end

	events:new({
		UPDATE_SHAPESHIFT_FORM = function()
			self.Health:ForceUpdate()
		end
	})

end

ns.elements.specific.deathknight = {

	create = function(self, unit)

		createRunes(self, unit)
		createPresenceColours(self)

	end,

	layout = function(self)

		local anchor = self.Health

		self.DarkRunes:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, ns.config.spacing)
		self.DarkRunes:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, ns.config.spacing)

	end,

}
