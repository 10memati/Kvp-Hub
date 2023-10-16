local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()

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

local function FormatLocation(position)
    local x = math.floor(position.X)
    local y = math.floor(position.Y)
    local z = math.floor(position.Z)
    return string.format("%d, %d, %d", x, y, z)
end

local function UpdateLocation()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        local position = humanoidRootPart.Position
        local formattedLocation = FormatLocation(position)
        LocationParagraph:Set("Location: " .. formattedLocation)
    end
end

game:GetService("RunService").Heartbeat:Connect(UpdateLocation)
local players = game.Players:GetPlayers()
    local playerNames = {}
    
    for _, player in pairs(players) do
        table.insert(playerNames, player.Name)
    end

  -- Teleport Player  
  local Dropdown = TeleportTab:AddDropdown({
	Name = "Teleport To Player",
	Default = nil,
	Options = playerNames,
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

 --[[ Teleport Area
TeleportTab:AddDropdown({
      Name = "Teleport Area",
      Default = "City",
      Options = {"City"}
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