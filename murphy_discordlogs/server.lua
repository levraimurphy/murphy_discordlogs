
RegisterServerEvent('murphy_discordlogs:SendLog')
AddEventHandler('murphy_discordlogs:SendLog', function(source, data)
    local webHook = Config.Logs[data['Log']] or data['Log']
    if webHook == nil then
        return
    end

    local embed = GenerateEmbed(source, data)

    Wait(125)
        
    PerformHttpRequest(webHook, function(err, text, headers) 
        if(tostring(err) == '404') then
            print('Error sending webhook')
        end
    end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end)


function GenerateEmbed(source,data)
    local _source = source
    if data['Player'] ~= nil then
        _source = data['Player']
    else
        _source = source
    end
    local embed = {}
    if data['Target'] ~= nil then
        local srcIds = ExtractIdentifiers(_source)
        local trgIds = ExtractIdentifiers(data['Target'])

        embed = {
            {
                ["color"] = Config.Colors[data['Color']],
                ["title"] = "**"..data['Title'].."**",
                ["description"] = data['Message'] .. '\n\n'
                .. '**Source Player**\n**Player name:** ``' .. GetPlayerName(_source) .. '``\n'
                .. '**Player charid:** ``' .. srcIds.charid .. '``\n'
                .. '**Player citizenid:** ``' .. srcIds.citizenid .. '``\n'
                .. '**Player steam:** https://steamcommunity.com/profiles/' .. tostring(tonumber(srcIds.steam:gsub("steam:", ""),16))  .. '\n'
                .. '**Target Player**\n**Target name:** ``' .. GetPlayerName(data['Target']) .. '``\n'
                .. '**Target charid:** ``' .. trgIds.charid .. '``\n'
                .. '**Target citizenid:** ``' .. trgIds.citizenid .. '``\n'
                .. '**Target steam:** https://steamcommunity.com/profiles/' .. tostring(tonumber(trgIds.steam:gsub("steam:", ""),16))  .. '\n'
                ,
                ["footer"] = {
                    ["text"] = os.date("%A, %m %B %Y, %X"),
                },
            }
        }
    else
        local srcIds = ExtractIdentifiers(_source)
        local steam = srcIds.steam:gsub("steam:", "")
        local steamDec = tostring(tonumber(steam,16))
        steam = "https://steamcommunity.com/profiles/" .. steamDec
        embed = {
            {
                ["color"] = Config.Colors[data['Color']],
                ["title"] = "**"..data['Title'].."**",
                ["description"] = data['Message'] .. '\n\n'
                .. '**Player name:** ``' .. GetPlayerName(_source) .. '``\n'
                .. '**Player charid:** ``' .. srcIds.charid .. '``\n'
                .. '**Player citizenid:** ``' .. srcIds.citizenid .. '``\n'
                .. '**Player steam:** ' .. steam .. '\n'                ,
                ["footer"] = {
                    ["text"] = os.date("%A, %m %B %Y, %X"),
                },
            }
        }
    end

    return embed
end
