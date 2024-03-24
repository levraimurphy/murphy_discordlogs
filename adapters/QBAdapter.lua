if Config.framework == 'qbr-core' then

    function ExtractIdentifiers(src)
        local identifiers = {
        }
        identifiers.steam = exports['qbr-core']:GetPlayer(src).PlayerData.identifier
        identifiers.charid = exports['qbr-core']:GetPlayer(src).PlayerData.charIdentifier
        identifiers.citizenid = exports['qbr-core']:GetPlayer(src).PlayerData.citizenid
        return identifiers
    end
end

