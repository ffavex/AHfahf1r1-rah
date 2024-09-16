

-- Load necessary libraries
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
    Misc = Window:AddTab('Misc')
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
    Tooltip = 'Shows the FOV circle around the cursor',
    Callback = function(Value)
        print('[Aimbot] Show FOV:', Value)
        FOVCircle.Visible = Value
    end
})

-- FOV Size Slider
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

-- Aimbot Smoothness Slider
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

-- Camera FOV Slider
Tabs.Misc:AddLeftGroupbox('Camera Settings'):AddSlider('CameraFOV', {
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
        print('[Misc] Camera FOV set to:', Value)
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
    local mouse = game.Players.LocalPlayer:GetMouse()
    FOVCircle.Position = Vector2.new(mouse.X, mouse.Y)
    FOVCircle.Radius = LeftGroupBoxAim:FindFirstChild('FOVSize').Value
end

-- Aimbot Logic (with FOV and Smoothness)
local function Aimbot()
    if not LeftGroupBoxAim:FindFirstChild('AimbotToggle').Value then return end

    local camera = game.Workspace.CurrentCamera
    local localPlayer = game.Players.LocalPlayer
    local closestPlayer = nil
    local shortestDistance = math.huge
    local mouse = game.Players.LocalPlayer:GetMouse()
    local fovRadius = LeftGroupBoxAim:FindFirstChild('FOVSize').Value

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild('Humanoid') and player.Character.Humanoid.Health > 0 then
            local playerTeam = player.Team
            local localPlayerTeam = localPlayer.Team
            if playerTeam and localPlayerTeam and playerTeam == localPlayerTeam then
                -- Only aim at players on the opposite team
                local playerPos = player.Character.HumanoidRootPart.Position
                local screenPoint, onScreen = camera:WorldToViewportPoint(playerPos)

                if onScreen then
                    local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                    if distance < fovRadius and distance < shortestDistance then
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
        local newPosition = currentPosition:Lerp(targetPosition, LeftGroupBoxAim:FindFirstChild('AimbotSmoothness').Value / 100)

        camera.CFrame = CFrame.new(newPosition, closestPlayer.Character.HumanoidRootPart.Position)
        print('[Aimbot] Aiming at', closestPlayer.Name)
    end
end

-- Continuously check for the aimbot toggle and execute logic
LeftGroupBoxAim:FindFirstChild('AimbotToggle').OnChanged(function()
    if LeftGroupBoxAim:FindFirstChild('AimbotToggle').Value then
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
        if LeftGroupBoxVisuals:FindFirstChild('ToggleBoxes').Value and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
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
    if LeftGroupBoxVisuals:FindFirstChild('ToggleBoxes').Value then
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
        ESPBoxes[player] =nil
end
end

– Monitor players and update ESP boxes
game:GetService(‘Players’).PlayerAdded:Connect(function(player)
player.CharacterAdded:Connect(function()
DrawBoxes()
end)
end)

game:GetService(‘Players’).PlayerRemoving:Connect(RemoveAllBoxes)

– Update FOV Circle continuously
game:GetService(‘RunService’).RenderStepped:Connect(UpdateFOV)
