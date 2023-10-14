local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()

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
    Name = "Fly",
    Default = false,
    Callback = function ()
     local toggle = Value
      
      if toggle then
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoid = character:FindFirstChild("Humanoid")

        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            RunService.RenderStepped:Connect(function()
                local forward = humanoid.MoveDirection:PointToWorldSpace(Vector3.new(0, 0, 1))
                character:SetPrimaryPartCFrame(CFrame.new(character.PrimaryPart.Position + forward * 10))
            end)
        end
    end
end
})


OrionLib:Init()
