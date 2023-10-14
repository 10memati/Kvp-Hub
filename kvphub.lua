local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()

local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
Player.CharacterAdded:Wait()
local hrp = Player.Character:WaitForChild("HumanoidRootPart")
local RunService = game:GetService("RunService")
local KeyFlags = {
    P = false
}

-- Bu bayrak "fly" durumunu belirtir
local isFlying = false

function move(delta)
    Player.Character:WaitForChild("HumanoidRootPart").CFrame *= CFrame.new(Vector3.new(0, 10 * delta, 0))
end

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.P then
            move(1)
            KeyFlags.P = true
        end
    end
end)

UIS.InputEnded:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.P then
        KeyFlags.P = false
    end
end)

local Window = OrionLib:MakeWindow({Name = "KVP Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "KVP Hub"})

local Tab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Player"
})

Tab:AddTextbox({
    Name = "Speed",
    Default = "20",
    TextDisappear = false,
    Callback = function(Value)
        local s = Value:gsub("[%a]", "")
        local hiz = tonumber(s)
        
        if hiz > 300 then
            hiz = 300
            end
           Value = hiz
        
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(hiz)
end
})

Tab:AddTextbox({
    Name = "Jump Power",
    Default = "50",
    Callback = function(Value)
        local s = Value:gsub("[%a]", "")
        local jump = tonumber(s)
        
        if jump > 500 then
            jump = 500
            end

	Value = jump
        
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(jump)
    end
})

Tab:AddToggle({
    Name = "Fly Toggle",
    Default = false, -- Başlangıçta "false" olarak ayarlayın
    Callback = function(Value)
        isFlying = Value
    end
})

RunService.RenderStepped:Connect(function(delta)
    if isFlying and KeyFlags.P then
        -- Eğer "fly" açıksa ve "P" tuşuna basılıysa, hareketi gerçekleştir
        move(1)
    end
    -- Diğer kodlarınızı buraya ekleyin
end)

OrionLib:Init()
