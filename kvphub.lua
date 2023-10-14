local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/10memati/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "KVP-Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "KVP-Hub"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Section"
})

Tab:AddButton({
	Name = "Sample Button",
	Callback = function()
		print("Button pressed")
	end
})

Tab:AddToggle({
	Name = "Sample Toggle",
	Default = false,
	Callback = function(Value)
		print("Toggle value: " .. tostring(Value))
	end
})

Tab:AddColorpicker({
	Name = "Sample Color Picker",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print("Color Picker value: " .. tostring(Value))
	end
})

Tab:AddSlider({
	Name = "Sample Slider",
	Min = 0,
	Max = 20,
	Default = 5,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "bananas",
	Callback = function(Value)
		print("Slider value: " .. tostring(Value))
	end
})

Tab:AddLabel("Sample Label")

Tab:AddParagraph("Sample Paragraph", "Paragraph Content")

Tab:AddTextbox({
	Name = "Sample Textbox",
	Default = "Default Text",
	TextDisappear = true,
	Callback = function(Value)
		print("Textbox value: " .. tostring(Value))
	end
})

Tab:AddBind({
	Name = "Sample Bind",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
		print("Bind pressed")
	end
})

Tab:AddDropdown({
	Name = "Sample Dropdown",
	Default = "1",
	Options = {"1", "2"},
	Callback = function(Value)
		print("Dropdown value: " .. tostring(Value))
	end
})

OrionLib:Init()
