local addon, ns = ...

local fonts = ns.lib.media.fonts
local textures = ns.lib.media.textures

local UnitAura, UnitIsFriend = UnitAura, UnitIsFriend

local auraCount = 5
local auraHeight = 27

local postCreateAura = function(element, button)

	button.icon:SetPoint("TOPLEFT", 2, -2)
	button.icon:SetPoint("BOTTOMRIGHT", -2, 2)
	button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	button.icon:SetDrawLayer('ARTWORK')

	button.count:SetPoint("BOTTOMRIGHT", 3, 3)
	button.count:SetJustifyH("RIGHT")
	button.count:SetFont(fonts.unitframes, 12, "THICKOUTLINE")
	button.count:SetTextColor(0.84, 0.75, 0.65)
	button.count:SetDrawLayer('OVERLAY')

	button.overlayFrame = CreateFrame("frame", nil, button, nil)

	button.overlay:SetParent(button.overlayFrame)
	button.count:SetParent(button.overlayFrame)

	button.Glow = CreateFrame("Frame", nil, button)
	button.Glow:SetPoint("TOPLEFT", button, "TOPLEFT", -1, 1)
	button.Glow:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 1, -1)
	button.Glow:SetFrameStrata("BACKGROUND")
	button.Glow:SetBackdrop{edgeFile = textures.shadow, edgeSize = 3, insets = {left = 0, right = 0, top = 0, bottom = 0}}
	button.Glow:SetBackdropColor(0, 0, 0, 0)
	button.Glow:SetBackdropBorderColor(0, 0, 0)

end

local postUpdateAura = function(self, unit, icon, index, offset)

	local name, rank, auraIcon, count, dispellType, duration, expirationTime, unitCaster, _ = UnitAura(unit, index, icon.filter)

	if icon.isDebuff then

		if not UnitIsFriend("player", unit) and icon.owner ~= "player" and icon.owner ~= "vehicle" then
			icon.icon:SetDesaturated(true)
		else
			icon.icon:SetDesaturated(false)
		end

	end

end

ns.elements.buffs = {

	create = function(self)

		local buffs = CreateFrame("Frame", nil, self)
		buffs.size = auraHeight
		buffs.num = auraCount
		buffs.spacing = ns.config.spacing
		buffs.initialAnchor = 'BOTTOMLEFT'

		buffs.PostCreateIcon = postCreateAura
		buffs.PostUpdateIcon = postUpdateAura

		self.Buffs = buffs

	end,

	layout = function(self)

		local anchor = self.Debuffs or self.classSpecific or self.Health
		local buffs = self.Buffs

		buffs:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, ns.config.spacing)
		buffs:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, ns.config.spacing)
		buffs:SetHeight(auraHeight)

	end,

}

ns.elements.debuffs = {

	create = function(self)

		local debuffs = CreateFrame("Frame", nil, self)

		debuffs.size = auraHeight
		debuffs.num = auraCount
		debuffs.spacing = ns.config.spacing
		debuffs.initialAnchor = 'BOTTOMLEFT'

		debuffs.PostCreateIcon = postCreateAura
		debuffs.PostUpdateIcon = postUpdateAura

		self.Debuffs = debuffs

	end,

	layout = function(self)

		local anchor = self.classSpecific or self.CPoints or self.Health

		self.Debuffs:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, ns.config.spacing)
		self.Debuffs:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, ns.config.spacing)
		self.Debuffs:SetHeight(auraHeight)

	end,

}

