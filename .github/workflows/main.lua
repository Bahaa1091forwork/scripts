local plr = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = plr:WaitForChild("PlayerGui")  
gui.ResetOnSpawn = false  -- Keeps the GUI after respawning

-- Create Main Frame (Draggable)
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0.3, 0, 0.2, 0)
frame.Position = UDim2.new(0.35, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true  -- Makes the GUI draggable

-- Title Label
local text = Instance.new("TextLabel")
text.Parent = frame
text.Size = UDim2.new(1, 0, 0.3, 0)  
text.Position = UDim2.new(0, 0, 0, 0)  
text.Text = "Speed Changer"
text.TextSize = 20
text.BackgroundColor3 = Color3.new(0, 0, 0)  
text.TextColor3 = Color3.new(1, 1, 1)  

-- Speed Input Box
local textBox = Instance.new("TextBox")
textBox.Parent = frame
textBox.Size = UDim2.new(0.8, 0, 0.3, 0)
textBox.Position = UDim2.new(0.1, 0, 0.4, 0)
textBox.Text = "Enter Speed"
textBox.TextSize = 18
textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)

-- Button to Apply Speed
local button = Instance.new("TextButton")
button.Parent = frame
button.Size = UDim2.new(0.8, 0, 0.3, 0)
button.Position = UDim2.new(0.1, 0, 0.75, 0)
button.Text = "Set Speed"
button.TextSize = 18
button.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
button.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Function to update WalkSpeed when button is clicked
local function updateSpeed()
    local speed = tonumber(textBox.Text)  -- Convert input to a number
    if speed then
        local character = plr.Character or plr.CharacterAdded:Wait()
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = speed
            print("WalkSpeed set to " .. speed .. "!")
        else
            print("Humanoid not found!")
        end
    else
        print("Invalid number entered!")
    end
end

button.MouseButton1Click:Connect(updateSpeed)

-- Ensure WalkSpeed updates after respawning
plr.CharacterAdded:Connect(function(character)
    wait(1)  -- Short delay to ensure Humanoid is loaded
    updateSpeed()
end)
