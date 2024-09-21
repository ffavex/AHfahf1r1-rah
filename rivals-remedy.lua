--// super trash RIVALS esp 

local settings = {
    enabled = true,
    teamCheck = false,
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local wtf = {}

function esp(player)
    if not settings.enabled then return end
    if settings.teamCheck and player.Team == Players.LocalPlayer.Team then return end
    if player == Players.LocalPlayer then return end

    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local Box = Drawing.new("Square")
    Box.Color = Color3.new(1, 0, 0)
    Box.Thickness = 2
    Box.Transparency = 1
    Box.Filled = false

    local tracer = Drawing.new("Line")
    tracer.Color = Color3.new(1, 0, 0)
    tracer.Thickness = 1
    tracer.Transparency = 1

    local name = Drawing.new("Text")
    name.Text = player.Name
    name.Color = Color3.new(1, 1, 1)
    name.Size = 20
    name.Center = true
    name.Outline = true
    name.Transparency = 1

    wtf[player] = {box = Box, tracer = tracer, name = name}

    local function loop()
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            Box.Visible = false
            tracer.Visible = false
            name.Visible = false
            return
        end

        local hrpPosition, onScreen = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position)
        if onScreen then
            local top = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position + Vector3.new(0, 3, 0))
            local bottom = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position - Vector3.new(0, 3, 0))
            local size = Vector2.new(math.abs(top.X - bottom.X) * 1.5, math.abs(top.Y - bottom.Y) * 1.5)
            Box.Size = size
            Box.Position = Vector2.new(hrpPosition.X - size.X / 2, hrpPosition.Y - size.Y / 2)
            Box.Visible = true

            tracer.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
            tracer.To = Vector2.new(hrpPosition.X, hrpPosition.Y)
            tracer.Visible = false

            name.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - size.Y / 2 - 20)
            name.Visible = true
        else
            Box.Visible = false
            tracer.Visible = false
            name.Visible = false
        end
    end

    RunService.RenderStepped:Connect(loop)
end

function remove(player)
    if wtf[player] then
        wtf[player].box:Remove()
        wtf[player].tracer:Remove()
        wtf[player].name:Remove()
        wtf[player] = nil
    end
end

function add(player)
    player.CharacterAdded:Connect(function(character)
        esp(player)
    end)
    player.CharacterRemoving:Connect(function(character)
        remove(player)
    end)
    if player.Character then
        esp(player)
    end
end

Players.PlayerAdded:Connect(add)

for _, player in pairs(Players:GetPlayers()) do
    add(player)
end

function toggle(state)
    settings.enabled = state
    if not state then
        for _, player in pairs(Players:GetPlayers()) do
            remove(player)
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                esp(player)
            end
        end
    end
end

function this_is_stupid(state)
    settings.teamCheck = state
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Camera = game.Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- Settings for the aimbot
local settings = {
    aimEnabled = false,        -- Starts off, toggled by button
    fovRadius = 100,           -- Field of View (FOV) radius
    aimAtPart = "Head",        -- Part of the character to aim at
}

-- Create a FOV circle for visualization
local fovCircle = Drawing.new("Circle")
fovCircle.Radius = settings.fovRadius
fovCircle.Color = Color3.new(1, 0, 0)
fovCircle.Thickness = 2
fovCircle.Transparency = 0.5
fovCircle.Filled = false
fovCircle.Visible = true

-- Update the FOV circle position and size
local function updateFovCircle()
    fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    fovCircle.Radius = settings.fovRadius
end

-- Function to get the closest player within the FOV
local function getClosestPlayerInFov()
    local closestPlayer = nil
    local shortestDistance = settings.fovRadius

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(settings.aimAtPart) then
            local targetPart = player.Character[settings.aimAtPart]
            local screenPoint = Camera:WorldToViewportPoint(targetPart.Position)
            local distanceFromCenter = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude

            if distanceFromCenter < shortestDistance then
                closestPlayer = player
                shortestDistance = distanceFromCenter
            end
        end
    end

    return closestPlayer
end

-- Lock aim directly at the target (No smoothing)
local function lockAimAt(target)
    if target and target.Character and target.Character:FindFirstChild(settings.aimAtPart) then
        local targetPart = target.Character[settings.aimAtPart]
        local targetPosition = targetPart.Position
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
    end
end

-- Aimbot loop
RunService.RenderStepped:Connect(function()
    -- Update FOV circle
    updateFovCircle()

    -- Aimbot functionality
    if settings.aimEnabled then
        local closestPlayer = getClosestPlayerInFov()
        if closestPlayer then
            lockAimAt(closestPlayer)
        end
    end
end)

-- Create a GUI button for toggling aimbot
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Set up the Toggle Button
ToggleButton.Name = "AimbotToggle"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)  -- Button color
ToggleButton.Size = UDim2.new(0, 100, 0, 50)  -- Button size
ToggleButton.Position = UDim2.new(0.1, 0, 0.9, 0)  -- Position at the bottom left
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Toggle Aimbot"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Text color
ToggleButton.TextSize = 24

-- Toggle the aimbot on or off when the button is pressed
ToggleButton.MouseButton1Click:Connect(function()
    settings.aimEnabled = not settings.aimEnabled
    if settings.aimEnabled then
        ToggleButton.Text = "Aimbot: ON"
    else
        ToggleButton.Text = "Aimbot: OFF"
    end
end)
