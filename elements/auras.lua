local addon, ns = ...
local core = Dark.core


local UnitAura, UnitIsFriend = UnitAura, UnitIsFriend

local auraHeight = 29

local postCreateAura = function(element, button)

	button.icon:SetPoint("TOPLEFT", 2, -2)
	button.icon:SetPoint("BOTTOMRIGHT", -2, 2)
	button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	button.icon:SetDrawLayer('ARTWORK')

	button.count:SetPoint("BOTTOMRIGHT", 3, 3)
	button.count:SetJustifyH("RIGHT")
	button.count:SetFont(core.fonts.unitframes, 12, "THICKOUTLINE")
	button.count:SetTextColor(0.84, 0.75, 0.65)
	button.count:SetDrawLayer('OVERLAY')

	button.overlayFrame = CreateFrame("frame", nil, button, nil)

	button.overlay:SetParent(button.overlayFrame)
	button.count:SetParent(button.overlayFrame)

	button.Glow = CreateFrame("Frame", nil, button)
	button.Glow:SetPoint("TOPLEFT", button, "TOPLEFT", -1, 1)
	button.Glow:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 1, -1)
	button.Glow:SetFrameStrata("BACKGROUND")	
	button.Glow:SetBackdrop{edgeFile =  core.textures.shadow, edgeSize = 3, insets = {left = 0, right = 0, top = 0, bottom = 0}}
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

local createDebuffs = function(self)

	local anchor = self.classSpecific or self.Health
	local debuffs = CreateFrame("Frame", nil, self)

	debuffs:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", -1, 5)
	debuffs:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", -1, 5)
	debuffs:SetHeight(auraHeight)
	debuffs.size = auraHeight
	debuffs.num = 7
	debuffs.spacing = 1
	debuffs.initialAnchor = 'BOTTOMLEFT'

	debuffs.PostCreateIcon = postCreateAura
	debuffs.PostUpdateIcon = postUpdateAura

	self.Debuffs = debuffs

end

local createBuffs = function(self)

	local anchor = self.Debuffs or self.classSpecific or self.Health
	local buffs = CreateFrame("Frame", nil, self)
	
	buffs:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", -1, 5)
	buffs:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", -1, 5)
	buffs:SetHeight(auraHeight)
	buffs.size = auraHeight
	buffs.num = 7
	buffs.spacing = 1
	buffs.initialAnchor = 'BOTTOMLEFT'

	buffs.PostCreateIcon = postCreateAura
	buffs.PostUpdateIcon = postUpdateAura
	
	self.Buffs = buffs

end

ns.elements.buffs = createBuffs
ns.elements.debuffs = createDebuffs

