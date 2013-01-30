local addon, ns = ...

local builder = {}

builder.segments = function(type, parent, count, config)

	for i = 1, count do

		local segment = CreateFrame(type or "Frame", nil, parent)
		
		if config then
			config(segment, i)
		end

		parent[i] = segment

	end

end

	
builder.autoSegments = function(type, parent, count, spacing, config)
	
	builder.segments(type, parent, count, config)

	parent:SetScript("OnSizeChanged", function(self, parentWidth, parentHeight) 

		local spaceCount = count - 1
		local segmentWidth = (parentWidth - (spacing * spaceCount)) / count

		parent[1]:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 0, 0)
		parent[1]:SetWidth(segmentWidth)

		for i = 2, count do 

			parent[i]:SetPoint("LEFT", parent[i - 1], "RIGHT", spacing, 0)
			parent[i]:SetWidth(segmentWidth)

		end

	end)

end


ns.builder = builder