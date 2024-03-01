TriggerEvent("getCore", function(core)
    VORP = core
end)

---------------------------------------------------------------------------------

function Ragdoll()
    local ped = PlayerPedId()
    local isDead = IsPedDeadOrDying(ped, false)
    local Ragdollactive = false
    while true do
        Wait(0)
        if IsControlJustPressed(0, Config.Key) and not isDead then
            if Ragdollactive == false then
                Ragdollactive = true
                Citizen.InvokeNative(0xAE99FB955581844A,ped,Config.RagdollTime,Config.RagdollTime,3)
                SetPedRagdollForceFall(ped)
            elseif Ragdollactive == true then
                ResetPedRagdollTimer(ped)
                Citizen.InvokeNative(0x221F4D9912B7FE86, ped,true)
                Ragdollactive = false
            end
        end
    end
end

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    Ragdoll()
end)


RegisterNetEvent('vorp:SelectedCharacter')
AddEventHandler('vorp:SelectedCharacter', function()
    Citizen.Wait(5000)
    Ragdoll()

end)