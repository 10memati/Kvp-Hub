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

Tab:AddTextbox({
    Name = "Hız",
    Default = "20",
    TextDisappear = false,
    Callback = function(Value)
        local s = Value:gsub("[%a]", "")
        local hiz = tonumber(s)
        
        if hiz > 300 then
            hiz = 300
            end
        
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(hiz)
end
})

Tab:AddTextbox({
    Name = "Zıplama Gücü",
    Default = "50",
    Callback = function(Value)
        local s = Value:gsub("[%a]", "")
        local jump = tonumber(s)
        
        if jump > 500 then
            jump = 500
            end
        
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(jump)
    end
})

Tab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        _G.infinjump = Value
    end
})

_G.infinjump = false

local player = game.Players.LocalPlayer
local humanoid = player.Character:FindFirstChild("Humanoid")

player:GetMouse().KeyDown:Connect(function(key)
    if key == "space" and humanoid and (not humanoid:GetStateEnabled(Enum.HumanoidStateType.Seated) or _G.infinjump) then
        humanoid:Move(Vector3.new(0, 10, 0), false)
    end
end)

OrionLib:Init()
