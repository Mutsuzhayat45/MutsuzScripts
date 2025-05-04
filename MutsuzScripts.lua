-- Lumber Tycoon 2 GUI by Mutsuz_hayat45
-- Para, Ağaç TP, Araba TP, Auto Build özellikleri içerir.

local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 250)
Frame.Position = UDim2.new(0.5, -150, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Active = true
Frame.Draggable = true

local title = Instance.new("TextLabel", Frame)
title.Text = "Mutsuz_hayat45 GUI"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local close = Instance.new("TextButton", Frame)
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -30, 0, 0)
close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local function createButton(text, yPos, callback)
    local btn = Instance.new("TextButton", Frame)
    btn.Text = text
    btn.Size = UDim2.new(0, 260, 0, 30)
    btn.Position = UDim2.new(0, 20, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(callback)
end

createButton("1M Para Al", 0.2, function()
    local player = game.Players.LocalPlayer
    if game.ReplicatedStorage:FindFirstChild("Transaction") then
        game.ReplicatedStorage.Transaction:FireServer(player, 1000000)
    end
end)

createButton("Ağaçlara Işınlan", 0.4, function()
    local tree = workspace:FindFirstChild("TreeModels")
    if tree then
        game.Players.LocalPlayer.Character:MoveTo(tree.Position)
    end
end)

createButton("Arabaya Işınlan", 0.6, function()
    for _,v in pairs(workspace.Vehicles:GetChildren()) do
        if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer.Name then
            game.Players.LocalPlayer.Character:MoveTo(v.PrimaryPart.Position)
            break
        end
    end
end)
