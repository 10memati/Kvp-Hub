local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()


local lt2 = "13822889" -- Lumber Tycoon 2
local lb = "662417684" -- Lucky Blocks
local los = "3101667897" -- Legend of Speed

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
  -- Location
  local LocationParagraph = TeleportTab:AddParagraph("Location", "")

local function UpdateLocation()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        local position = humanoidRootPart.Position
        LocationParagraph:Set("Location: X=" .. position.X .. " Y=" .. position.Y .. " Z=" .. position.Z)
    end
end

game:GetService("RunService").Heartbeat:Connect(UpdateLocation)

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
      Name = "Teleport Timed Blocks",
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

 -- Fly
Tab:AddButton({
    Name = "Fly Gui",
    Callback = function(Value)
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Kvp-Hub/main/fly.lua')))()
  end
})

--
OrionLib:Init()
--

-- Legend Of Speed
elseif tostring(game.placeId) == tostring(los) then
local Window = OrionLib:MakeWindow({Name = "KVP Hub | Legend of Speed ⚡", HidePremium = false, SaveConfig = true, ConfigFolder = "KVP Hub"})

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
  -- Location
  local LocationParagraph = TeleportTab:AddParagraph("Location", "")

local function UpdateLocation()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        local position = humanoidRootPart.Position
        LocationParagraph:Set("Location: X=" .. position.X .. " Y=" .. position.Y .. " Z=" .. position.Z)
    end
end

game:GetService("RunService").Heartbeat:Connect(UpdateLocation)

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
TeleportTab:AddDropdown({
      Name = "Teleport Area",
      Default = nil,
      Options = {}
      Callback = function(Value)
        local targetPosition = Vector3.new()

local player = game.Players.LocalPlayer

if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

    humanoidRootPart.CFrame = CFrame.new(targetPosition)
else
    hata('No such player was found.')
        end
      end
})

--[[ Game Sets
  -- Auto Farm | Speed
GameTab:AddToggle({
     Name = "Auto Speed Farm",
     Default = false,
     Callback = function (Value)
	local toggle = Value
  if toggle then
 while true do
    local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = "Magma City"
  }

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
      wait(2.3)
    end
  end
end
})

  -- Auto Farm | Gem
GameTab:AddToggle({
     Name = "Auto Gem Farm",
     Default = false,
     Callback = function (Value)
	local toggle = Value
  if toggle then
 while true do
    local args = {
    [1] = "collectOrb",
    [2] = "Gem",
    [3] = "Magma City"
  }

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
      wait(2.3)
      end
   end
end
})

  -- Auto Farm | Gem
GameTab:AddToggle({
     Name = "Auto Rebirth",
     Default = false,
     Callback = function (Value)
     local toggle = Value
      if toggle then
       while true do
	 local args = {
    [1] = "rebirthRequest"
}

game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthEvent"):FireServer(unpack(args))
      end
    end
  end
})]]
	
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

 -- Fly
Tab:AddButton({
    Name = "Fly Gui",
    Callback = function(Value)
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Kvp-Hub/main/fly.lua')))()
  end
})

--
OrionLib:Init()
--
--
else
-- Error
hata("This game is not supported by Kvp Hub!")
end
