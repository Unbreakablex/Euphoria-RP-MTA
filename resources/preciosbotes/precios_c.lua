local preciosbotes = {
{m = "Dinghy", p = 15000, c = 11, vip = false},
{m = "Jetmax", p = 400000, c = 11, vip = true},
{m = "Marquis", p = 500000, c = 11, vip = true},
{m = "Squalo", p = 380000, c = 11, vip = true},
{m = "Tropic", p = 480000, c = 11, vip = true},

}

function getDatos()
	return preciosbotes
end	

function getPrecioFromModel(model)
	if model then
		for k, v in ipairs(preciosbotes) do
			if v.m == tostring(model) then
				return v.p
			end	
		end
	end
end

function getClaseFromModel(model)
	if model then
		for k, v in ipairs(preciosbotes) do
			if v.m == tostring(model) then
				return v.c
			end	
		end
	end
end

function isModelVIP (model)
	if model then
		for k, v in ipairs(preciosbotes) do
			if v.m == tostring(model) then
				return v.vip
			end
		end
	end
end

function getCosteRenovacionFromModel(model)
	if model then
		for k, v in ipairs(preciosbotes) do
			if v.m == tostring(model) then
				return math.floor(v.p*0.1667)
			end
		end
	end
end