# murphy_discordlogs
# How to use
```lua
local data = {
        ['Player'] = nil, -- Set a source
        ['Target'] = nil, -- Set a source
        ['Log'] = 'default', -- Log name in Config.Logs
        ['Title'] = 'Title',
        ['Message'] = 'Message',
        ['Color'] = 'blue', -- Color name in Config.Colors
    }

TriggerEvent('murphy_discordlogs:SendLog', data)
```
