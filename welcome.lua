-- Gui to Lua
-- Version: 3.2

-- Instances:

local LoadUserData = Instance.new("ScreenGui")
local usrdata = Instance.new("Frame")
local Display = Instance.new("TextLabel")
local AccAge = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Welcome = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local Status = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local TextButton = Instance.new("TextButton")

--Properties:

LoadUserData.Name = "LoadUserData"
LoadUserData.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
LoadUserData.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

usrdata.Name = "usrdata"
usrdata.Parent = LoadUserData
usrdata.AnchorPoint = Vector2.new(0.5, 0.5)
usrdata.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
usrdata.BorderColor3 = Color3.fromRGB(0, 0, 0)
usrdata.BorderSizePixel = 0
usrdata.Position = UDim2.new(0.5, 0, 0.5, 0)
usrdata.Size = UDim2.new(0, 224, 0, 228)

Display.Name = "Display"
Display.Parent = usrdata
Display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Display.BackgroundTransparency = 1.000
Display.BorderColor3 = Color3.fromRGB(0, 0, 0)
Display.BorderSizePixel = 0
Display.Position = UDim2.new(-0.00123241975, 0, 0.139246121, 0)
Display.Size = UDim2.new(0, 223, 0, 24)
Display.Font = Enum.Font.SourceSans
Display.Text = "Display:"
Display.TextColor3 = Color3.fromRGB(213, 213, 213)
Display.TextSize = 17.000
Display.TextStrokeColor3 = Color3.fromRGB(199, 199, 199)

AccAge.Name = "AccAge"
AccAge.Parent = usrdata
AccAge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AccAge.BackgroundTransparency = 1.000
AccAge.BorderColor3 = Color3.fromRGB(0, 0, 0)
AccAge.BorderSizePixel = 0
AccAge.Position = UDim2.new(-0.00210925518, 0, 0.240650728, 0)
AccAge.Size = UDim2.new(0, 223, 0, 24)
AccAge.Font = Enum.Font.SourceSans
AccAge.Text = "AccountAge:"
AccAge.TextColor3 = Color3.fromRGB(213, 213, 213)
AccAge.TextSize = 17.000
AccAge.TextStrokeColor3 = Color3.fromRGB(199, 199, 199)

ImageLabel.Parent = usrdata
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.364803851, 0, 0.57272011, 0)
ImageLabel.Size = UDim2.new(0, 60, 0, 57)
ImageLabel.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner.CornerRadius = UDim.new(0, 150)
UICorner.Parent = ImageLabel

Welcome.Name = "Welcome"
Welcome.Parent = usrdata
Welcome.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Welcome.BackgroundTransparency = 1.000
Welcome.BorderColor3 = Color3.fromRGB(0, 0, 0)
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0.00258363993, 0, -0.000472341257, 0)
Welcome.Size = UDim2.new(0, 223, 0, 22)
Welcome.Font = Enum.Font.SourceSans
Welcome.Text = "Welcome,"
Welcome.TextColor3 = Color3.fromRGB(209, 209, 209)
Welcome.TextSize = 20.000

UICorner_2.CornerRadius = UDim.new(0, 21)
UICorner_2.Parent = Welcome

UICorner_3.CornerRadius = UDim.new(0, 21)
UICorner_3.Parent = usrdata

Status.Name = "Status"
Status.Parent = usrdata
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
Status.BorderSizePixel = 0
Status.Position = UDim2.new(-0.00241606566, 0, 0.35366413, 0)
Status.Size = UDim2.new(0, 223, 0, 24)
Status.Font = Enum.Font.SourceSans
Status.Text = "License Status: Unknown"
Status.TextColor3 = Color3.fromRGB(213, 213, 213)
Status.TextSize = 17.000
Status.TextStrokeColor3 = Color3.fromRGB(199, 199, 199)

UIAspectRatioConstraint.Parent = usrdata
UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

TextButton.Parent = usrdata
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.00599989761, 0, 0.885721147, 0)
TextButton.Size = UDim2.new(0.994000018, 0, 0.0911765769, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Close"
TextButton.TextColor3 = Color3.fromRGB(157, 49, 30)
TextButton.TextSize = 24.000
TextButton.TextStrokeTransparency = 0.900

-- Scripts:

local function CSAHO_fake_script() -- Display.LocalScript 
	local script = Instance.new('LocalScript', Display)

	local player = game.Players.LocalPlayer
	local welcomeMessage = "Display: " .. player.DisplayName
	
	script.Parent.Text = welcomeMessage
	
end
coroutine.wrap(CSAHO_fake_script)()
local function BGYEVYB_fake_script() -- AccAge.LocalScript 
	local script = Instance.new('LocalScript', AccAge)

	local player = game.Players.LocalPlayer
	local welcomeMessage = "AccountAge: " .. player.AccountAge
	
	script.Parent.Text = welcomeMessage
	
end
coroutine.wrap(BGYEVYB_fake_script)()
local function SMBW_fake_script() -- ImageLabel.LocalScript 
	local script = Instance.new('LocalScript', ImageLabel)

	local player = game.Players.LocalPlayer
	local avatarImageButton = script.Parent -- Assuming the script is a child of the ImageButton
	
	-- Function to get the player's avatar image
	local function getAvatarImage()
		local avatarId = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
		avatarImageButton.Image = avatarId
	end
	
	-- Call the function to set the image
	getAvatarImage()
	
end
coroutine.wrap(SMBW_fake_script)()
local function TAXKAR_fake_script() -- Welcome.LocalScript 
	local script = Instance.new('LocalScript', Welcome)

	local player = game.Players.LocalPlayer
	local welcomeMessage = "Welcome, " .. player.Name
	
	script.Parent.Text = welcomeMessage
	
end
coroutine.wrap(TAXKAR_fake_script)()
local function JWQMF_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local closeButton = script.Parent  -- The button that closes the GUI
	local gui = closeButton.Parent.Parent  -- This assumes the button's parent is a Frame, and the Frame's parent is the ScreenGui
	
	closeButton.MouseButton1Click:Connect(function()
		gui:Destroy()  -- This removes the GUI and all its elements
	end)
	
end
coroutine.wrap(JWQMF_fake_script)()
local function RWMKFUD_fake_script() -- LoadUserData.LocalScript 
	local script = Instance.new('LocalScript', LoadUserData)

	local gui = script.Parent  -- Reference to the Frame
	
	
	wait(5)  
	
	gui:Destroy()
	
end
coroutine.wrap(RWMKFUD_fake_script)()
