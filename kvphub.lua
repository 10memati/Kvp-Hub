local lt2 = "13822889"
local lb = "662417684"

if tonumber(game.placeId) == tonumber(lb) then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KVP Hub | ❓ Lucky Blocks Battleground", HidePremium = false, SaveConfig = true, ConfigFolder = "KVP Hub"})

local Tab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
	
local GameTab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = luckyblock:AddSection({
	Name = "Game"
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

local InfiniteJumpEnabled = false

Tab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        InfiniteJumpEnabled = Value
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

local players = game:GetService("Players"):GetPlayers()
local playerNames = {}

for _, player in pairs(players) do
    table.insert(playerNames, player.Name)
end

Tab:AddButton({
	Name = "Tp Tool",
	Callback = function()
      		mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Tp Tool (Click)"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
  	end    
})

local Noclip = true
local ToggleNoclip = false
--[[
Tab:AddToggle({
    Name = "Noclip Toggle",
    default = false,
    Callback = function(Value)
        ToggleNoclip = Value
    end
})
--]]

Tab:AddButton({
    Name = "ESP",
    Callback = function(Value)
	loadstring(game:HttpGet('https://raw.githubusercontent.com/10memati/Kvp-Hub/main/esp.lua'))()
    end
})

OrionLib:Init() 
else 
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = game.placeId, -- Required
	Text = "This game is not supported by Kvp-Hub!", -- Required
	Icon = "rbxassetid://1234567890" -- Optional
})
end
