local UserInputService = game:GetService("UserInputService")

local speedScale = 20 -- Change this value to adjust the speed of the spinbot

local isSpinbotEnabled = false

local function toggleSpinbot()
    isSpinbotEnabled = not isSpinbotEnabled
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Z then
        toggleSpinbot()
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if isSpinbotEnabled then
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.RootPart.CFrame = humanoid.RootPart.CFrame * CFrame.Angles(0, math.rad(speedScale), 0)
            end
        end
    end
end)
