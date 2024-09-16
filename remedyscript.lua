local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Target = nil
local RightClickHeld = false
local Locking = false

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

-- Detect when the right mouse button is held down
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        RightClickHeld = true
    end
end)

-- Detect when the right mouse button is released
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        RightClickHeld = false
        Target = nil
    end
end)

-- Main loop to check for the closest player and lock onto them if the conditions are met
RunService.RenderStepped:Connect(function()
    if RightClickHeld then
        if not Target or not Target.Character or not Target.Character:FindFirstChild("Head") or not IsVisible(Target.Character.Head) then
            Target = GetClosestPlayer()
        end

        if Target then
            LockOntoPlayer(Target)
        end
    end
end)
