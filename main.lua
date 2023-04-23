local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()

library.rank = "Premium"
local Wm = library:Watermark("NIGGA KILL YOURSELF | v" .. "1.0.0" .. " | " .. library:GetUsername() .. " | rank: " .. library.rank)
local FpsWm = Wm:AddWatermark("fps: " .. library.fps)
local Notif = library:InitNotifications()
coroutine.wrap(function()
    while wait(.75) do 
        FpsWm:Text("fps: " .. library.fps)
    end
end)()
library.title = "NIGGA KILL YOURSELF"


local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait() 
local hrp = char:WaitForChild("HumanoidRootPart")
local Humanoid = char:WaitForChild("Humanoid");
local Camera = workspace.Camera;
local Lighting = game:GetService("Lighting");
local UIS = game:GetService("UserInputService");
player.CharacterAdded:Connect(function(character) 
    char = character
    hrp = character:WaitForChild("HumanoidRootPart")
    Humanoid = character:WaitForChild("Humanoid")
end)

local Player = game.Players.LocalPlayer;
local Char = Player.Character or Player.CharacterAdded:Wait(); 
local HRP = Char:WaitForChild("HumanoidRootPart");

local function ResetCharacter()
    local BeforeDieCFrame = HRP.CFrame;
    HRP:Remove();
    task.wait(.4);
    Char = Player.Character or Player.CharacterAdded:Wait(); 
    HRP = Char:WaitForChild("HumanoidRootPart");
    task.wait()
    HRP.CFrame = BeforeDieCFrame;
end

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

local InstantCollectItems = items:NewButton("Instant Collect Items (Use at your risk)", function()
    for i, v in pairs(game:GetService("Workspace").Item:GetChildren()) do 
        if v and v:IsA("Part") and v:FindFirstChild("ProximityPrompt") and v.Position.Y > -50 then 
            hrp.CFrame = v.CFrame * CFrame.new(0,5,7);
            task.wait(.2);
            fireproximityprompt(v:FindFirstChild("ProximityPrompt"), math.round((hrp.Position-v.Position).magnitude));
            task.wait(.2);
        end
    end
end)

