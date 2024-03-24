game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'



server_scripts {
    'server.lua',
    'config.lua',
    'adapters/*.lua'
}

escrow_ignore {
  'server.lua',
  'config.lua',
  'adapters/*.lua'
}

lua54 'yes'