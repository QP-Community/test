local gui = loadstring(game.HttpGet(game, 'https://raw.githubusercontent.com/MaxlaserTechAlt/funny-script/main/core/gui.lua'))()
local win = gui:CreateWindow({
    Name = 'QP Script',
    Theme = game.FindService(game, 'HttpService'):JSONEncode(readfile('QP/theme.json').theme) or 'Luna'
})
local tabs = {
    Main = win.CreateTab('Main'),
    Settings = win.CreateTab('Settings')
}
shared.gui = gui
shared.win = win
shared.tabs = tabs

local theme = {
    theme = ''
}
local themechanger = tabs.Settings.CreateSection('Theme')
themechanger.CreateDropdown({
    Name = 'Theme',
    List = {'DarkTheme', 'LightTheme', 'BloodTheme', 'GrapeTheme', 'Ocean', 'Midnight', 'Sentinel', 'Vape', 'Luna', 'Private', 'Synapse', 'Serpent'},
    Function = function(val)
        theme = val
        writefile('QP/theme.json', game.FindService(game, 'HttpService'):JSONEncode(theme))
    end,
    HoverText = 'keep changing it buddy!'
})

task.spawn(function()
    shared.universal = true
end)