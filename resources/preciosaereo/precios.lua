local preciosaereos = {
{m = "Dodo", p = 350000, c = 12, vip = false},
{m = "Maverick", p = 800000, c = 12, vip = true},
{m = "Shamal", p = 1000000, c = 12, vip = false},
{m = "Sparrow", p = 600000, c = 12, vip = true},

}

function getDatos()
	return preciosaereos
end	

function getPrecioFromModel(model)
	if model then
		for k, v in ipairs(preciosaereos) do
			if v.m == tostring(model) then
				return v.p
			end	
		end
	end
end

function getClaseFromModel(model)
	if model then
		for k, v in ipairs(preciosaereos) do
			if v.m == tostring(model) then
				return v.c
			end	
		end
	end
end

function isModelVIP (model)
	if model then
		for k, v in ipairs(preciosaereos) do
			if v.m == tostring(model) then
				return v.vip
			end
		end
	end
end

function getCosteRenovacionFromModel(model)
	if model then
		for k, v in ipairs(preciosaereos) do
			if v.m == tostring(model) then
				return math.floor(v.p*0.1667)
			end
		end
	end
end