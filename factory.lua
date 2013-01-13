local addon, ns = ...
local oUF = ns.oUF or oUF

local config = ns.config

local fake = function() end
local frames = {}

local spawnHelper = function(self, unit)

	if unit:match("%d") then
		self:SetActiveStyle(ns.name .. unit:gsub("%d", ''):gsub("^%l", string.upper))
	else
		self:SetActiveStyle(ns.name .. unit:gsub("^%l", string.upper))	
	end
	
	return self:Spawn(unit)

end

local createBoss = function(self, unit)

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

end

local layoutBoss = function(self, unit)

	local point, target, targetPoint, xoffset, yoffset = unpack(config.layout["bossheader"].point)

	if type(target) == "string" then
		target = frames[target]
	end

	local bossPoint, bossTarget, bossTargetPoint, bossXoffset, bossYoffset = unpack(config.layout["bossunit"].point)
	local bossWidth, bossHeight = unpack(config.layout["bossunit"].size)

	self[1]:SetPoint(point, target, targetPoint, xoffset, yoffset)
	self[1]:SetSize(bossWidth, bossHeight)
	

	for i = 2, #self do
		self[i]:SetPoint(bossPoint, self[i - 1], bossTargetPoint, bossXoffset, bossYoffset)
		self[i]:SetSize(bossWidth, bossHeight)
	end

end

local createRaid = function(self, unit) 

	self:SetActiveStyle(ns.name .. "Raid")

	local unitWidth, unitHeight = unpack(config.layout["raidunit"].size)
	local groupAnchor, groupXoffset, groupYoffset = unpack(config.layout["raidgroup"])

	local raidGroups = {}

	for i = 1, 8 do

		local group = oUF:SpawnHeader(ns.name .. "Raid" ..i, nil, "raid,party",
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

	return raidGroups

end

local layoutRaid = function(self, unit)
	
	local groups = self

	local headerAnchor, headerOther, headerOtherAnchor, headerXoffset, headerYoffset = unpack(config.layout["raidheader"].point)

	if type(headerOther) == "string" then
		headerOther = frames[headerOther]
	end

	local unitAnchor, unitOther, unitOtherAnchor, unitXoffset, unitYoffset = unpack(config.layout["raidunit"].point)

	for i, group in ipairs(groups) do

		if i == 1 then
			group:SetPoint(headerAnchor, headerOther, headerOtherAnchor, headerXoffset, headerYoffset)
		else
			group:SetPoint(unitAnchor, groups[i-1], unitOtherAnchor, unitXoffset, unitYoffset)
		end

	end	

end

local createDefault = function(self, unit)
	return spawnHelper(self, unit)
end

local layoutDefault = function(self, unit)
	
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

end

local spawnMapping = setmetatable({
	default = { create = createDefault, layout = layoutDefault },
	boss 	= { create = createBoss, 	layout = layoutBoss },
	raid 	= { create = createRaid, 	layout = layoutRaid },
}, 
{ 
	__index = function(t, k) 
		return t.default 
	end
})

local factory = function(self)
	
	local config = ns.config

	for i, unit in ipairs(config.units) do
		frames[unit] = spawnMapping[unit].create(self, unit)
	end

	for unit, frame in pairs(frames) do
		spawnMapping[unit].layout(frame, unit)
	end

end

ns.factory = factory