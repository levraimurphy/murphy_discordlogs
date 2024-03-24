if Config.framework == 'rsg-core' then
    local CORE = exports['rsg-core']:GetCoreObject()


    function ExtractIdentifiers(src)
        local identifiers = {
        }
        identifiers.steam =CORE.Functions.GetPlayer(src).PlayerData.identfier
        identifiers.charid = CORE.Functions.GetPlayer(src).PlayerData.charIdentifier
        identifiers.citizenid = CORE.Functions.GetPlayer(src).PlayerData.citizenid
        return identifiers
    end


end
