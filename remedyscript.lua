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
}

local LeftGroupBoxAim = Tabs.Aim:AddLeftGroupbox('Aimbot Settings')

-- Aimbot Toggle
LeftGroupBoxAim:AddToggle('AimbotToggle', {
    Text = 'Enable Aimbot',
    Default = false,
    Tooltip = 'Enable or disable aimbot',
    Callback = function(Value)
        print('[Aimbot] Aimbot enabled:', Value)
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
    Tooltip = 'Adjust the size of the FOV circle',
    Callback = function(Value)
        print('[Aimbot] FOV Size:', Value)
        UpdateFOV() -- Update FOV circle size
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
    FOVCircle.Radius = Tabs.Aim:GetOption('FOVSize').Value
    FOVCircle.Visible = Tabs.Aim:GetOption('ShowFOV').Value
end

-- New Aimbot Logic
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Target = nil
local RightClickHeld = false

local function IsOppositeTeam(Player)
    return Player.Team ~= LocalPlayer.Team
end

local function IsVisible(Part)
    local ScreenPos, OnScreen = Camera:WorldToViewportPoint(Part.Position)
    
    if OnScreen then
        local RayOrigin = Camera.CFrame.Position
        local Direction = (Part.Position - RayOrigin).unit
        local Ray = Ray.new(RayOrigin, Direction * 5000)
        
        local HitPart = workspace:FindPartOnRay(Ray, LocalPlayer.Character, false, true)
        return HitPart and HitPart:IsDescendantOf(Part.Parent)
    end
    
    return false
end

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

local function LockOntoPlayer(Player)
    if Player and Player.Character and Player.Character:FindFirstChild("Head") then
        local Head = Player.Character.Head
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, Head.Position)
    end
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        RightClickHeld = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        RightClickHeld = false
        Target = nil
    end
end)

RunService.RenderStepped:Connect(function()
    if Tabs.Aim:GetOption('AimbotToggle').Value then
        if RightClickHeld then
            if not Target or not Target.Character or not Target.Character:FindFirstChild("Head") or not IsVisible(Target.Character.Head) then
                Target = GetClosestPlayer()
            end

            if Target then
                LockOntoPlayer(Target)
            end
        end
    end
end)

-- Visuals Section
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

local function CreateBox(player)
    if not player.Character then return end

    local Box = Drawing.new("Square")
    Box.Thickness = 2
    Box.Transparency = 1
    Box.Color = Color3.fromRGB(255, 0, 0)
    Box.Filled = false
    
    ESPBoxes[player] = Box

    local function UpdateBox()
        if Tabs.Visuals:GetOption('ToggleBoxes').Value and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
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

local function DrawBoxes()
    if Tabs.Visuals:GetOption('ToggleBoxes').Value then
        for _, player in pairs(game:GetService('Players'):GetPlayers()) do
            if player.Character and not ESPBoxes[player] then
                CreateBox(player)
            end
        end
    end
end

local function RemoveAllBoxes()
    for player, box in pairs(ESPBoxes) do
        if box then
            box:Remove()
        end
        ESPBoxes[player] = nil
    end
end

Tabs.Visuals:GetOption('ToggleBoxes'):OnChanged(function()
    if Tabs.Visuals:GetOption('ToggleBoxes').Value then
        DrawBoxes()
    else
        RemoveAllBoxes()
    end
end)

-- UI Settings
local LeftGroupBoxUI = Tabs['UI Settings']:AddLeftGroupbox('UI Settings')

LeftGroupBoxUI:AddColorPicker('MainColor', {
    Text = 'Main Color',
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Color)
        Library:SetTheme('Main', Color)
    end
})

local function UpdateTheme()
    local theme = Tabs['UI Settings']:GetOption('MainColor').Value
ThemeManager:ApplyTheme('Main', theme)
    end

Tabs[‘UI Settings’]:GetOption(‘MainColor’):OnChanged(UpdateTheme)