local InstantSellAllItems = items:NewButton("Instant Sell All Items", function()
    for i, v in pairs(player    .Backpack:GetChildren()) do 
        if v and v:IsA("Tool") then
            sell(v.Name);
            task.wait();
        end
    end
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

local function TalkToNpc(NPC)  
    for i,v in pairs(game:GetService("Workspace").Map.NPCs:GetChildren()) do 
        if v and v:FindFirstChild("ClickDetector") and string.find(v.Name, NPC) then
            fireclickdetector(v:FindFirstChild("ClickDetector"));
        end
    end
end

local Character = Init:NewTab("Character");

local InstantReset = Character:NewKeybind("Instant Reset", Enum.KeyCode.Semicolon, function(key)
    if key then 
        ResetCharacter();
    end
end)

local Troll = Init:NewTab("Troll");

local FloatPlayer = Troll:NewTextbox("Float Player", "", "Player's name", "all", "medium", true, false, function(val)
    if Player.Data.Stand.Value == 1 then 
        ResetCharacter();
        wait(.3)
        tpplr(val);
        game:GetService("ReplicatedStorage").StandlessRemote.Barrage:FireServer(false); task.wait()
        game:GetService("ReplicatedStorage").StandlessRemote.Barrage:FireServer(false); task.wait()
        game:GetService("ReplicatedStorage").StandlessRemote.Barrage:FireServer(false); task.wait()
        game:GetService("ReplicatedStorage").StandlessRemote.Barrage:FireServer(false); task.wait()
        task.wait(1.3);
        ResetCharacter();
    end
end)


local NPC = Init:NewTab("NPC");

local Asakura = NPC:NewButton("Talk to Asakura", function()
    TalkToNpc("Asakura");
end)

local Hikarishi = NPC:NewButton("Talk to Hikarishi", function()
    TalkToNpc("Hikarishi");
end)

local Luna = NPC:NewButton("Talk to Luna", function()
    TalkToNpc("Luna");
end)

local Syrentia = NPC:NewButton("Talk to Syrentia", function()
    TalkToNpc("Syrentia");
end)

local Simplrr = NPC:NewButton("Talk to Simplrr", function()
    TalkToNpc("Simplrr");
end)

local XZ_LF = NPC:NewButton("Talk to XZ_LF", function()
    TalkToNpc("XZ_LF");
end)

local TrueSwordsMan = NPC:NewButton("Talk to TrueSwordsMan", function()
    TalkToNpc("TrueSwordsMan");
end)

local Blacko Coffee = NPC:NewButton("Talk to Blacko Coffee", function()
    TalkToNpc("Blacko Coffee");
end)

local Auddy = NPC:NewButton("Talk to Auddy", function()
    TalkToNpc("Auddy");
end)

local Gojo = NPC:NewButton("Talk to Gojo", function()
    TalkToNpc("Gojo");
end)

local Drago = NPC:NewButton("Talk to Drago", function()
    TalkToNpc("Drago");
end)

local Faith = NPC:NewButton("Talk to Faith", function()
    TalkToNpc("Faith");
end)

local AllMight = NPC:NewButton("Talk to AllMight", function()
    TalkToNpc("AllMight");
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
    
local ColorList = {
    BarrelColor = Color3.new(0.5411764705882353, 0.3254901960784314, 0),
    BoxColor = Color3.new(0.9803921568627451, 0.9058823529411765, 0.4745098039215686),
    ChestColor = Color3.new(1, 0.6823529411764706, 0),
    EggColor = Color3.new(0.7607843137254902, 0.3764705882352941, 0.9803921568627451),   
}

local function ESP(Object, Color) 
    local BillboardGui = Instance.new("BillboardGui", Object);
    BillboardGui.Size = UDim2.new(0, 100,0, 25);
    BillboardGui.Active = true;
    BillboardGui.AlwaysOnTop = true;
    BillboardGui.LightInfluence = 1;
    BillboardGui.StudsOffsetWorldSpace = Vector3.new(0,2.8,0)

    local Text = Instance.new("TextLabel", BillboardGui);
    Text.BackgroundTransparency = 1;
    Text.Size = UDim2.new(0, 100,0, 25);
    Text.Text = "";
    Text.TextColor3 = Color;
    Text.TextScaled = true;
    Text.TextSize = 11;

    local Outline = Instance.new("UIStroke", Text);
    Outline.Thickness = 0.3;
end

local ESPMasterSwitch = Visual:NewToggle("ESP Master Switch", false, function(value) 
    _G.ItemESPToggler = value;
    if _G.ItemESPToggler then 
        for i,v in pairs(game:GetService("Workspace").Item:GetChildren()) do 
            if v ~= nil and v.Position.Y > -40 then 
                if v.Name == "Chest" then
                    ESP(v, ColorList.ChestColor);
                elseif v.Name == "Box" then
                    ESP(v, ColorList.BoxColor);
                elseif v.Name == "Barrel" then
                    ESP(v, ColorList.BarrelColor);
                else 
                    ESP(v, Color3.new(1, 1, 1));
                end
            end
        end
    else
        for i,v in pairs(game:GetService("Workspace").Item:GetChildren()) do 
            if v ~= nil and v:FindFirstChildWhichIsA("BillboardGui") then 
                v:FindFirstChildWhichIsA("BillboardGui"):Destroy();
            end
        end
    end
end)

game:GetService("Workspace").Item.ChildAdded:Connect(function(Item)
    if _G.ItemESPToggler and Item ~= nil and Item.Position.Y > -40 then 
        if Item.Name == "Chest" then
            ESP(Item, ColorList.ChestColor);
        elseif Item.Name == "Box" then
            ESP(Item, ColorList.BoxColor);
        elseif Item.Name == "Barrel" then
            ESP(Item, ColorList.BarrelColor);
        else 
            ESP(v, Color3.new(1, 1, 1));
        end
    end
end)

local VisualSection1 = Visual:NewSection("Item ESP's config");



local ItemNameESPToggler = Visual:NewToggle("Item's name", false, function(value)
    _G.ItemNameESP = value;
end)

local ItemDistanceESPToggler = Visual:NewToggle("Item's distance", false, function(value)
    _G.ItemDistanceESP = value;
end)

game:GetService("RunService").Stepped:Connect(function()
    for i, v in pairs(game:GetService("Workspace").Item:GetChildren()) do 
        if _G.ItemESPToggler and v:IsA("Part") and v ~= nil and v.Position.Y > -40 and v:FindFirstChildWhichIsA("BillboardGui") then
            hrp = char:WaitForChild("HumanoidRootPart");
            local Distance = math.round((hrp.Position-v.Position).magnitude);
            if _G.ItemDistanceESP and _G.ItemNameESP then
                v:FindFirstChildWhichIsA("BillboardGui").TextLabel.Text = v.Name.."\n"..Distance.."m Away";
                wait(.2)
            elseif _G.ItemNameESP then
                v:FindFirstChildWhichIsA("BillboardGui").TextLabel.Text = v.Name;
                wait(.2)
            elseif _G.ItemDistanceESP then
                v:FindFirstChildWhichIsA("BillboardGui").TextLabel.Text = Distance.."m Away";
                wait(.2)
            end
        end
    end
end)

local VisualSection2 = Visual:NewSection("Misc");


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

local AntiBlurButton = Visual:NewButton("Anti Blur", function()
    if Lighting:FindFirstChild("Blur") then 
        Lighting:FindFirstChild("Blur"):Destroy();
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

local Setting = Init:NewTab("Setting")

local ArixorKeybind = Setting:NewKeybind("Arixor Keybind", Enum.KeyCode.RightAlt, function(Key)
    if Key then 
        Init:UpdateKeybind(Enum.KeyCode[Key]);
    end
end)


local FinishedLoading = Notif:Notify("Loaded Arixor v1.0.0", 4, "success")
