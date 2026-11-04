-- StageSelectionScript.client.lua

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function createStageSelectionUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "StageSelectionUI"
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 300)
    frame.Position = UDim2.new(0.5, -100, 0.5, -150)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, 30)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.Text = "Select Stage"
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundTransparency = 1
    textLabel.Parent = frame
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 0, 250)
    scrollFrame.Position = UDim2.new(0, 0, 0, 30)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.ScrollBarThickness = 5
    scrollFrame.Parent = frame
    
    -- Add buttons for each stage
    local stages = workspace:GetChildren()
    for _, stage in ipairs(stages) do
        if stage:IsA("Model") then
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 0, 30)
            button.Position = UDim2.new(0, 0, 0, (#scrollFrame:GetChildren() - 1) * 30)
            button.Text = stage.Name
            button.TextColor3 = Color3.new(1, 1, 1)
            button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
            button.Parent = scrollFrame
            
            button.MouseButton1Click:Connect(function()
                player:Chat("/fly " .. stage.Name)
            end)
        end
    end
end

createStageSelectionUI()