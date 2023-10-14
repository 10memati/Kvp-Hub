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

local Section = Tab:AddSection({
 Name = "Player"
})

local GameTab = Window:MakeTab({
    Name = "Game",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local GameSection = GameTab:AddSection({
    Name = "Game"
})

GameTab:AddDropdown({
    Name = "Open Block",
    Default = nil,
    Options = {"Lucky Block", "Super Block", "Diamond Block", "Rainbow Block", "Galaxy Block"},
    Callback = function(Value)
        local blockActions = {
            ["lucky block"] = function()
                game:GetService("ReplicatedStorage"):WaitForChild("SpawnLuckyBlock"):FireServer()
            },
            ["super block"] = function()
                game:GetService("ReplicatedStorage"):WaitForChild("SpawnSuperBlock"):FireServer()
            },
            ["diamond block"] = function()
                game:GetService("ReplicatedStorage"):WaitForChild("SpawnDiamondBlock"):FireServer()
            },
            ["rainbow block"] = function()
                game:GetService("ReplicatedStorage"):WaitForChild("SpawnRainbowBlock"):FireServer()
            },
            ["galaxy block"] = function()
                game:GetService("ReplicatedStorage"):WaitForChild("SpawnGalaxyBlock"):FireServer()
            }
        }

        local block = Value:lower():gsub("^%s*(.-)%s*$", "%1")
        local action = blockActions[block]

        if action then
            action()
        else
            print("Invalid block selection")
        end
    end
})

-- Player Sets
  -- Speed
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

  -- Jump Power
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

  -- Infinite Jump
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

--[[
	--All Server Players
local players = game:GetService("Players"):GetPlayers()
local playerNames = {}

for _, player in pairs(players) do
    table.insert(playerNames, player.Name)
end
--]]

  -- Tp Tool
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
	
--[[
local Noclip = true
local ToggleNoclip = false
Tab:AddToggle({
    Name = "Noclip Toggle",
    default = false,
    Callback = function(Value)
        ToggleNoclip = Value
    end
})
--]]

  -- Esp
Tab:AddButton({
    Name = "ESP",
    Callback = function(Value)
	loadstring(game:HttpGet('https://raw.githubusercontent.com/10memati/Kvp-Hub/main/esp.lua'))()
    end
})

--
OrionLib:Init() 
	
else 
-- Error
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = 'Error', -- Required
	Text = "This game is not supported by Kvp-Hub!", -- Required
	Icon = "rbxassetid://1234567890" -- Optional
})
end
