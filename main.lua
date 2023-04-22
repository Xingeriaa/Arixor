local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()

library.rank = "Premium"
local Wm = library:Watermark("Arixor | v" .. "1.0.0" .. " | " .. library:GetUsername() .. " | rank: " .. library.rank)
local FpsWm = Wm:AddWatermark("fps: " .. library.fps)
local Notif = library:InitNotifications()
coroutine.wrap(function()
    while wait(.75) do
        FpsWm:Text("fps: " .. library.fps)
    end
end)()
library.title = "Arixor"

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait() 
local hrp = char:WaitForChild("HumanoidRootPart")
local Humanoid = char:WaitForChild("Humanoid");
local Camera = workspace.Camera;

player.CharacterAdded:Connect(function(character) 
    char = character
    hrp = character:WaitForChild("HumanoidRootPart")
    Humanoid = character:WaitForChild("Humanoid")
end)



function sell(item) 
    game:GetService("ReplicatedStorage").GlobalUsedRemotes.SellItem:FireServer(item)
end

function tpplr(plr)
    for i,v in pairs(game.Players:GetPlayers()) do 
        if v ~= nil and v ~= player then 
            local target = string.lower(v.Name)
            if string.match(target, plr) then 
                hrp.CFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame
            end
        end
    end
end




wait(1)
local Init = library:Init()
local items = Init:NewTab("Items")

local itemslabel1 = items:NewSection("Main")

local itemcollectingtoggle = items:NewToggle("Auto Collect Items", false, function(value)
    _G.itemcollectingtoggler = value
end)

local itemsellingtoggle = items:NewToggle("Auto Sell Items", false, function(value)
   _G.autosellitemstoggler = value
end)
    
local itemslabel2 = items:NewSection("Config")

local itemscmt1 = items:NewLabel("Auto Sell Items Config", "center")
local arrowcheck
local mysteriouscameracheck
local hamonmanualcheck
local rokakakacheck
local stopsigncheck
local stonemaskcheck
local hauntedswordcheck
local spinmanualcheck
local barrelcheck
local bombdfcheck
local mochidfcheck
local baridfcheck

local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
_G.TeleportSpeed = 50;
local NextFrame = RunService.Heartbeat;

