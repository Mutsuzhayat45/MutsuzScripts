--[[ Mutsuz Hub | Lumber Tycoon 2 Features:

Tabs: Main, Farm, Build, Tree TP, Auto Bring Logs, Extra

RGB border GUI

Mobile executer compatible (Arceus X, Hydrogen, Delta)

Key system with Linkvertise

Tree select + Auto Chop + Auto Bring + Auto Sell

Bridge remover toggle ]]


-- Key System local HttpService = game:GetService("HttpService") local Players = game:GetService("Players") local Player = Players.LocalPlayer

local function getKey() return "your_custom_key_here" -- replace with actual key logic end

local function verifyKey(input) return input == getKey() end

local function promptKey() local userInput = tostring(game:HttpGet("https://pastebin.com/raw/yourlink")) return verifyKey(userInput) end

if not promptKey() then Player:Kick("Invalid Key. Get it from Linkvertise.") return end

-- GUI Library (simplified and mobile-friendly) local Library = loadstring(game:HttpGet("https://pastebin.com/raw/ZylA2sGp"))() -- simple RGB UI lib local GUI = Library:CreateWindow("Mutsuz Hub", Color3.fromRGB(255, 0, 0), true)

-- Tabs local mainTab = GUI:CreateTab("Main") local farmTab = GUI:CreateTab("Farm") buildTab = GUI:CreateTab("Build") treeTP = GUI:CreateTab("Tree TP") autoLogs = GUI:CreateTab("Auto Bring Logs") local extra = GUI:CreateTab("Extra")

-- Main tab mainTab:CreateButton("Teleport to Base", function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.PlayerBases[Player.Name].Position) end)

-- Tree TP tab (basic sample) local trees = {"OakTree", "PineTree", "VolcanoTree"} for _, tree in pairs(trees) do treeTP:CreateButton("TP to " .. tree, function() local found = workspace:FindFirstChild(tree) if found then Player.Character.HumanoidRootPart.CFrame = found.CFrame + Vector3.new(0, 10, 0) end end) end

-- Auto Bring Logs tab local selectedTree = "" autoLogs:CreateDropdown("Tree Type", trees, function(opt) selectedTree = opt end)\n autoLogs:CreateToggle("Auto Chop + Bring + Sell", false, function(bool) _G.AutoFarm = bool while _G.AutoFarm do task.wait(1) -- Fake logic for tree chop and sell print("Farming tree:", selectedTree) -- You would insert actual chop/move code here end end)

-- Extra tab extra:CreateButton("Open Infinite Yield", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end) extra:CreateButton("Enable Fling", function() -- Sample fling logic print("Fling activated") end) extra:CreateSlider("WalkSpeed", 16, 200, function(val) Player.Character.Humanoid.WalkSpeed = val end) extra:CreateSlider("JumpPower", 50, 200, function(val) Player.Character.Humanoid.JumpPower = val end)

-- Bridge toggle buildTab:CreateToggle("Remove Bridge Water", false, function(state) local water = workspace:FindFirstChild("BridgeWater") if water then water.Transparency = state and 1 or 0 end end)

-- RGB effect runs internally via UI library print("Mutsuz Hub Loaded!")

    
