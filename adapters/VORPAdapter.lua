if Config.Framework == 'vorp' then   
    local VorpCore = {}
    
    TriggerEvent("getCore",function(core)
        VorpCore = core
    end)

    
    function ExtractIdentifiers(targetID)
        local identifiers = {
        }
        local player = VorpCore.getUser(targetID)
        if player == nil then return identifiers end
        identifiers.steam = player.getUsedCharacter.identifier
        identifiers.charid = player.getUsedCharacter.charIdentifier
        identifiers.citizenid = player.getUsedCharacter.charIdentifier
        return identifiers
    end
end