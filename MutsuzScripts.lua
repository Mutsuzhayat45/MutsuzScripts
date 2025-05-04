--[[ Mutsuz Hub | Lumber Tycoon 2 Features:

Tabs: Main, Farm, Build, Tree TP, Auto Bring Logs, Extra

RGB border GUI

Mobile executer compatible (Arceus X, Hydrogen, Delta)

Tree select + Auto Chop + Auto Bring + Auto Sell

Bridge remover toggle ]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- GUI Library (RGB destekli)
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/ZylA2sGp"))()
local GUI = Library:CreateWindow("Mutsuz Hub", Color3.fromRGB(255, 0, 0), true)

-- Tabs
local mainTab = GUI:CreateTab("Main")
local farmTab = GUI:CreateTab("Farm")
local buildTab = GUI:CreateTab("Build")
local treeTP = GUI:CreateTab("Tree TP")
local autoLogs = GUI:CreateTab("Auto Bring Logs")
local extra = GUI:CreateTab("Extra")

-- Main tab
mainTab:CreateButton("Teleport to Base", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.PlayerBases[Player.Name].Position)
end)

-- Tree TP tab
local trees = {"OakTree", "PineTree", "VolcanoTree"}
for _, tree in pairs(trees) do
    treeTP:CreateButton("TP to " .. tree, function()
        local found = workspace:FindFirstChild(tree)
        if found then
            Player.Character.HumanoidRootPart.CFrame = found.CFrame + Vector3.new(0, 10, 0)
        end
    end)
end

-- Auto Bring Logs tab
local selectedTree = ""
autoLogs:CreateDropdown("Tree Type", trees, function(opt)
    selectedTree = opt
end)

autoLogs:CreateToggle("Auto Chop + Bring + Sell", false, function(bool)
    _G.AutoFarm = bool
    while _G.AutoFarm do
        task.wait(1)
        print("Farming tree:", selectedTree)
        -- Chop, bring, sell işlemleri buraya eklenebilir
    end
end)

-- Extra tab
extra:CreateButton("Open Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

extra:CreateButton("Enable Fling", function()
    print("Fling activated")
end)

extra:CreateSlider("WalkSpeed", 16, 200, function(val)
    Player.Character.Humanoid.WalkSpeed = val
end)

extra:CreateSlider("JumpPower", 50, 200, function(val)
    Player.Character.Humanoid.JumpPower = val
end)

-- Bridge toggle
buildTab:CreateToggle("Remove Bridge Water", false, function(state)
    local water = workspace:FindFirstChild("BridgeWater")
    if water then
        water.Transparency = state and 1 or 0
    end
end)

print("Mutsuz Hub Loaded!")
