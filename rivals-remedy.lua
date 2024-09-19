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

--// Aimbot with unfilled FOV and UI toggle button

local settings = {
    enabled = false, -- Starts disabled
    teamCheck = false,
    aimAtPart = "HumanoidRootPart", -- The part to aim at, usually HumanoidRootPart or Head
    fovSize = 75 -- Size of the FOV circle
}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--// Create UI
local screenGui = Instance.new("ScreenGui")
local toggleButton = Instance.new("TextButton")

screenGui.Parent = game.CoreGui

toggleButton.Parent = screenGui
toggleButton.Position = UDim2.new(0.9, 0, 0.1, 0) -- Position in the top-right corner
toggleButton.Size = UDim2.new(0, 150, 0, 50)
toggleButton.Text = "Enable Aimbot"
toggleButton.TextScaled = true
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.BorderSizePixel = 0
toggleButton.Font = Enum.Font.SourceSansBold

--// FOV Circle (Unfilled)
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1
fovCircle.NumSides = 100
fovCircle.Radius = settings.fovSize
fovCircle.Color = Color3.new(1, 1, 1)
fovCircle.Visible = false
fovCircle.Transparency = 1
fovCircle.Filled = false -- Make sure the FOV circle is not filled in

--// Function to toggle aimbot
local function toggleAimbot()
    settings.enabled = not settings.enabled
    toggleButton.Text = settings.enabled and "Disable Aimbot" or "Enable Aimbot"
    toggleButton.BackgroundColor3 = settings.enabled and Color3.new(0, 1, 0) or Color3.new(0.2, 0.2, 0.2)
    fovCircle.Visible = settings.enabled -- Show the FOV circle only when the aimbot is enabled
end

toggleButton.MouseButton1Click:Connect(toggleAimbot)

--// Function to update FOV circle position
local function updateFovCircle()
    local mousePosition = UserInputService:GetMouseLocation()
    fovCircle.Position = mousePosition
end

--// Function to check if a player is inside the FOV circle
local function isInFov(position)
    local mousePosition = UserInputService:GetMouseLocation()
    local distance = (Vector2.new(position.X, position.Y) - mousePosition).Magnitude
    return distance <= settings.fovSize
end

--// Function to find closest player inside FOV
local function getClosestPlayerInFov()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        -- Ensure the player isn't the local player and the character exists
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(settings.aimAtPart) then
            -- If team check is enabled, skip teammates
            if settings.teamCheck and player.Team == LocalPlayer.Team then
                continue
            end
            
            -- Get the position of the part we aim at
            local targetPart = player.Character[settings.aimAtPart]
            local targetPosition = targetPart.Position
            -- Convert 3D position to 2D screen coordinates
            local screenPoint = Camera:WorldToViewportPoint(targetPosition)

            -- Check if the player is within the FOV circle
            if isInFov(screenPoint) then
                -- Get the mouse position for aiming
                local mousePosition = UserInputService:GetMouseLocation()
                local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - mousePosition).Magnitude
                
                -- Find the closest player based on distance to crosshair within FOV
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

--// Function to snap aim to the target
local function snapAimAt(target)
    if target and target.Character and target.Character:FindFirstChild(settings.aimAtPart) then
        local targetPart = target.Character[settings.aimAtPart]
        local targetPosition = targetPart.Position
        local screenPoint = Camera:WorldToViewportPoint(targetPosition)

        -- Move mouse to the target
        mousemoverel((screenPoint.X - UserInputService:GetMouseLocation().X) / 2, (screenPoint.Y - UserInputService:GetMouseLocation().Y) / 2)
    end
end

--// Aimbot loop
RunService.RenderStepped:Connect(function()
    if settings.enabled then
        updateFovCircle()
        local closestPlayer = getClosestPlayerInFov()
        snapAimAt(closestPlayer)
    end
end)
