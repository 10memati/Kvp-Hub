local lb = "662417684" -- Lucky Blocks
local los = "3101667897" -- Legend of Speed
local lt2 = "13822889" -- Lumber Tycoon 2

function hata(text)
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()
OrionLib:MakeNotification({
        Name = "Error",
        Content = text,
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function ok(text)
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()
OrionLib:MakeNotification({
        Name = "Success",
        Content = text,
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

if tostring(game.PlaceId) == tostring(lb) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/10memati/Kvp-Hub/main/games/lucky-blocks.lua"))()
    ok('Successfully loaded for Lucky Blocks!')
elseif tostring(game.PlaceId) == tostring(los) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/10memati/Kvp-Hub/main/games/legendsofspeed.lua"))()
    ok('Successfully loaded for Legends of Speed!')
else
    hata('This game is not supported by KVP Hub!')
end
