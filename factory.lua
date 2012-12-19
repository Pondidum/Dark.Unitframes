local addon, ns = ...

local fake = function() and
local frames = {}

local spawnHelper = function(self, unit)

	if ns.unitspecific[unit] then

		self:SetActiveStyle(ns.prefix .. unit:gsub("^%l", string.upper))

	elseif ns.unitspecific[unit:match('[^%d]+')] then		--boss1 => boss

		self:SetActiveStyle(ns.prefix .. unit:match('[^%d]+'):gsub("^%l", string.upper))

	else

		self:SetActiveStyle(ns.prefix)

	end

	return self:Spawn(unit)

end

local spawnMapping = {

	boss = {

		create = function(self, unit)

			local units = {}

			for i = 1, MAX_BOSS_FRAMES do

				local modelName = "Boss" .. i .. "TargetFrame"
				local model = _G[modelName]

				model:UnregisterAllEvents()
				model.Show = fake
				model:Hide()

				_G[modelName .. "HealthBar"]:UnregisterAllEvents()
				_G[modelName .. "ManaBar"]:UnregisterAllEvents()

				units[i] = spawnHelper(self, "boss" .. i)

			end

			return units

		end,

		layout = function(self, unit)

			local point, target, targetPoint, xoffset, yoffset = unpack(config.layout["bossheader"].point)

			if type(target) == "string" then
				target = frames[target]
			end

			local bossPoint, bossTarget, bossTargetPoint, bossXoffset, bossYoffset = unpack(config.layout["bossunit"].point)
			local bossWidth, bossHeight = unpack(config.layout["bossunit"].size)

			unit[1]:SetPoint(point, target, targetPoint, xoffset, yoffset)
			unit[1]:SetSize(bossWidth, bossHeight)
			

			for i = 2, #unit do
				unit[i]:SetPoint(bossPoint, unit[i - 1], bossTargetPoint, bossXoffset, bossYoffset)
				unit[i]:SetSize(bossWidth, bossHeight)
			end

		end,

	}

	raid = {

		create = function(self, unit) 

			self:SetActiveStyle(ns.prefix .. "Raid")

			local unitWidth, unitHeight = unpack(config.layout["raidunit"].size)
			local groupAnchor, groupXoffset, groupYoffset = unpack(config.layout["raidgroup"])

			local raidGroups = {}

			for i = 1, 8 do

				local group = oUF:SpawnHeader(ns.prefix .. "Raid" ..i, nil, "raid,party",
					'oUF-initialConfigFunction', ([[
													self:SetWidth(%d)
													self:SetHeight(%d)
												 ]]):format(unitWidth, unitHeight),
					'showPlayer', true,
					'showSolo', true,
					'showParty', true,
					'showRaid', true,
					'xoffset', groupXoffset,
					'yOffset', groupYoffset,
					'point', groupAnchor,
					'groupFilter', i)

				raidGroups[i] = group

			end

			local header = CreateFrame("Frame", "oUF_" .. ns.prefix .. "Raid", UIParent)
			header.raidGroups = raidGroups

			return header

		end,

		layout = function(self, unit)
			
			local groups = unit.groups
			local unitAnchor, unitOther, unitOtherAnchor, unitXoffset, unitYoffset = unpack(config.layout["raidunit"].point)

			for i, group in ipairs(groups) do

				if i == 1 then
					group:SetPoint(unitAnchor, raidHeader, unitAnchor, 0, 0)
				else
					group:SetPoint(unitAnchor, groups[i-1], unitOtherAnchor, unitXoffset, unitYoffset)
				end

			end

		end,

	}
	
	default = {

		create = function(self, unit)
			return spawnHelper(self, unit)
		end,

		layout = function(self, unit)
			
			local conf = config.layout[unit]

			if conf.point then

				local point, target, targetPoint, xoffset, yoffset = unpack(conf.point)

				if type(target) == "string" then
					target = frames[target]
				end

				self:SetPoint(point, target, targetPoint, xoffset, yoffset)

			end

			if conf.size then
				self:SetSize(unpack(conf.size))
			end

		end,

	}

}

setmetatable(spawnMapping, { __index = function(t, k) return t.default end})
local factory = function(self)

	local config = ns.config

	for i, unit in ipairs(config.units) do
		frames[unit] = spawnMapping[unit].create(self, unit)
	end

	for unit, frame in ipairs(frames)
		spawnMapping[unit].layout(frame, unit)
	end

end

ns.factory = factory