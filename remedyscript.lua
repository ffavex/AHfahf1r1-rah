local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Remedy.ez | Private User',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Aim = Window:AddTab('Aim'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBoxAim = Tabs.Aim:AddLeftGroupbox('Aimbot Settings')

-- Aimbot Toggles
LeftGroupBoxAim:AddToggle('AimbotToggle', {
    Text = 'Enable Aimbot',
    Default = false,
    Tooltip = 'Enable or disable aimbot',
})

LeftGroupBoxAim:AddToggle('ShowFOV', {
    Text = 'Show FOV Circle',
    Default = false,
    Tooltip = 'Shows the FOV circle for aimbot',
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
})

-- Misc Tab and FOV Slider
local LeftGroupBoxMisc = Tabs.Misc:AddLeftGroupbox('Misc Settings')

LeftGroupBoxMisc:AddSlider('CameraFOV', {
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
    end,
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
    FOVCircle.Radius = LeftGroupBoxAim:GetSlider('FOVSize').Value
    FOVCircle.Visible = LeftGroupBoxAim:GetToggle('ShowFOV').Value
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

-- New Aimbot Logic
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Target = nil
local RightClickHeld = false

-- Function to check if a player is on the opposite team
local function IsOppositeTeam(Player)
    return Player.Team ~= LocalPlayer.Team
end

-- Function to check if the player is visible
local function IsVisible(Part)
    local ScreenPos, OnScreen = Camera:WorldToViewportPoint(Part.Position)
    
    if OnScreen then
        local RayOrigin = Camera.CFrame.Position
        local Direction = (Part.Position - RayOrigin).unit
        local Ray = Ray.new(RayOrigin, Direction * 5000)  -- Max ray distance
        
        local HitPart = workspace:FindPartOnRay(Ray, LocalPlayer.Character, false, true)
        return HitPart and HitPart:IsDescendantOf(Part.Parent)
    end
    
    return false
end

-- Function to get the closest visible enemy player
local function GetClosestPlayer()
    local ClosestPlayer = nil
    local ClosestDistance = math.huge

    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and IsOppositeTeam(Player) and Player.Character and Player.Character:FindFirstChild("Head") then
            local Head = Player.Character.Head
            local ScreenPos, OnScreen = Camera:WorldToViewportPoint(Head.Position)

            if OnScreen and IsVisible(Head) then
                local MousePos = UserInputService:GetMouseLocation()
                local Distance = (Vector2.new(ScreenPos.X, ScreenPos.Y) - MousePos).magnitude
                
                if Distance < ClosestDistance then
                    ClosestDistance = Distance
                    ClosestPlayer = Player
                end
            end
        end
    end
    
    return ClosestPlayer
end

-- Function to lock onto the closest enemy player's head
local function LockOntoPlayer(Player)
    if Player and Player.Character and Player.Character:FindFirstChild("Head") then
        local Head = Player.Character.Head
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, Head.Position)
    end
end

-- Main loop to check for the closest player and lock onto them if the conditions are met
RunService.RenderStepped:Connect(function()
    if rightClickHeld and LeftGroupBoxAim:GetToggle('AimbotToggle').Value then
        if not Target or not Target.Character or not Target.Character:FindFirstChild("Head") or not IsVisible(Target.Character.Head) then
            Target = GetClosestPlayer()
        end

        if Target then
            LockOntoPlayer(Target)
        end
    end
end)

-- ESP Section
local LeftGroupBoxVisuals = Tabs.Visuals:AddLeftGroupbox('Visuals Settings')

LeftGroupBoxVisuals:AddToggle('ToggleBoxes', {
    Text = 'Toggle Enemy Boxes (ESP)',
    Default = false,
    Tooltip = 'Draw boxes around enemies',
})

local ESPBoxes = {}
local UpdateInterval = 0.1 -- Time in seconds between updates
local lastUpdateTime = tick()

local function CreateBox(player)
    if not player.Character then return end

    local Box = Drawing.new("Square")
    Box.Thickness = 2
    Box.Transparency = 1
    Box.Color = Color3.fromRGB(255, 0, 0)
    Box.Filled = false

    ESPBoxes[player] = Box

    local function UpdateBox()
        if LeftGroupBoxVisuals:GetToggle('ToggleBoxes').Value and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
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
        if LeftGroupBoxVisuals:GetToggle('ToggleBoxes').Value then
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
