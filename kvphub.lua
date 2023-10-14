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
    Default = "100",
    TextDisappear = false,
    Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Value)
end
})

local jumpPowerTextbox = Tab:AddTextbox({
    Name = "Zıplama Gücü",
    Default = "50",
    Callback = function(Value)
        local newJumpPower = tonumber(Value)
        if newJumpPower then
            newJumpPower = math.clamp(newJumpPower, 0, 300)
            humanoid.JumpPower = newJumpPower
            jumpPowerTextbox:Set(tostring(newJumpPower)) -- Metin girişini güncelle
        end
    end
})

OrionLib:Init()
