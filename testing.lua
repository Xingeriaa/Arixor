local RunService = game:GetService("RunService");

local LocalPlayer = game:GetService("Players").LocalPlayer;
local Character = LocalPlayer.Character;

local PlantRange = 20;

_G.InToggle = false;
RunService.Stepped:Connect(function()
    if _G.InToggle == false then
        _G.InToggle = true;
        if Character:FindFirstChild("HumanoidRootPart") then
            for i,v in pairs(workspace.Deployables:GetChildren()) do
                if v ~= nil and v.Name == "Plant Box" and v.Part ~= nil then 
                    if math.round((Character:FindFirstChild("HumanoidRootPart").Position - v.Part.Position).Magnitude) < 30 then 
                        local args = {
                            [1] = v,
                            [2] = "Bloodfruit"
                        }
                        game:GetService("ReplicatedStorage").Events.InteractStructure:FireServer(unpack(args))
                        print("Planted")
                    end
                end
                wait(1)
            end
        end
        _G.InToggle = false;
    end
end)

