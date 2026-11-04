-- FlyToStageScript.server.lua

local Players = game:GetService("Players")

local function flyToStage(player, stageName)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    -- Get the position of the desired stage
    local stage = workspace:FindFirstChild(stageName)
    if stage then
        humanoidRootPart.CFrame = stage.CFrame
    else
        warn("Stage " .. stageName .. " not found.")
    end
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        if message:sub(1, 4) == "/fly" then
            local stageName = message:sub(6)
            flyToStage(player, stageName)
        end
    end)
end)