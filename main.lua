return (function(name)
    local githubrequest = function(url)
        return game.HttpGet(game, 'https://raw.githubusercontent.com/QP-Community/test/main/modules/'.. url, true)
    end
    shared.universal = false
    if not isfolder('QP') then
        makefolder('QP')
    end
    if not isfolder('QP/modules') then
        makefolder('QP/modules')
    end
    if not isfolder('QP/settings') then
        makefolder('QP/settings')
    end
    if not isfile('QP/theme.json') then
        writefile('QP/theme.json', '')
    end
    print(name)
    task.spawn(function()
        loadstring(githubrequest('universal.lua'))()
        repeat task.wait() until shared.universal
        if name == 'universal' then return nil end
        loadstring(githubrequest(tostring(name)))()
    end)
end)