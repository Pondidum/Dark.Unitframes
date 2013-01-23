local addon, ns = ...

local disabledUnits = {
	targettarget = true,
	focustarget = true,
	pettarget = true,
}

ns.elements.menu = {
	
	create = function(self) 

		self.menu = function(self)

			local unit = self.unit 

			if disabledUnits[unit] then
				return 
			end

			local framePrefix = unit:gsub("(.)", string.upper, 1) -- target => Target
			local dropdown = _G[framePrefix .. "FrameDropDown"]

			if dropdown then
				
				ToggleDropDownMenu(1, nil, dropdown, "cursor")

			elseif unit:match("party") then

				ToggleDropDownMenu(1, nil, _G["PartyMemberFrame".. self.id .. "DropDown"], "cursor")

			else

				FriendsDropDown.unit = unit
				FriendsDropDown.id = self.id
				FriendsDropDown.initialize = RaidFrameDropDown_Initialize

				ToggleDropDownMenu(1, nil, FriendsDropDown, "cursor")

			end

		end

	end,

	layout = function(self) 
		--none
	end,
}

