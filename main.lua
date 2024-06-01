return (function(games)
    if not isfile('theme.lua') then
        writefile('theme.lua', 'Luna')
    end
    local kavo = loadstring(game.HttpGet(game, 'https://raw.githubusercontent.com/MaxlaserTechAlt/funny-script/main/core/gui.lua'))()
    local themes = shared.kavothemes
    shared.guilib = kavo
    local win = kavo:CreateWindow({
        Name = 'QP | '.. games,
        Theme = readfile('theme.lua') or 'Luna'
    })
    local tabs = {
        Main = win.CreateTab('Main'),
        Settings = win.CreateTab('Settings')
    }
    shared.tab = tabs
    local themechanger = tabs.Settings.CreateSection('Theme')
	themechanger.CreateDropdown({
		Name = 'Theme',
        List = {'DarkTheme', 'LightTheme', 'BloodTheme', 'GrapeTheme', 'Ocean', 'Midnight', 'Sentinel', 'Vape', 'Luna', 'Private', 'Synapse', 'Serpent'},
		Function = function(val)
            writefile('theme.lua', val)
            for i,v in themes[val] do
                kavo:ChangeColor(v)
            end
		end,
		HoverText = 'keep changing it buddy!'
	})
    return loadstring(game.HttpGet('https://raw.githubusercontent.com/QP-Community/test/main/modules/'.. games .. '.lua'))()
end)