local function ImprovedTeleport(Target)
    if (typeof(Target) == "Instance" and Target:IsA("BasePart")) then Target = Target.Position; end;
    if (typeof(Target) == "CFrame") then Target = Target.p end;

    local HRP = (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"));
    if (not HRP) then return; end;

    local StartingPosition = HRP.Position;
    local PositionDelta = (Target - StartingPosition);
    local StartTime = tick();
    local TotalDuration = (StartingPosition - Target).magnitude / _G.TeleportSpeed;

    repeat NextFrame:Wait();
        local Delta = tick() - StartTime;
        local Progress = math.min(Delta / TotalDuration, 1);
        local MappedPosition = StartingPosition + (PositionDelta * Progress);
        HRP.Velocity = Vector3.new();
        HRP.CFrame = CFrame.new(MappedPosition);
    until (HRP.Position - Target).magnitude <= _G.TeleportSpeed / 6.5 or _G.itemcollectingtoggler == false;
    HRP.Anchored = false;
end;

local SellSpeed = items:NewTextbox("Selling items's cooldown", "", "Second", "all", "small", true, false, function(val)
    _G.SellingSpeed = val;
end)


local allitems = items:NewToggle("All Items", false, function(value)
    _G.allitems = value
    if _G.allitems then 
        arrowcheck:Set(true)
        mysteriouscameracheck:Set(true)
        hamonmanualcheck:Set(true)
        rokakakacheck:Set(true)
        stopsigncheck:Set(true)
        stonemaskcheck:Set(true)
        hauntedswordcheck:Set(true)
        spinmanualcheck:Set(true)
        barrelcheck:Set(true)
        bombdfcheck:Set(true)
        mochidfcheck:Set(true)
        baridfcheck:Set(true)
    else
        arrowcheck:Set(false)
        mysteriouscameracheck:Set(false)
        hamonmanualcheck:Set(false)
        rokakakacheck:Set(false)
        stopsigncheck:Set(false)
        stonemaskcheck:Set(false)
        hauntedswordcheck:Set(false)
        spinmanualcheck:Set(false)
        barrelcheck:Set(false)
        bombdfcheck:Set(false)
        mochidfcheck:Set(false)
        baridfcheck:Set(false)
    end
end)

arrowcheck = items:NewToggle("Arrow", false, function(value)
    _G.arrow = value
end)

mysteriouscameracheck = items:NewToggle("Mysterious Camera", false, function(value)
    _G.camera = value
end)

hamonmanualcheck = items:NewToggle("Hamon Manual", false, function(value)
    _G.hamon = value
end)

rokakakacheck = items:NewToggle("Rokakaka", false, function(value)
    _G.roka = value
end)

stopsigncheck = items:NewToggle("Stop Sign", false, function(value)
    _G.stopsign = value
end)

stonemaskcheck = items:NewToggle("Stone Mask", false, function(value)
    _G.stonemask = value
end)

hauntedswordcheck = items:NewToggle("Haunted Sword", false, function(value)
    _G.hauntedsword = value
end)

spinmanualcheck = items:NewToggle("Spin Manual", false, function(value)
    _G.spinmanual = value
end)

barrelcheck = items:NewToggle("Barrel", false, function(value)
    _G.barrel = value
end)

bombdfcheck = items:NewToggle("Bomu Bomu Devil Fruit", false, function(value)
    _G.bombdf = value
end)

mochidfcheck = items:NewToggle("Mochi Mochi Devil Fruit", false, function(value)
    _G.mochidf = value
end)

baridfcheck = items:NewToggle("Bari Bari Devil Fruit", false, function(value)
    _G.baridf = value
end)

_G.itemcollectingCD = true
tpcd = 3;
game:GetService("RunService").Stepped:Connect(function()
    if _G.itemcollectingCD and _G.itemcollectingtoggler then 
        _G.itemcollectingCD = false;
            for i, v in pairs(game:GetService("Workspace").Item:GetChildren()) do 
                if v:IsA("Part") then 
                    local safepos = v.CFrame * CFrame.new(0,0,7.5);
                    if v.Position.Y > -50 and v:FindFirstChild("ProximityPrompt") and v.Name ~= "Chest" then 
                        ImprovedTeleport(v);
                        wait()
                        pcall(function() 
                            fireproximityprompt(v:FindFirstChild("ProximityPrompt"), (hrp.Position - v.Position).magnitude);
                        end)
                            wait(1)
                    elseif v:IsA("Part") and v.Position.Y > -50 and v:FindFirstChild("ProximityPrompt") and v.Name == "Chest" and (char:FindFirstChild("Chest Key") or player.Backpack:FindFirstChild("Chest Key")) then 
                        ImprovedTeleport(v);
                        wait()
                        pcall(function()
                            fireproximityprompt(v:FindFirstChild("ProximityPrompt"), (hrp.Position - v.Position).magnitude);
                        end)
                        wait(1)
                    end
                    if _G.itemcollectingtoggler == false then 
                        break
                    end
                end
            end
        wait()
        _G.itemcollectingCD = true;
    end
end)


_G.SellingSpeed = .5;
_G.sellcd = true
game:GetService("RunService").Stepped:Connect(function() 
    if _G.sellcd and _G.autosellitemstoggler then 
        _G.sellcd = false;
        for i,v in pairs(player.Backpack:GetChildren()) do
            if _G.arrow and v:IsA("Tool") and v.Name == "Arrow" then 
                wait(_G.SellingSpeed)
                sell("Arrow")
            elseif _G.camera and v:IsA("Tool") and v.Name == "Mysterious Camera" then 
                wait(_G.SellingSpeed)
                sell("Mysterious Camera")
            elseif _G.hamon and v:IsA("Tool") and v.Name == "Hamon Manual" then 
                wait(_G.SellingSpeed)
                sell("Hamon Manual")
            elseif _G.roka and v:IsA("Tool") and v.Name == "Rokakaka" then 
                wait(_G.SellingSpeed)
                sell("Rokakaka")
            elseif _G.stopsign and v:IsA("Tool") and v.Name == "Stop Sign" then 
                wait(_G.SellingSpeed)
                sell("Stop Sign")
            elseif _G.stonemask and v:IsA("Tool") and v.Name == "Stone Mask" then 
                wait(_G.SellingSpeed)
                sell("Stone Mask")
            elseif _G.hauntedsword and v:IsA("Tool") and v.Name == "Haunted Sword" then 
                wait(_G.SellingSpeed)
                sell("Haunted Sword")
            elseif _G.spinmanual and v:IsA("Tool") and v.Name == "Spin Manual" then 
                wait(_G.SellingSpeed)
                sell("Spin Manual")
            elseif _G.barrel and v:IsA("Tool") and v.Name == "Barrel" then 
                wait(_G.SellingSpeed)
                sell("Barrel")
            elseif _G.bombdf and v:IsA("Tool") and v.Name == "Bomu Bomu Devil Fruit" then 
                wait(_G.SellingSpeed)
                sell("Bomu Bomu Devil Fruit")
            elseif _G.mochidf and v:IsA("Tool") and v.Name == "Mochi Mochi Devil Fruit" then 
                wait(_G.SellingSpeed)
                sell("Mochi Mochi Devil Fruit")
            elseif _G.baridf and v:IsA("Tool") and v.Name == "Bari Bari Devil Fruit" then 
                wait(_G.SellingSpeed)
                sell("Bari Bari Devil Fruit")
            end
            if _G.autosellitemstoggler == false then 
                break
            end
        end
        _G.sellcd = true;
    end
end)


local Farm = Init:NewTab("Farming")


local teleport = Init:NewTab("Teleport")

local tpsection1 = teleport:NewSection("Player Teleport")

local plrtp = teleport:NewTextbox("Teleport to player", "", "Type player's name here", "all", "medium", true, false, function(val)
    tpplr(tostring(val))
end)


local tpsection2 = teleport:NewSection("Waypoints")

local battlefield = teleport:NewButton("Battle Field", function()
    hrp.CFrame = CFrame.new(-518.859436, -31.1859684, 1652.20728, 0.76356101, 2.39225528e-09, 0.645735681, -4.70977612e-09, 1, 1.86445659e-09, -0.645735681, -4.4648969e-09, 0.76356101)
end)

local park1 = teleport:NewButton("Park 1", function()
    hrp.CFrame = CFrame.new(-534.604492, -32.0513382, 1431.11267, -0.99984324, 1.7995724e-08, 0.0177042745, 1.81112068e-08, 1, 6.36257269e-09, -0.0177042745, 6.68222144e-09, -0.99984324)
end)
local park2 = teleport:NewButton("Park 2", function()
    hrp.CFrame = CFrame.new(-113.510201, -31.9132633, 1652.05225, -0.198133811, -2.27378809e-08, -0.980174959, 6.77792045e-08, 1, -3.68987507e-08, 0.980174959, -7.37463708e-08, -0.198133811)
end)
local forest1 = teleport:NewButton("Forest 1", function()
    hrp.CFrame = CFrame.new(-534.930054, -32.6436386, 1211.19507, -0.998642802, 1.06115872e-08, -0.0520826168, 1.48075925e-08, 1, -8.01785447e-08, 0.0520826168, -8.08409411e-08, -0.998642802)
end)
local forest2 = teleport:NewButton("Forest 2", function()
    hrp.CFrame = CFrame.new(-85.1891403, -32.4555206, 1849.08911, 0.998558283, 9.75184555e-09, 0.053678643, -9.49675982e-09, 1, -5.00716668e-09, -0.053678643, 4.49017445e-09, 0.998558283)
end)
local shop = teleport:NewButton("Shop & Storage", function()
    hrp.CFrame = CFrame.new(-377.438812, -31.7041798, 1813.58545, -0.999793112, -2.01072003e-09, 0.0203394201, -1.51617907e-09, 1, 2.4329827e-08, -0.0203394201, 2.42939553e-08, -0.999793112)
end)
local itemreseller = teleport:NewButton("Item Reseller", function()
    hrp.CFrame = CFrame.new(-619.490295, -32.4928932, 1915.19104, -0.999679089, 2.38165221e-08, -0.0253315121, 2.24786039e-08, 1, 5.31011217e-08, 0.0253315121, 5.25146646e-08, -0.999679089)
end)
local cafe = teleport:NewButton("Cafe", function()
    hrp.CFrame = CFrame.new(-189.353363, -32.1086998, 1450.92029, -0.142804161, 2.65538311e-08, 0.989750981, -9.3941054e-08, 1, -4.03828899e-08, -0.989750981, -9.87450974e-08, -0.142804161)
end)
local guild = teleport:NewButton("Guild", function()
    hrp.CFrame = CFrame.new(-689.147949, -31.07477, 1652.20801, -0.200063422, -1.6132125e-08, 0.979782939, -1.6156271e-08, 1, 1.31660247e-08, -0.979782939, -1.31955993e-08, -0.200063422)
end)
local anubisquest = teleport:NewButton("Anubis Quest", function()
    hrp.CFrame = CFrame.new(-508.723328, -32.7921524, 1515.14844, 0.991440296, 2.36861375e-08, 0.130561084, -2.67459495e-08, 1, 2.16823643e-08, -0.130561084, -2.49887488e-08, 0.991440296)
end)
local skinremover = teleport:NewButton("Skin Remover", function()
    hrp.CFrame = CFrame.new(51.6947899, -33.015358, 1576.33997, -0.0593736321, 8.18298673e-08, -0.998235822, -7.34929717e-09, 1, 8.241161e-08, 0.998235822, 1.22294086e-08, -0.0593736321)
end)
local bossspawn = teleport:NewButton("Boss Spawn", function()
    hrp.CFrame = CFrame.new(-637.29425, -31.8911381, 1208.03345, -0.999851286, -4.7800043e-08, -0.0172444955, -4.6179867e-08, 1, -9.43514067e-08, 0.0172444955, -9.35410256e-08, -0.999851286)
end)
local library = teleport:NewButton("Library", function()
    hrp.CFrame = CFrame.new(-25.8522663, -31.0669003, 1521.94727, 0.998029947, -7.08256831e-09, 0.0627393797, 1.06147251e-08, 1, -5.59655682e-08, -0.0627393797, 5.6521273e-08, 0.998029947)
end)

local Shop = Init:NewTab("Shop")
local ShopSection1 = Shop:NewSection("Skin Roller")

local SkinRollerWithAnimationButton = Shop:NewButton("Roll A Skin (With Animation)", function()
    game:GetService("ReplicatedStorage").GlobalUsedRemotes.ArcadePurchase:FireServer(false, true)
end)

local SkinRollerWithoutAnimationButton = Shop:NewButton("Roll A Skin (Without Animation)", function()
    game:GetService("ReplicatedStorage").GlobalUsedRemotes.ArcadePurchase:FireServer(false, false)
end)

local ShopSection2 = Shop:NewSection("Shop")

local BuyArrowButton = Shop:NewButton("Buy Arrow", function()
    game:GetService("ReplicatedStorage").BuyItemRemote.Arrow:FireServer("")
end)

local BuyRokakakaButton = Shop:NewButton("Buy Rokakaka", function()
    game:GetService("ReplicatedStorage").BuyItemRemote.Rokakaka:FireServer("")
end)

local BuyStopSignButton = Shop:NewButton("Buy Stop Sign", function()
    game:GetService("ReplicatedStorage").BuyItemRemote.StopSign:FireServer("")
end)

local BuyHamonButton = Shop:NewButton("Buy Hamon Manual", function()
    game:GetService("ReplicatedStorage").BuyItemRemote.Spin:FireServer("")
end)

local BuyStopSignButton = Shop:NewButton("Buy Hamon Manual", function()
    game:GetService("ReplicatedStorage").BuyItemRemote.Hamon:FireServer("")
end)


local BuyStoneMaskButton = Shop:NewButton("Buy Stone Mask", function()
    game:GetService("ReplicatedStorage").BuyItemRemote.Vampire:FireServer("")
end)

local BuyMysteriousCameraButton = Shop:NewButton("Buy Mysterious Camera", function()
    game:GetService("ReplicatedStorage").BuyItemRemote.Camera:FireServer("")
end)

local Visual = Init:NewTab("Visual")

local ShowCashToggler = Visual:NewToggle("Show Cash", false, function(value) 
        player.PlayerGui.Menu.Currencies.Visible = value
end)

local CameraFixedToggle = Visual:NewToggle("Fix the camera", false, function(value)
    _G.CameraFixedValue = value
    if (_G.CameraFixedValue == true) then 
        Camera.CameraType = "Follow";
        Camera.CameraSubject = hrp; 
    elseif (_G.CameraFixedValue == false) then 
        Camera.CameraType = "Follow";
        Camera.CameraSubject = Humanoid; 
    end
end)

local SCRBlurDisabler = Visual:NewButton("Silver Chariot Requieum's blur disabler ", function(value)
    for i,v in pairs(getreg()) do 
        if type(v) == 'function' and islclosure(v) and not is_synapse_function(v) then 
            local Consts = getconstants(v);
            if table.find(Consts, "Blur") and table.find(Consts, "Size") then
                getreg()[i] = function() 
                    return nil
                end
            end
        end
    end
    
end)

NextFrame:Connect(function()
    task.wait(1)
    if (_G.CameraFixedValue == true) then
        Camera.CameraType = "Follow";
        Camera.CameraSubject = hrp; 
    else
        Camera.CameraType = "Follow";
        Camera.CameraSubject = Humanoid; 
    end
end)

local FinishedLoading = Notif:Notify("Loaded Arixor v1.0.0", 4, "success")
