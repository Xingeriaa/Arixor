local RunService = game:GetService("RunService");

local LocalPlayer = game:GetService("Players").LocalPlayer;
local Character = LocalPlayer.Character;

local PlantRange = 20;

-- _G.InToggle = false;
-- RunService.Stepped:Connect(function()
--     if _G.InToggle == false then
--         _G.InToggle = true;
print("executed")
        local HRP = Character:FindFirstChild("HumanoidRootPart");
        if HRP == true then
            print("1")
            for i,v in pairs(workspace.Deployables:GetChildren()) do
                if v ~= nil and v.Name == "Plant Box" and v.Part ~= nil and math.round((HRP.Position - v.Part.Position).magnitude) <= PlantRange then 
                    print("2")
                    if v:FindFirstChild("Bloodfruit") ~= nil then 
                        local args = {
                            [1] = v,
                            [2] = "Bloodfruit"
                        }
                        game:GetService("ReplicatedStorage").Events.InteractStructure:FireServer(unpack(args))
                        print("Planted")
                    end
                end
            end
        end
--         _G.InToggle = false;
--     end
-- end)

