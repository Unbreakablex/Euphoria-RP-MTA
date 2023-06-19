local screenX, screenY = guiGetScreenSize() 
local myFont = dxCreateFont ( "font.ttf",20 )
local smothedRotation = 0
local abierto = true

localPlayer = getLocalPlayer ()


function drawNeedle( vehicle, seat)
	if abierto == true then
	if not getPedOccupiedVehicle ( localPlayer ) then
		return true
	end
	if getPedOccupiedVehicle( localPlayer ) and getPedOccupiedVehicleSeat( localPlayer ) == 0 then
		lightState = getVehicleOverrideLights( getPedOccupiedVehicle( localPlayer ) )
		if isPedInVehicle(getLocalPlayer())then 
			local veh = getElementSpeed(getPedOccupiedVehicle(getLocalPlayer()), "kmh")
			local engine = (getPedOccupiedVehicle(getLocalPlayer()))
			if not veh then return end
			local vehicleSpeed = getVehicleSpeed()
			local rot = math.floor(((220/12800)* getVehicleRPM(getPedOccupiedVehicle(getLocalPlayer()))) + 0.5)
			local fuel = getElementData(getPedOccupiedVehicle ( localPlayer ), "fuel" ) or 0
			local kms = getElementData( getPedOccupiedVehicle ( localPlayer ), "km" ) or 0
		if (smothedRotation < rot) then
			smothedRotation = smothedRotation + 1.5
		end
		if (smothedRotation > rot) then
			smothedRotation = smothedRotation - 1.5
		end
			
		if vehicleSpeed > 252 then
			vehicleSpeed = 252
		end
		if vehicleSpeed < -252 then
			vehicleSpeed = -252
		end
			
	end
	end
	end
end
addEventHandler("onClientRender", getRootElement(), drawNeedle)

addCommandHandler( "togglevelo",
	function()
		abierto = not abierto
	end
)

--- Стрелка спидометра
function getVehicleSpeed()
    if isPedInVehicle(getLocalPlayer()) then
	    local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
        local vx, vy, vz = getElementVelocity (theVehicle)
        return math.sqrt(vx^2 + vy^2 + vz^2) * 225
    end
    return 0
end

function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="mph" or unit==1 or unit =='1') then
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100)
        else
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100 * 1.609344)
        end
    else
        return false
    end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function getFormatKMS(unit)
	if unit < 10 then
		unit = "0000" .. unit
	elseif unit >= 10 then
		unit = "00"..unit
	elseif unit >= 100 then
		unit = "00"..unit
	elseif unit >= 1000 then
		unit = "0"..unit
	elseif unit >= 10000 then
		unit = "99999"
	end
	return unit
end
-- Скорость 
function getFormatSpeed(unit)
    if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end
-- бензин
function getFormatFuel(unit)
    if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end
-- передачи и задняя
function getFormatGear()
    local gear = getVehicleCurrentGear(getPedOccupiedVehicle(getLocalPlayer()))
    local rear = "R"
	local neutral = "N"
    if (gear > 0) then 
        return gear
    else
        return rear
    end
end
-- нетральная передача
function getFormatNeutral()
	local neutral = "N"
	return neutral
end
-- тахометр 
function getVehicleRPM(vehicle)
local vehicleRPM = 0
    if (vehicle) then  
        if (getVehicleEngineState(vehicle) == true) then
            if getVehicleCurrentGear(vehicle) > 0 then             
                vehicleRPM = math.floor(((getElementSpeed(vehicle, "kmh")/getVehicleCurrentGear(vehicle))*180) + 0.5) 
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end
            else
                vehicleRPM = math.floor((getElementSpeed(vehicle, "kmh")*180) + 0.5)
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end
            end
        else
            vehicleRPM = 0
        end
        return tonumber(vehicleRPM)
    else
        return 0
    end
end