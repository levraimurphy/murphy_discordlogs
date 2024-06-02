if Config.Framework == 'redemrp2022' then

    function ExtractIdentifiers(src)
        local identifiers = {
        }
        identifiers.steam = RetrievePlayer(src).getIdentifier()
        identifiers.charid = RetrievePlayer(src).getCharIdentifier()
        identifiers.citizenid = RetrievePlayer(src).getCharIdentifier()
        return identifiers
    end
end
