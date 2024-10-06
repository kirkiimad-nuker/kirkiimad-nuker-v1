-- LocalScript for the draggable GUI

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "kirkiimad on top"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main frame for the GUI
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
mainFrame.BorderSizePixel = 0 -- No border
mainFrame.Parent = screenGui

-- Create rounded corners for the main frame
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10) -- Rounded corners
uiCorner.Parent = mainFrame

-- Create the logo
local logo = Instance.new("ImageLabel")
logo.Image = "rbxassetid://14715233559" -- Decal ID for logo
logo.Size = UDim2.new(1, 0, 0, 50)
logo.Position = UDim2.new(0, 0, 0, 0)
logo.BackgroundTransparency = 1 -- Make logo background transparent
logo.Parent = mainFrame

-- Create title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "kirkiimad | aku sayang"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 50)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
titleLabel.TextSize = 20
titleLabel.Parent = mainFrame

-- Create a function to play the song
local function playSong()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://15689457467"
    sound.Looped = true
    sound.Parent = workspace
    sound:Play()
end

-- Create a function to make the GUI draggable
local function makeDraggable(frame)
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragging then
                update(input)
            end
        end
    end)
end

makeDraggable(mainFrame)

-- Create a button function
local function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, 150, 0, 30) -- Smaller size for buttons
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red background for buttons
    button.BorderSizePixel = 0 -- No border
    button.Font = Enum.Font.SourceSans -- Set font to Source Sans
    button.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    button.TextScaled = true -- Scale text to fit button
    button.Parent = mainFrame

    -- Create rounded corners for the button
    local buttonUICorner = Instance.new("UICorner")
    buttonUICorner.CornerRadius = UDim.new(0, 10) -- Rounded corners
    buttonUICorner.Parent = button

    button.MouseButton1Click:Connect(callback)
    
    return button
end

-- Create buttons
createButton("Kirkii Song", UDim2.new(0, 0, 0, 90), playSong)

createButton("Red Blur", UDim2.new(0, 0, 0, 130), function()
    local blur = Instance.new("BlurEffect")
    blur.Size = 10
    blur.Parent = game.Lighting
end)

createButton("Decal Spam", UDim2.new(0, 0, 0, 170), function()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            local decal = Instance.new("Decal")
            decal.Texture = "rbxassetid://14715233559"
            decal.Parent = part
        end
    end
end)

createButton("Notify Spam", UDim2.new(0, 0, 0, 210), function()
    while true do
        wait(0) -- Adjust notification frequency
        for _, player in pairs(game.Players:GetPlayers()) do
            game.StarterGui:SetCore("SendNotification", {
                Title = "Notification";
                Text = "kirkiimad on top | aku sayang";
                Duration = 0; -- Duration in seconds
            })
        end
    end
end)

createButton("Destroy Server", UDim2.new(0, 0, 0, 250), function()
    -- Add fire to all parts in the game
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            local fire = Instance.new("Fire")
            fire.Size = 10
            fire.Parent = part
        end
    end

    -- Add red and black color correction effect
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.TintColor = Color3.fromRGB(255, 0, 0) -- Red tint
    colorCorrection.Contrast = 1.5 -- Increase contrast for a darker effect
    colorCorrection.Saturation = -1 -- Desaturate colors to make them darker
    colorCorrection.Parent = game.Lighting

    -- Glitch players by setting walk speed and jump power to 0
    local function glitchPlayers()
        for _, player in pairs(game.Players:GetPlayers()) do
            player.Character.Humanoid.WalkSpeed = 0 -- Glitch player by setting speed to 0
            player.Character.Humanoid.JumpPower = 0 -- Glitch jump power to 0
        end
    end

    glitchPlayers()

    -- Force players to chat the message
    for _, player in pairs(game.Players:GetPlayers()) do
        player.Character:FindFirstChildOfClass("Humanoid"):TakeDamage(0) -- Make sure they're alive
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("kirkiimad | aku sayang", "All")
    end
end)

createButton("Lag Server", UDim2.new(0, 0, 0, 290), function()
    while true do
        wait(0.1) -- Adjust lag frequency
        local lagPart = Instance.new("Part")
        lagPart.Size = Vector3.new(0.1, 0.1, 0.1) -- Small size for lag
        lagPart.Position = Vector3.new(math.random(-50, 50), math.random(10, 50), math.random(-50, 50)) -- Random position
        lagPart.Anchored = true
        lagPart.Parent = workspace
    end
end)

createButton("Spawn Parts", UDim2.new(0, 0, 0, 330), function()
    for i = 1, 999999999999999999999 do -- Adjust the number of parts to spawn
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1) -- Size of spawned parts
        part.Position = Vector3.new(math.random(-50, 50), math.random(10, 50), math.random(-50, 50)) -- Random position
        part.Anchored = true
        part.Parent = workspace
    end
end)

-- Optional: Apply background image or texture
local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Size = UDim2.new(1, 0, 1, 0)
backgroundImage.BackgroundTransparency = 1
backgroundImage.Image = "rbxassetid://14715233559" -- Replace with your desired background image ID
backgroundImage.Parent = mainFrame
