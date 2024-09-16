

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
    ['UI Settings'] = Window:AddTab('UI Settings')
}

local LeftGroupBoxAim = Tabs.Aim:AddLeftGroupbox('Aimbot Settings')

-- Aimbot Toggles
LeftGroupBoxAim:AddToggle('AimbotToggle', {
    Text = 'Enable Aimbot',
    Default = false,
    Tooltip = 'Enable or disable aimbot',
    Callback = function(Value)
        print('[Aimbot] Aimbot enabled:', Value)
    end
})

LeftGroupBoxAim:AddToggle('ShowFOV', {
    Text = 'Show FOV Circle',
    Default = false,
    Tooltip = 'Shows the FOV circle for aimbot',
    Callback = function(Value)
        print('[Aimbot] Show FOV:', Value)
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
        print('[Aimbot] FOV Size:', Value)
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
        print('[Aimbot] Smoothness set to:', Value)
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

-- Aimbot Logic (with FOV, Smoothness, Visibility, and Right Click)
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
                local screenPoint, onScreen = camera:WorldToViewportPoint(playerPos)

                if onScreen then
                    local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)).Magnitude
                    if (not Toggles.ShowFOV.Value or distance < Options.FOVSize.Value) and distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end

    if closestPlayer then
        local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
        local currentPosition = camera.CFrame.Position
        local newPosition = currentPosition:Lerp(targetPosition, Options.AimbotSmoothness.Value / 100)

        camera.CFrame = CFrame.new(newPosition, closestPlayer.Character.HumanoidRootPart.Position)
        print('[Aimbot] Aiming at', closestPlayer.Name)
    end
end

-- ESP Section
local LeftGroupBoxVisuals = Tabs.Visuals:AddLeftGroupbox('Visuals Settings')

LeftGroupBoxVisuals:AddToggle('ToggleBoxes', {
    Text = 'Toggle Enemy Boxes (ESP)',
    Default = false,
    Tooltip = 'Draw boxes around enemies',
    Callback = function(Value)
        print('[Visuals] Drawing boxes:', Value)
    end
})

local ESPBoxes = {}

local function CreateBox(player)
    if not player.Character then return end

    local Box = Drawing.new("Square")
    Box.Thickness = 2
    Box.Transparency = 1
    Box.Color = Color3.fromRGB(255, 0, 0)
    Box.Filled = false
    
    ESPBoxes[player] = Box

    local function UpdateBox()
        if Toggles.ToggleBoxes.Value and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local rootPart = player.Character.HumanoidRootPart
            local rootPos, onScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)
            if onScreen then
                local sizeY = (game.Workspace.CurrentCamera:WorldToViewportPoint((rootPart.CFrame * CFrame.new(0, 3, 0)).p) - game.Workspace.CurrentCamera:WorldToViewportPoint((rootPart.CFrame * CFrame.new(0, -3, 0)).p)).Magnitude
                local sizeX = sizeY * 0.6
                Box.Size = Vector2.new(sizeX, sizeY)
                Box.Position = Vector2.new(rootPos.X - Box.Size.X / 2, rootPos.Y - Box.Size.Y / 2)
                Box.Visible = player.Team ~= game.Players.LocalPlayer.Team
            else
                Box.Visible = false
            end
        else
            Box.Visible = false
        end
    end

    game:GetService("RunService").RenderStepped:Connect(UpdateBox)

    -- Update ESP after respawn
    player.CharacterAdded:Connect(function(character)
        ESPBoxes[player] = Box
    end)

    player.CharacterRemoving:Connect(function()
        if ESPBoxes[player] then
            ESPBoxes[player]:Remove()
            ESPBoxes[player] = nil
        end
    end)
end

local function DrawBoxes()
    if Toggles.ToggleBoxes.Value then
        for _, player in pairs(game:GetService('Players'):GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Team ~= game.Players.LocalPlayer.Team then
                CreateBox(player)
            end
                end
else
    for _, box in pairs(ESPBoxes) do
        box:Remove()
    end
    ESPBoxes = {}
end
        end
else
    for _, box in pairs(ESPBoxes) do
        box:Remove()
    end
    ESPBoxes = {}
end

end

Toggles.ToggleBoxes:OnChanged(DrawBoxes)

game.Players.PlayerAdded:Connect(function(player)
player.CharacterAdded:Connect(function()
if Toggles.ToggleBoxes.Value then
CreateBox(player)
end
end)
end)

game.Players.PlayerRemoving:Connect(function(player)
if ESPBoxes[player] then
ESPBoxes[player]:Remove()
ESPBoxes[player] = nil
end
end)

– Misc Tab - Camera FOV Slider
local LeftGroupBoxMisc = Tabs.Misc:AddLeftGroupbox(‘Miscellaneous’)

LeftGroupBoxMisc:AddSlider(‘CameraFOV’, {
Text = ‘Camera FOV’,
Default = 70,
Min = 60,
Max = 120,
Suffix = ‘°’,
Rounding = 0,
Tooltip = ‘Adjust the field of view for the camera’,
Callback = function(Value)
game.Workspace.CurrentCamera.FieldOfView = Value
print(’[Misc] Camera FOV set to:’, Value)
end
})

– UI Settings
local MenuGroup = Tabs[‘UI Settings’]:AddLeftGroupbox(‘Menu’)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

ThemeManager:SetFolder(‘MyScriptHub’)
SaveManager:SetFolder(‘MyScriptHub/specific-game’)

SaveManager:BuildConfigSection(Tabs[‘UI Settings’])

ThemeManager:ApplyToTab(Tabs[‘UI Settings’])

– ESP Box Constantly Updated
game:GetService(“RunService”).RenderStepped:Connect(Aimbot)
