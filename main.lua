return (function(game)
    local gitrequest = function(file)
        return game.HttpGet(game, 'https://raw.githubusercontent.com/QP-Community/test/main/'..scripturl, true)
    end
    if not isfile('theme.lua') then
        writefile('theme.lua', 'Luna')
    end
    local kavo = loadstring(game.HttpGet(game, 'https://raw.githubusercontent.com/NTDCore/NightbedForRoblox/main/Core/kavo.lua'))()
    shared.guilib = kavo
    local win = kavo:CreateWindow({
        Name = 'QP | '.. tostring(game),
        Theme = readfile('theme.lua') or 'Luna'
    })
    local tabs = {
        Main = win.CreateTab('Main'),
        Settings = win.CreateTab('Settings')
    }
    shared.tab = tabs
    local themechanger = tabs.CreateSection('Theme')
    local InfiniteJump = {Enabled = false}
	themechanger.CreateDropdown({
		Name = 'Theme',
        List = {'DarkTheme', 'LightTheme', 'BloodTheme', 'GrapeTheme', 'Ocean', 'Midnight', 'Sentinel', 'Vape', 'Luna', 'Private', 'Synapse', 'Serpent'},
		Function = function(val)
            writefile('theme.lua', val)
		end,
		HoverText = 'Make you can jump any place'
	})
    loadstring(gitrequest(game.. '.lua'))()
end)