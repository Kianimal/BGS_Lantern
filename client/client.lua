local Prompt
local isInMenu = false
local currentR
local currentG
local currentB
local currentA

if Config.UseMetalDetectorAsLantern then
  table.insert(Config.Lanterns, `WEAPON_KIT_METAL_DETECTOR`)
end

local function CreateLanternPrompt()
  local str = Config.Language.LanternMenuPromptText
	Prompt = PromptRegisterBegin()
	PromptSetControlAction(Prompt, Config.Keys.LanternMenu)
	str = CreateVarString(10, "LITERAL_STRING", str)
	PromptSetText(Prompt, str)
	PromptSetEnabled(Prompt, true)
	PromptSetVisible(Prompt, true)
	PromptSetHoldMode(Prompt, 1000)
	PromptRegisterEnd(Prompt)
end

local function DeleteLanternPrompt()
  PromptDelete(Prompt)
  Prompt = nil
end

local function OpenLanternMenu()
  SetNuiFocus(true, true)
  SendNUIMessage({
      type = "lantern-menu-open",
      maxBrightness = Config.MaxBrightness
  })
end

local function InitializeLight()
  Citizen.CreateThread(function()
    while true do
      local holdingLantern = false
      Citizen.Wait(50) -- Adjust the cycle speed by reducing the wait time
      local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true)
      for index, value in ipairs(Config.Lanterns) do
        if retval and weaponHash and weaponHash == value then
          holdingLantern = true
          if weaponHash == `WEAPON_KIT_METAL_DETECTOR` then
            SetEntityLightsEnabled(GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0), true)
          end
          if not Prompt and not isInMenu then
            CreateLanternPrompt()
            -- local weaponObject = GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0)
            -- TriggerServerEvent("BGS_Lantern:server:syncColorForAllNearbyPlayers", NetworkGetNetworkIdFromEntity(PlayerPedId()), NetworkGetNetworkIdFromEntity(weaponObject), GetEntityCoords(PlayerPedId()), currentR, currentG, currentB, currentA)
            break
          end
        end
      end
      if not holdingLantern and Prompt then
        DeleteLanternPrompt()
      end
      if PromptHasHoldModeCompleted(Prompt) then
        DeleteLanternPrompt()
        OpenLanternMenu()
        isInMenu = true
      end
    end
  end)
end

local function UpdateLanternLight(r, g, b, a)
  local weaponObject = GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0)
  local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true)
  if weaponHash == `WEAPON_KIT_METAL_DETECTOR` and a then
    a = a * 1000
  end
  SetLightsColorForEntity(weaponObject, tonumber(r), tonumber(g), tonumber(b))
  if a then
    Citizen.InvokeNative(0xF49574E2332A8F06, weaponObject, tonumber(a))
  end
end

RegisterNUICallback("lantern-menu-update", function(data, cb)
  local lanternRed = data.red
  local lanternGreen = data.green
  local lanternBlue = data.blue
  local lanternBrightness = data.brightness
  local weaponObject = GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0)
  UpdateLanternLight(lanternRed, lanternGreen, lanternBlue, lanternBrightness)
end)

RegisterNUICallback("lantern-menu-close", function(data, cb)
  SetNuiFocus(false, false)
  isInMenu = false
  -- TriggerServerEvent("BGS_Lantern:server:syncColorForAllNearbyPlayers", NetworkGetNetworkIdFromEntity(PlayerPedId()), GetEntityCoords(PlayerPedId()), data.red, data.green, data.blue, data.brightness)
end)

-- RegisterNetEvent("BGS_Lantern:client:syncColorForAllNearbyPlayers", function (existingPed, coords, r, g, b, a)
--   if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
--     existingPed = NetworkGetEntityFromNetworkId(existingPed)
--     print("Player ped with weapon:", existingPed)
--     local weaponObject = GetCurrentPedWeaponEntityIndex(existingPed, 0)
--     print("Weapon object:", weaponObject)
--     UpdateLanternLight(r, g, b, a, existingPed)
--   end
-- end)

InitializeLight()

AddEventHandler('onResourceStop', function(name)
  if name == GetCurrentResourceName() then
    if Prompt then
      DeleteLanternPrompt()
    end
  end
end)