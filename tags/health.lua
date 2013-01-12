local addon, ns = ...

--local api
--local UnitHealth, UnitIsConnected, UnitIsDead, UnitIsGhost, UnitHealthMax = UnitHealth, UnitIsConnected, UnitIsDead, UnitIsGhost, UnitHealthMax

local shortValue = function(v)

	if v == nil then return 0 end

	if v >= 1e6 then
		return ("%.1fm"):format(v / 1e6):gsub("%.?0+([km])$", "%1")
	elseif v >= 1e3 or v <= -1e3 then
		return ("%.1fk"):format(v / 1e3):gsub("%.?0+([km])$", "%1")
	else
		return v
	end

end

local shortValueNegative = function(v)
	if v == nil then return 0 end
	if v <= 999 then return v end
	if v >= 1000000 then
		local value = string.format("%.1fm", v/1000000)
		return value
	elseif v >= 1000 then
		local value = string.format("%.1fk", v/1000)
		return value
	end
end


local tag = function(unit)

	if not UnitIsConnected(unit) then
		return "Disconnected"
	end

	if UnitIsDead(unit) then
		return "Dead"
	end

	if UnitIsGhost(unit) then
		return "Ghost"
	end

	local min = UnitHealth(unit)
	local max = UnitHealthMax(unit)

	if min ~= max then
		return shortValue(min) .. " | " .. floor(min / max * 100) .. "%"
	else
		return shortValue(max)
	end

end

ns.tags[ns.name .. ':health'] = tag