-- Load necessary libraries
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Example Menu',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Aim = Window:AddTab('Aim'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
    Misc = Window:AddTab('Misc')  -- Added Misc tab for the FOV slider
}

-- Aimbot Settings
local LeftGroupBoxAim = Tabs.Aim:AddLeftGroupbox('Aimbot Settings')

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

local function UpdateFOV()
    FOVCircle.Position = Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X / 2, game.Workspace.CurrentCamera.ViewportSize.Y / 2)
    FOVCircle.Radius = Options.FOVSize.Value
    FOVCircle.Visible = Toggles.ShowFOV.Value
end

-- Aimbot Logic (with FOV and Smoothness)
local function Aimbot()
    if not Toggles.AimbotToggle.Value then return end

    local camera = game.Workspace.CurrentCamera
    local localPlayer = game.Players.LocalPlayer
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild('Humanoid') and player.Character.Humanoid.Health > 0 and player.Team ~= localPlayer.Team then
            local playerPos = player.Character.HumanoidRootPart.Position
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

    if closestPlayer then
        local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
        local currentPosition = camera.CFrame.Position
        local newPosition = currentPosition:Lerp(targetPosition, Options.AimbotSmoothness.Value / 100)

        camera.CFrame = CFrame.new(newPosition, closestPlayer.Character.HumanoidRootPart.Position)
        print('[Aimbot] Aiming at', closestPlayer.Name)
    end
end

-- Continuously check for the aimbot toggle and execute logic
Toggles.AimbotToggle:OnChanged(function()
    if Toggles.AimbotToggle.Value then
        print('[Aimbot] Aimbot activated')
        game:GetService('RunService').Stepped:Connect(Aimbot)
    else
        print('[Aimbot] Aimbot deactivated')
    end
end)

-- ESP Section
local LeftGroupBoxVisuals = Tabs.Visuals:AddLeftGroupbox('Visuals Settings')

-- Visuals Toggle for boxes around enemies
LeftGroupBoxVisuals:AddToggle('ToggleBoxes', {
    Text = 'Toggle Enemy Boxes (ESP)',
    Default = false,
    Tooltip = 'Draw boxes around enemies',
    Callback = function(Value)
        print('[Visuals] Drawing boxes:', Value)
    end
})

-- ESP Boxes
local ESPBoxes = {}

-- Function to create ESP boxes around players
local function CreateBox(player)
    if not player.Character then return end

    local Box = Drawing.new("Square")
    Box.Thickness = 2
    Box.Transparency = 1
    Box.Color = Color3.fromRGB(255, 0, 0) -- Red for enemies
    Box.Filled = false
    
    ESPBoxes[player] = Box

    local function UpdateBox()
        if Toggles.ToggleBoxes.Value and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player.Team ~= game.Players.LocalPlayer.Team then
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

    player.CharacterRemoving:Connect(function()
        if ESPBoxes[player] then
            ESPBoxes[player]:Remove()
            ESPBoxes[player] = nil
        end
    end)
end

-- Function to handle ESP for players
local function DrawBoxes()
    if Toggles.ToggleBoxes.Value then
        for _, player in pairs(game:GetService('Players'):GetPlayers()) do
            if player.Character and not ESPBoxes[player] then
                CreateBox(player)
            end
        end
    end
end

-- Function to remove all ESP boxes
local function RemoveAllBoxes()
    for player, box in pairs(ESPBoxes) do
        if box then
            box:Remove()
        end
        ESPBoxes[player] = nil
    end
end

-- Toggle to handle ESP on/off
Toggles.ToggleBoxes:OnChanged(function()
    if Toggles.ToggleBoxes.Value then
        print('[Visuals] Box ESP enabled')
        DrawBoxes()
    else
        print('[Visuals] Box ESP disabled')
        RemoveAllBoxes()
    end
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)

MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu Bind' })

ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- Miscellaneous Tab for FOV Slider
local LeftGroupBoxMisc = Tabs.Misc:AddLeftGroupbox('Miscellaneous')

-- FOV Slider for Camera
LeftGroupBoxMisc:AddSlider('CameraFOV', {
    Text = 'Camera FOV',
    Default = 90,
    Min = 60,
    Max = 120,
    Suffix = '°',
    Rounding = 0,
    Compact = false,
    HideMax = false,
    Tooltip = 'Adjust the camera field of view',
    Callback = function(Value)
        game.Workspace.CurrentCamera.FieldOfView = Value
        print('[Misc] Camera FOVset to:’, Value)
end
})

– Ensure the menu is visible
Window:Show()

– Debug message
print(“Menu loaded successfully.”)


            
