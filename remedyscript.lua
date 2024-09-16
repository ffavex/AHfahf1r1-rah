local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Remedy.ez | Spyware Injecting',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Aim = Window:AddTab('Aim'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),  -- New Misc Tab
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBoxAim = Tabs.Aim:AddLeftGroupbox('Aimbot Settings')

-- Aimbot Toggles
LeftGroupBoxAim:AddToggle('AimbotToggle', {
    Text = 'Enable Aimbot',
    Default = false,
    Tooltip = 'Enable or disable aimbot',
    Callback = function(Value)
        -- Removed prints
    end
})

LeftGroupBoxAim:AddToggle('ShowFOV', {
    Text = 'Show FOV Circle',
    Default = false,
    Tooltip = 'Shows the FOV circle for aimbot',
    Callback = function(Value)
        -- Removed prints
    end
})

LeftGroupBoxAim:AddSlider('FOVSize', {
    Text = 'FOV Size',
    Default = 100,
    Min = 50,
    Max = 500,
    Suffix = 'px',
    Rounding = 0,
    Compact = false,
    HideMax = false,
    Tooltip = 'Adjust the size of the FOV for the aimbot',
    Callback = function(Value)
        -- Removed prints
    end
})

LeftGroupBoxAim:AddSlider('AimbotSmoothness', {
    Text = 'Aimbot Smoothness',
    Default = 5,
    Min = 1,
    Max = 20,
    Suffix = '',
    Rounding = 1,
    Compact = false,
    HideMax = false,
    Tooltip = 'Controls how smooth the aimbot snaps to targets',
    Callback = function(Value)
        -- Removed prints
    end
})

-- FOV Circle Drawing
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Transparency = 1
FOVCircle.Color = Color3.fromRGB(0, 255, 0)
FOVCircle.Filled = false
FOVCircle.Visible = false

-- Update the FOV Circle around the mouse
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
local rightClick
