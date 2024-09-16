local Logging = 'https://raw.githubusercontent.com/ffavex/AHfahf1r1-rah/main/execution.lua'
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({


    Title = 'Remedy',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})


local Tabs = {

    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

function BoxESP.Create(Player)
	local Box = Drawing.new("Square")
	Box.Visible = false
	Box.Color = Color3.fromRGB(194, 17, 17)
	Box.Filled = false
	Box.Transparency = 0.50
	Box.Thickness = 3

	local Updater

	local function UpdateBox()
		if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
			local Target2dPosition, IsVisible = workspace.CurrentCamera:WorldToViewportPoint(Player.HumanoidRootPart.Position)
			local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(workspace.CurrentCamera.FieldOfView * 0.5)) * 2) * 100
			local width, height = math.floor(40 * scale_factor), math.floor(62 * scale_factor)

			Box.Visible = IsVisible
			Box.Size = Vector2.new(width, height)
			Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)
		else
			Box.Visible = false
			if not Player then
				Box:Remove()
				Updater:Disconnect()
			end
		end
	end

	Updater = game:GetService("RunService").RenderStepped:Connect(UpdateBox)

	return Box
end

local Boxes = {}

local function EnableBoxESP()
	for _, Player in pairs(game:GetService("Workspace"):GetChildren()) do
		if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
			local Box = BoxESP.Create(Player)
			table.insert(Boxes, Box)
		end
	end
end

game.Workspace.DescendantAdded:Connect(function(i)
	if i:IsA("Model") and i:FindFirstChild("HumanoidRootPart") and i:FindFirstChild("Head") then
		local Box = BoxESP.Create(i)
		table.insert(Boxes, Box)
	end
end)

EnableBoxESP()

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind 


ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('Remedy')
SaveManager:SetFolder('Remedy/Trident-Survival')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()