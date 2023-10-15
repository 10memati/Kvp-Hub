local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()


local lt2 = "13822889" -- Lumber Tycoon 2
local lb = "662417684" -- Lucky Blocks
local bee = "1537690962" -- Bee Swarm Simulator

function hata(content)
    OrionLib:MakeNotification({
        Name = "Error",
        Content = content,
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

-- Lucky Blocks
if tostring(game.placeId) == tostring(lb) then
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
          hata('No such player was found.')
        end
        
	end
})

  local function UpdatePlayerOptions()
    local players = game.Players:GetPlayers()
    local playerNames = {}
    
    for _, player in pairs(players) do
        table.insert(playerNames, player.Name)
    end

    Dropdown:Refresh(playerNames, true)
end

game.Players.PlayerAdded:Connect(function(player)
    UpdatePlayerOptions()
end)

game.Players.PlayerRemoving:Connect(function(player)
    UpdatePlayerOptions()
end)

UpdatePlayerOptions()

 -- Teleport Area
TeleportTab:AddButton({
      Name = "Teleport Timed Blocks"
      Callback = function(Value)
        local targetPosition = Vector3.new(-1040.6402587890625, 194.44700622558594, 90.80938720703125)

local player = game.Players.LocalPlayer

if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

    humanoidRootPart.CFrame = CFrame.new(targetPosition)
else
    hata('No such player was found.')
        end
      end
})

  -- Location
TeleportTab:AddLabel("Label")
TeleportTab:AddParagraph("Paragraph","Paragraph Content")

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
              Time = 10
          })
    else
        print("HumanoidRootPart bulunamadı.")
    end
else
    print("Karakter bulunamadı.")
        end
        
  	end    
})

--
OrionLib:Init()
--
elseif tostring(game.placeId) == tostring(bee) then
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
