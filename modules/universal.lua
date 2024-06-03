cloneref = cloneref or function(obj) return obj end
playerService = cloneref(game.FindService(game, 'Players'))
lplr = playerService.LocalPlayer
promptService = cloneref(game:FindService('ProximityPromptService'))
replicatedStorage = cloneref(game:FindService('ReplicatedStorage'))

gui = loadstring(game.HttpGet(game, 'https://raw.githubusercontent.com/MaxlaserTechAlt/funny-script/main/core/gui.lua'))()
win = gui:CreateWindow({
    Name = 'QP Scripts',
    Theme = game.FindService(game, 'HttpService'):JSONEncode(readfile('QP/theme.json').theme) or 'Luna'
})
tabs = {
    Main = win.CreateTab('Main'),
    Settings = win.CreateTab('Settings')
}
shared.gui = gui
shared.win = win
shared.tabs = tabs

local theme = {
    theme = ''
}
themechanger = tabs.Settings.CreateSection('Theme')
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