if Config.Framework == "REDEMRP2k23" then
    RedEM = exports["redem_roleplay"]:RedEM()
    function ExtractIdentifiers(src)
        local identifiers = {
        }
        local player = RedEM.GetPlayer(src)
        identifiers.steam = player.identifier
        identifiers.charid = player.charid
        identifiers.citizenid = player.citizenid
        return identifiers
    end

end