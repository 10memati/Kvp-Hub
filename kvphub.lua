local lt2 = "13822889" -- Lumber Tycoon 2
local lb = "662417684" -- Lucky Blocks
local bee = "1537690962" -- Bee Swarm Simulator

-- Lucky Blocks
if tostring(game.placeId) == tostring(lb) then
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

local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local TeleportSection = TeleportTab:AddSection({
    Name = "Teleport"
})

  
-- Teleport Sets
  -- Teleport Player  
  local Dropdown = TeleportTab:AddDropdown({
	Name = "Teleport To Player",
	Default = nil,
	Options = {},
	Callback = function(Value)
		local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local hedefOyuncuAdi = Value

local oyuncu = game.Players.LocalPlayer

local hedefOyuncu = Players:FindFirstChild(hedefOyuncuAdi)

if hedefOyuncu then
    local hedefPozisyon = hedefOyuncu.Character.HumanoidRootPart.CFrame.p
    oyuncu.Character:SetPrimaryPartCFrame(CFrame.new(hedefPozisyon))
else
          OrionLib:MakeNotification({
              Name = "Error",
              Content = "No such player was found.",
              Image = "rbxassetid://4483345998",
              Time = 5
          })
        end
        
	end
})

  local function UpdatePlayerOptions()
    local players = game.Players:GetPlayers()
    local playerNames = {}
    
    for _, player in pairs(players) do
        table.insert(playerNames, player.Name)
    end

    Dropdown:Refresh(playerNames, false)
end

game.Players.PlayerAdded:Connect(function(player)
    UpdatePlayerOptions()
end)

game.Players.PlayerRemoving:Connect(function(player)
    UpdatePlayerOptions()
end)

UpdatePlayerOptions()
-- Game Sets
  -- Blocks
GameTab:AddButton({
    Name = "Lucky Block",
    Callback = function(Value)
	game:GetService("ReplicatedStorage"):WaitForChild("SpawnLuckyBlock"):FireServer()
  end
})

GameTab:AddButton({
    Name = "Super Block",
    Callback = function(Value)
	game:GetService("ReplicatedStorage"):WaitForChild("SpawnSuperBlock"):FireServer()
  end
})

GameTab:AddButton({
    Name = "Diamond Block",
    Callback = function(Value)
	game:GetService("ReplicatedStorage"):WaitForChild("SpawnDiamondBlock"):FireServer()
  end
})

GameTab:AddButton({
    Name = "Rainbow Block",
    Callback = function(Value)
	game:GetService("ReplicatedStorage"):WaitForChild("SpawnRainbowBlock"):FireServer()
  end
})

GameTab:AddButton({
    Name = "Galaxy Block",
    Callback = function(Value)
	game:GetService("ReplicatedStorage"):WaitForChild("SpawnGalaxyBlock"):FireServer()
  end
})
  
GameTab:AddButton({
    Name = "Void Block",
    Callback = function(Value)
    local rainbow = 2
    local galaxy = 3
        
 for i = 1, galaxy do
	game:GetService("ReplicatedStorage"):WaitForChild("SpawnGalaxyBlock"):FireServer()
    end
  for i = 1, rainbow do
	game:GetService("ReplicatedStorage"):WaitForChild("SpawnRainbowBlock"):FireServer()
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


  Tab:AddButton({
	Name = "Konum",
	Callback = function()
local player = game.Players.LocalPlayer -- Oyuncunun nesnesini alır
local character = player.Character -- Oyuncunun karakter nesnesini alır

if character then
    local rootPart = character:FindFirstChild("HumanoidRootPart") -- Karakterin HumanoidRootPart nesnesini arar

    if rootPart then
        local position = rootPart.Position
        local x, y, z = position.X, position.Y, position.Z
        OrionLib:MakeNotification({
              Name = "Error",
              Content = "X: " .. x .. " Y: " .. y .. "Z: " .. z,
              Image = "rbxassetid://4483345998",
              Time = 5
          })
    else
        print("HumanoidRootPart bulunamadı.")
    end
else
    print("Karakter bulunamadı.")
        end
        
  	end    
})

  
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
elseif tostring(game.placeId) == tostring(psx) then
   local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KVP Hub | Bee Swarm Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "KVP Hub"})

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
