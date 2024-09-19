if Config.Framework == 'vorp' then   
    local VorpCore = {}
    
    TriggerEvent("getCore",function(core)
        VorpCore = core
    end)

    
    function ExtractIdentifiers(targetID)
        local identifiers = {
        }
        identifiers.steam = VorpCore.getUser(targetID).getUsedCharacter.identifier
        identifiers.charid = VorpCore.getUser(targetID).getUsedCharacter.charIdentifier
        identifiers.citizenid = VorpCore.getUser(targetID).getUsedCharacter.citizenid
        return identifiers
    end
end