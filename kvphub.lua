local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "KVP Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "KVP Hub"})

local Tab = Window:MakeTab({
	Name = "Oyuncu",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Player"
})

local speedTextbox = Tab:AddTextbox({
    Name = "Hız",
    Default = "100", 
    TextDisappear = false,
    Callback = function(Value)
        local newSpeed = tonumber(Value)
        if newSpeed then
            humanoid.WalkSpeed = newSpeed
        end
    end
})

OrionLib:Init()
