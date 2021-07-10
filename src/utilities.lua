function ToRGB(color)
	local col = color/255
	return col
end

function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2) --TODO: Change this function to take the entity tables instead of x, y, w, h values
	if((x2 <= x1 + w1) and (y2 <= y1 + h1) and (x2 + w2 >= x1) and (y2 + h2 >= y1)) then
		return true
	else
		return false
	end
end

function timer(timeToMeet, timeCur)
	if (timeCur < timeToMeet) then
		timeCur = timeCur + 1
		return false
	else
		return true		
	end
end

function table.show(t, name, indent)
	local cart     -- a container
	local autoref  -- for self references
 
	--[[ counts the number of elements in a table
	local function tablecount(t)
	   local n = 0
	   for _, _ in pairs(t) do n = n+1 end
	   return n
	end
	]]
	-- (RiciLake) returns true if the table is empty
	local function isemptytable(t) return next(t) == nil end
 
	local function basicSerialize (o)
	   local so = tostring(o)
	   if type(o) == "function" then
		  local info = debug.getinfo(o, "S")
		  -- info.name is nil because o is not a calling level
		  if info.what == "C" then
			 return string.format("%q", so .. ", C function")
		  else 
			 -- the information is defined through lines
			 return string.format("%q", so .. ", defined in (" ..
				 info.linedefined .. "-" .. info.lastlinedefined ..
				 ")" .. info.source)
		  end
	   elseif type(o) == "number" or type(o) == "boolean" then
		  return so
	   else
		  return string.format("%q", so)
	   end
	end
 
	local function addtocart (value, name, indent, saved, field)
	   indent = indent or ""
	   saved = saved or {}
	   field = field or name
 
	   cart = cart .. indent .. field
 
	   if type(value) ~= "table" then
		  cart = cart .. " = " .. basicSerialize(value) .. ";\n"
	   else
		  if saved[value] then
			 cart = cart .. " = {}; -- " .. saved[value] 
						 .. " (self reference)\n"
			 autoref = autoref ..  name .. " = " .. saved[value] .. ";\n"
		  else
			 saved[value] = name
			 --if tablecount(value) == 0 then
			 if isemptytable(value) then
				cart = cart .. " = {};\n"
			 else
				cart = cart .. " = {\n"
				for k, v in pairs(value) do
				   k = basicSerialize(k)
				   local fname = string.format("%s[%s]", name, k)
				   field = string.format("[%s]", k)
				   -- three spaces between levels
				   addtocart(v, fname, indent .. "   ", saved, field)
				end
				cart = cart .. indent .. "};\n"
			 end
		  end
	   end
	end
 
	name = name or "__unnamed__"
	if type(t) ~= "table" then
	   return name .. " = " .. basicSerialize(t)
	end
	cart, autoref = "", ""
	addtocart(t, name, indent)
	return cart .. autoref
 end

 --Acts as a switch function by taking in many vars through a table
_G.switch = function(param, case_table)
    local case = case_table[param]
    if case then return case() end
    local def = case_table['default']
    return def and def() or nil
end

--[[
	Example use of _G.switch()

	switch(a, { 
		[1] = function()	-- for case 1
		print "Case 1."
		end,
		[2] = function()	-- for case 2
			print "Case 2."
		end,
		[3] = function()	-- for case 3
			print "Case 3."
		end
	})

]]