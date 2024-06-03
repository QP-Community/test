local cloneref = cloneref or function(obj) return obj end
local playerService = cloneref(game.FindService(game, 'Players'))
local lplr = playerService.LocalPlayer
local promptService = cloneref(game.FindService(game, 'ProximityPromptService'))
local replicatedStorage = cloneref(game.FindService(game, 'ReplicatedStorage'))

local gui = shared.guilib
local win = shared.window
local tabs = shared.tab
local object = {
    noStatic = tabs.Main.CreateSection('Static'),
    Badges = tabs.Main.CreateSection('Badges'),
    Interaction = tabs.Main.CreateSection('Interaction'),
    Players = tabs.Main.CreateSection('Players')
}

local noStatic = {}
noStatic = object.noStatic.CreateToggle({
    Name = 'Remove Static',
    Function = function(call)
        if call then
            lplr.PlayerGui.Static.Enabled = false
        else
            lplr.PlayerGui.Static.Enabled = true
        end
    end,
    HoverText = 'Remove Static Screen'
})
local getBadges = {}
local badges = {2124868624, 2124868632, 2124878218, 2124885617, 2124885620, 2126252866, 2126252906, 2126862539, 2142412149, 2142925650, 2142925693, 2143226442, 2143226663, 2143253370, 2146786258, 2146786303, 2146786473, 2146786481, 2152241023, 2152310683, 2152353629, 2152720242, 4184741610279588, 4283733429601378, 3929572376955951, 3555249031285945, 3102461615941505, 1102626081197094, 2807169985807423, 3834630482661022}
getBadges = object.Badges.CreateToggle({
    Name = 'Get Badges'
    Function = function()
        for i,v in badges do
            replicatedStorage.award:FireServer(v)
        end
    end,
    HoverText = 'Automatically Get All Badges for you'
})

local InstantInteract = {}
local FireAllProximity = {}
InstantInteract = object.Interaction.CreateToggle({
    Name = 'InstantInteract',
    Function = function(call)
        if call then
            table.insert(InstantInteract.Connections, promptService.PromptButtonHoldBegan:Connect(function(v)
                fireproximityprompt(v)
            end))
        else
            for i,v in InstantInteract.Connections do
                v:Disconnect()
            end
        end
    end,
    HoverText = 'Instant Interact everything'
})
FireAllProximity = object.Interaction.CreateButton({
    Name = 'FireAllPrompt',
    Function = function()
        for i,v in workspace:GetDescendants() do
            if v:IsA("ProximityPrompt") then
                fireproximityprompt(v)
            end
        end
    end
})
local Speed = {}
local oldspeed = lplr.Character.Humanoid.WalkSpeed
local SpeedValue = {Value = 23}
Speed = object.Players.CreateToggle({
    Name = 'Speed',
    Function = function(call)
        if call then
            lplr.Character.Humanoid.WalkSpeed = SpeedValue.Value
        else
            lplr.Character.Humanoid.WalkSpeed = oldspeed
        end
    end,
    HoverText = 'just a normal walkspeed im too lazy'
})
SpeedValue = object.Players.CreateSlider({
    Name = 'Value',
    Min = 1,
    Max = 100,
    Function = function(val)
        SpeedValue.Value = val
    end
})
