

function GetOffsetFromCoordsAndHeading(coords, heading, offsetX, offsetY, offsetZ)
    local headingRad = math.rad(heading)
    local x = offsetX * math.cos(headingRad) - offsetY * math.sin(headingRad)
    local y = offsetX * math.sin(headingRad) + offsetY * math.cos(headingRad)
    local z = offsetZ

    local worldCoords = vector4(
        coords.x + x,
        coords.y + y,
        coords.z + z,
        heading
    )
    
    return worldCoords
end

function CamCreate(npc)
	cam = CreateCam('DEFAULT_SCRIPTED_CAMERA')
	local coordsCam = GetOffsetFromCoordsAndHeading(npc, npc.w, 0.0, 0.6, 1.60)
    print(coordsCam)
	local coordsPly = npc
	SetCamCoord(cam, coordsCam)
	PointCamAtCoord(cam, coordsPly['x'], coordsPly['y'], coordsPly['z']+1.60)
	SetCamActive(cam, true)
	RenderScriptCams(true, true, 500, true, true)

end

function DestroyCamera()
    RenderScriptCams(false, true, 500, 1, 0)
    DestroyCam(cam, false)
end

-- NPC'leri spawn et
Citizen.CreateThread(function()
    for _, npc in ipairs(Config.npcs) do
        RequestModel(GetHashKey(npc.ped))
        print(npc.ped)
        print(npc.coords)
        while not HasModelLoaded(GetHashKey(npc.ped)) do
            Wait(500)
        end

        local npcPed = CreatePed(4, GetHashKey(npc.ped), npc.coords.x, npc.coords.y, npc.coords.z, npc.coords.w, false, false)
        FreezeEntityPosition(npcPed, true)
        SetEntityInvincible(npcPed, true)
        SetBlockingOfNonTemporaryEvents(npcPed, true)
    end
end)

RegisterNetEvent("yazdir", function(text)
    if not text == nil then
        print(text)
    else 
        print("bos")
    end
    
end)

RegisterNetEvent("npc-menu:showMenu", function(npc)
    SendNUIMessage({
        type = "dialog",
        options = npc.options,
        name = npc.name,
        text = npc.text,
        job = npc.job
    })
    CamCreate(npc.coords)
end)


RegisterNUICallback("npc-menu:hideMenu", function()
    SetNuiFocus(false, false)
    DestroyCamera()
end)

RegisterNUICallback("npc-menu:islem", function(data)

    SetNuiFocus(false, false)
    print(data.event, json.encode(data.args), data.type)
    print(data.type)
    if data.type == 'client' then
        TriggerEvent(data.event, json.encode(data.args))
    elseif data.type == 'server' then
        TriggerServerEvent(data.event, json.encode(data.args))
    elseif data.type == 'command' then
        ExecuteCommand(data.event, json.encode(data.args))
    end
    DestroyCamera()
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)

        for _, npc in ipairs(Config.npcs) do
            local coords = GetEntityCoords(playerPed, false)
            local distance = GetDistanceBetweenCoords(coords, npc.coords.x, npc.coords.y, npc.coords.z, true)

            if distance < 1.5 then
                DisplayHelpText("E tuşuna basarak etkileşime geç")
                if IsControlJustPressed(0, 38) then -- E tuşuna basıldığında
                    TriggerEvent("npc-menu:showMenu", npc)
                    SetNuiFocus(true, true)
                end
            end
        end
    end
end)

function DisplayHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
