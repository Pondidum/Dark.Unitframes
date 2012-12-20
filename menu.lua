local addon, ns = ...

local disabledUnits = {
	targettarget = true,
	focustarget = true
	pettarget = true,
}

local createMenu = function(self)

	local unit = self.unit 

	if disabledUnits[unit] then
		return 
	end

	local framePrefix = unit:gsub("(.)", string.upper, 1) -- target => Target

	if _G[framePrefix .. "FrameDropDown"] then
		
		ToggleDropDownMenu(1, nil, _G[framePrefix .. "FrameDropDown"], "cursor")

	elseif unit:match("party") then

		ToggleDropDownMenu(1, nil, _G["PartyMemberFrame".. self.id .. "DropDown"], "cursor")

	else

		FriendsDropDown.unit = unit
		FriendsDropDown.id = self.id
		FriendsDropDown.initialize = RaidFrameDropDown_Initialize

		ToggleDropDownMenu(1, nil, FriendsDropDown, "cursor")

	end

end

ns.menu = createMenu