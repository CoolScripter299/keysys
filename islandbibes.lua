local OrionLib = loadstring(game:HttpGet(('https://gist.githubusercontent.com/alt-er1/048a3633cc4752e578fe8386a554e087/raw/a2ebc46e4912c6eaf1f0d06d0f45cf7db477f025/DevInc.lua')))()
local Window = OrionLib:MakeWindow({Name = "Island bribes", HidePremium = false,IntroText = "eeak!",IntroEnabled = true, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Infinite Yield

loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

-- tabs

local Combat = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Misc = Window:MakeTab({
	Name = "Main Stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Teleports = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local OtherStuff = Window:MakeTab({
	Name = "Teleports(miscs)",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Orestuff = Window:MakeTab({
	Name = "Ore",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Chests = Window:MakeTab({
	Name = "Treasure Chests",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Playertp = Window:MakeTab({
	Name = "Tp To player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local AutoSell = Window:MakeTab({
	Name = "AutoSell",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--Gloabals
_G.KillAura = false
_G.WaterSpeed = false
_G.ExtraSpeed = false
_G.ItemEsp = false
Whitelist_table = {}
tptoplayer_Table = {}
OpKillAuraTable = {}
itemesptype = 'None'
_G.ZenyteBoss = false
_G.MobAura = false
_G.ObsidianBoss = false
_G.SpiritBoss = false
_G.MineAura = false
_G.SuperSpeed = false
_G.OgreAura = false
_G.SafeDeath = false
_G.LuckySlime = false
_G.EvilSkeleton = false
_G.OpKillAura = false
_G.LuckyBoss = false
--Functions

function AutoPickup()
    local function passives()
        for i, v in pairs(game:GetService("Workspace").Replicators.NonPassive:GetChildren()) do
            if v:IsA('Model') then
                if string.find(v.Name, 'Raft') or string.find(v.Name, 'Wall') or string.find(v.Name, 'Pet') or string.find(v.Name, 'Gate') or string.find(v.Name, 'Furnace') or string.find(v.Name, 'Box') or string.find(v.Name, 'Chest') or string.find(v.Name, 'Totem') or string.find(v.Name, 'Bridge') or string.find(v.Name, 'Cart') or string.find(v.Name, 'Torch') or string.find(v.Name, 'Teepee') or string.find(v.Name, 'Base') or string.find(v.Name, 'Ladder') or string.find(v.Name, 'Arrow') or string.find(v.Name, 'Bed') or string.find(v.Name, 'Aura') or string.find(v.Name, 'Evil') or string.find(v.Name, 'Golem') or string.find(v.Name, 'Spirit') or string.find(v.Name, 'Portal') then
                    v = nil
                else
                    local objpos = v:GetPivot()
                    local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hum = hum.Position
                    if (hum - Vector3.new(objpos.X, objpos.Y, objpos.Z)).magnitude < 18.5 then
                        task.wait(.18)
                        game:GetService("ReplicatedStorage").References.Comm.Events.ItemInteracted:FireServer(v, "Pickup")
                    end
                end
            end
        end
    end
    local function workspaceitems()
        for i2, v2 in pairs(game.Workspace:GetChildren()) do
            if v2:IsA('Model') then
                if v2:FindFirstChildOfClass('MeshPart') and v2:FindFirstChild('Humanoid') == nil then
                    local objpos = v2:GetPivot()
                    local pos = game.Players.LocalPlayer.Character.HumanoidRootPart
                    pos = pos.Position
                    if (pos - Vector3.new(objpos.X, objpos.Y, objpos.Z)).magnitude < 18.5 then
                        task.wait(.18)
                        game:GetService("ReplicatedStorage").References.Comm.Events.ItemInteracted:FireServer(v2, "Pickup")
                    end
                end
            end
        end
    end
    local function getbothitems()
        for i, v in pairs(game:GetService("Workspace").Replicators.Both:GetChildren()) do
            if v.Name == 'Obsidian' then
                local objpos = v:GetPivot()
                local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                hum = hum.Position
                if (hum - Vector3.new(objpos.X, objpos.Y, objpos.Z)).magnitude < 18.5 then
                    task.wait(.18)
                    game:GetService("ReplicatedStorage").References.Comm.Events.ItemInteracted:FireServer(v, "Pickup")
                end
            end
        end
    end
    passives()
    task.wait(0.5)
    workspaceitems()
    task.wait(0.5)
    getbothitems()
end

function KillAura()
    while _G.KillAura == true do
        if _G.KillAura == true then
            task.wait()
            local function getwhitetable()
                for i2, v2 in pairs(Whitelist_table) do
                    if v2 ~= nil then
                        return tostring(v2)
                    end
                end
            end
            local function getclosestplayer()
                local range = 45
                local closest = nil
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v ~= game.Players.LocalPlayer and v.Name ~= getwhitetable() and v.Character and v.Character:FindFirstChild('HumanoidRootPart') and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                        local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                        hum = hum.Position
                        local plr = v.Character.HumanoidRootPart
                        plr = plr.Position
                        local dist = (hum - plr).magnitude
                        if dist < range then
                            range = dist
                            closest = v.Character
                        end
                    end
                end
                return closest
            end
            if getclosestplayer() then
                
                local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                ToolAction:FireServer(getclosestplayer())
            end
        end
    end
end

function OpKillAura()
    while _G.OpKillAura == true do
        if _G.OpKillAura == true then
            task.wait()
            if OpKillAuraTable[1] then
                local enemy = OpKillAuraTable[1].HumanoidRootPart
                enemy = enemy.Position
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(enemy + Vector3.new(0, -12, 0))
                if game.Players.LocalPlayer.Character.Humanoid.Health <= 25 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7137, 73, 18673)
                    OrionLib:MakeNotification({
                    Name = "You are low!",
                    Content = "I have placed you somewhere secret, Re-Enable and heal up before you fight again",
                    Image = "rbxassetid://4483345998",
                    Time = 1292
                    })
                return end
                local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                hum = hum.Position
                if (hum - enemy).magnitude < 100 then
                    local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                    ToolAction:FireServer(OpKillAuraTable[1])
                    if _G.OpKillAura == false and game.Players.LocalPlayer.Character.Humanoid.Health > 25 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(enemy + Vector3.new(0, 20, 0))
                    end
                end
            end
        end
    end
end

function SafeDeath()
    while _G.SafeDeath == true do
        if _G.SafeDeath == true then
            task.wait()
            local chr = game.Players.LocalPlayer.Character
            if chr.Humanoid.Health <= 25 then
                chr.HumanoidRootPart.CFrame = CFrame.new(7137, 73, 18673)
                OrionLib:MakeNotification({
                    Name = "You have been saved from Death!",
                    Content = "The Arc Angels have saved you! To go back, teleport somewhere in the teleport Section(re toggle for the Angels to save you again)",
                    Image = "rbxassetid://4483345998",
                    Time = 13
                })
            return end
        end
    end
end

function MobAura()
    while _G.MobAura == true do
        if _G.MobAura == true then
            task.wait(.15)
            local function getclosestmob()
                local range = 30
                local closestmob = nil
                for i2, v2 in pairs(game:GetService("Workspace").Replicators.Both:GetChildren()) do
                    if v2:FindFirstChild('HumanoidRootPart') then
                        if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                            local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                            hum = hum.Position
                            local mob = v2.HumanoidRootPart or v.HumanoidRootPart
                            mob = mob.Position
                            local dist = (hum - mob).magnitude
                            if dist < range then
                                range = dist
                                closestmob = v2
                            end
                        end
                    end
                end
                return closestmob
            end
            if getclosestmob() then
                local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                ToolAction:FireServer(getclosestmob())
            end
        end
    end
end

function MineAura()
    while _G.MineAura == true do
        if _G.MineAura == true then
            task.wait(0.3)
            local function getclosestore()
                local range = 21
                local closestore = nil
                local plr = game.Players.LocalPlayer
                for i, v in pairs(game:GetService("Workspace").Replicators.Both:GetChildren()) do
                    if plr.Character:FindFirstChild('HumanoidRootPart') and plr.Character:FindFirstChild('Humanoid') then
                        if string.find(v.Name, 'Rock') or string.find(v.Name, 'Tree') then
                            local obj = v:GetPivot()
                            local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                            hum = hum.Position
                            local dist = (hum - Vector3.new(obj.X, obj.Y, obj.Z)).magnitude
                            if dist < range then
                                range = dist
                                closestore = v
                            end
                        end
                    end
                end
                return closestore
            end
            if getclosestore() then
                local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                ToolAction:FireServer(getclosestore())
            end
        end
    end
end

function ExtraSpeed()
    while _G.ExtraSpeed == true do
        if _G.ExtraSpeed == true then
            task.wait()
            if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 21
            end
        end
    end
end

function WaterSpeed()
    while _G.WaterSpeed == true do
        if _G.WaterSpeed == true then
            task.wait()
            if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') then
                local hum = game.Players.LocalPlayer.Character.Humanoid
                if hum:GetState() == Enum.HumanoidStateType.Swimming then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 29.5
                end
            end
        end
    end
end

function SuperSpeed()
    while _G.SuperSpeed == true do
        if _G.SuperSpeed == true then
            task.wait()
            if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedthingy
            end
        end
    end
end

function ItemEsp()
    while _G.ItemEsp == true do
        if _G.ItemEsp == true then
            task.wait(1)
            if itemesptype == 'Volcanic Rock' then
                for i2, v2 in pairs(workspace:GetChildren()) do
                    if string.find(v2.Name, 'Volcanic Rock') then
                        if v2:FindFirstChild('itemesplol', true) then return end
                        local a = Instance.new("BillboardGui",v2)
                        a.Name = "itemesplol"
                        a.Size = UDim2.new(5,0, 5,0)
                        a.AlwaysOnTop = true
                        local b = Instance.new('Frame', a)
                        b.Size = UDim2.new(1.5,0, 1.5,0)
                        b.BackgroundTransparency = 0.80
                        b.BorderSizePixel = 0
                        b.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        b.BorderColor3 = Color3.fromRGB(255, 0, 0)
                    end
                end
            else
                for i, v in pairs(game:GetService("Workspace").Replicators:GetDescendants()) do
                    if string.find(v.Name, itemesptype) then
                        if v.PrimaryPart then
                            local obj = v.PrimaryPart
                            obj = obj.Position
                            local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                            hum = hum.Position
                            if (obj - hum).magnitude < itemespdistance then
                                if v:FindFirstChild('itemesplol', true) then return end
                                local a = Instance.new("BillboardGui",v)
                                a.Name = "itemesplol"
                                a.Size = UDim2.new(5,0, 5,0)
                                a.AlwaysOnTop = true
                                local b = Instance.new('Frame', a)
                                b.Size = UDim2.new(1.5,0, 1.5,0)
                                b.BackgroundTransparency = 0.80
                                b.BorderSizePixel = 0
                                b.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                                b.BorderColor3 = Color3.fromRGB(255, 0, 0)
                            end
                        end
                    end
                end
            end
        end
    end
end

function ZenyteBoss()
    while _G.ZenyteBoss == true do
        if _G.ZenyteBoss == true then
            task.wait()
            local plr = game.Players.LocalPlayer.Character
            if game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Zenyte Golem') and plr:FindFirstChild('HumanoidRootPart') and plr:FindFirstChild('Humanoid') then
                local golem = game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Zenyte Golem')
                if golem:FindFirstChild('HumanoidRootPart') then
                    if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                        if game:GetService("Workspace").Map["Zenyte Boss Cave"]:FindFirstChild("Gem Clusters") then
                            game:GetService("Workspace").Map["Zenyte Boss Cave"]:FindFirstChild("Gem Clusters"):Destroy()
                        end
                        local zenpos = golem.HumanoidRootPart
                        zenpos = zenpos.Position
                        local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                        hum = hum.Position
                        if golem.Humanoid.Health > 50 then
                            plr.HumanoidRootPart.CFrame = CFrame.new(zenpos + Vector3.new(-10, 12, 0))
                        else
                            plr.HumanoidRootPart.CFrame = CFrame.new(zenpos + Vector3.new(0, 15, 0))
                        end
                        if (zenpos - hum).magnitude < 30 then
                            local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                            ToolAction:FireServer(golem)
                        end
                    end
                end
            end
        end
    end
end

function LuckyBoss()
    while _G.LuckyBoss == true do
        if _G.LuckyBoss == true then
            task.wait()
            local plr = game.Players.LocalPlayer.Character
            if game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Lucky Golem') and plr:FindFirstChild('HumanoidRootPart') and plr:FindFirstChild('Humanoid') then
                local golem = game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Lucky Golem')
                if golem:FindFirstChild('HumanoidRootPart') then
                    local zenpos = golem.HumanoidRootPart
                    zenpos = zenpos.Position
                    local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hum = hum.Position
                    if golem.Humanoid.Health > 50 then
                        plr.HumanoidRootPart.CFrame = CFrame.new(zenpos + Vector3.new(-10, 12, 0))
                    else
                        plr.HumanoidRootPart.CFrame = CFrame.new(zenpos + Vector3.new(0, 15, 0))
                    end
                    if (zenpos - hum).magnitude < 30 then
                        local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                        ToolAction:FireServer(golem)
                    end
                end
            end
        end
    end
end

function ObsidianBoss()
    while _G.ObsidianBoss == true do
        if _G.ObsidianBoss == true then
            task.wait()
            local plr = game.Players.LocalPlayer.Character
            if game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Obsidian Golem') and plr:FindFirstChild('HumanoidRootPart') and plr:FindFirstChild('Humanoid') then
                local golem = game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Obsidian Golem')
                if golem:FindFirstChild('HumanoidRootPart') then
                    local obpos = golem.HumanoidRootPart
                    obpos = obpos.Position
                    local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hum = hum.Position
                    if golem.Humanoid.Health > 50 then
                        plr.HumanoidRootPart.CFrame = CFrame.new(obpos + Vector3.new(-10, 12, 0))
                    else
                        plr.HumanoidRootPart.CFrame = CFrame.new(obpos + Vector3.new(0, 15, 0))
                    end
                    if (obpos - hum).magnitude < 30 then
                        local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                        ToolAction:FireServer(golem)
                    end
                else
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-742, 50, -3570)
                end
            end
        end
    end
end

function SpiritBoss()
    while _G.SpiritBoss == true do
        if _G.SpiritBoss == true then
            task.wait()
            local plr = game.Players.LocalPlayer.Character
            if game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Mushroom Spirit') and plr:FindFirstChild('HumanoidRootPart') and plr:FindFirstChild('Humanoid') then
                local golem = game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Mushroom Spirit')
                if golem:FindFirstChild('HumanoidRootPart') then
                    local obpos = golem.HumanoidRootPart
                    obpos = obpos.Position
                    local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hum = hum.Position
                    if golem.Humanoid.Health > 50 then
                        game:GetService('TweenService'):Create(plr.HumanoidRootPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {CFrame = CFrame.new(obpos + Vector3.new(-13, 18.5, 0))}):Play()
                    else
                        plr.HumanoidRootPart.CFrame = CFrame.new(obpos + Vector3.new(0, 15, 0))
                    end
                    if (obpos - hum).magnitude < 30 then
                        local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                        ToolAction:FireServer(golem)
                    end
                end
            end
        end
    end
end

function OgreAura()
    while _G.OgreAura == true do
        if _G.OgreAura == true then
            task.wait()
            local plr = game.Players.LocalPlayer.Character
            if game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Ogre') and plr:FindFirstChild('HumanoidRootPart') and plr:FindFirstChild('Humanoid') then
                local golem = game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Ogre')
                if golem:FindFirstChild('HumanoidRootPart') then
                    local obpos = golem.HumanoidRootPart
                    obpos = obpos.Position
                    local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hum = hum.Position
                    if golem.Humanoid.Health > 50 then
                        plr.HumanoidRootPart.CFrame = CFrame.new(obpos + Vector3.new(-10, 12, 0))
                    else
                        plr.HumanoidRootPart.CFrame = CFrame.new(obpos + Vector3.new(0, 15, 0))
                    end
                    if (obpos - hum).magnitude < 30 then
                        local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                        ToolAction:FireServer(golem)
                    end
                end
            end
        end
    end
end

function LuckySlime()
    while _G.LuckySlime == true do
        if _G.LuckySlime == true then
            task.wait()
            local plr = game.Players.LocalPlayer.Character
            if game:GetService("Workspace").Replicators.Both:FindFirstChild('Lucky Slime') and plr:FindFirstChild('HumanoidRootPart') and plr:FindFirstChild('Humanoid') then
                local golem = game:GetService("Workspace").Replicators.Both:FindFirstChild('Lucky Slime')
                if golem:FindFirstChild('HumanoidRootPart') then
                    local obpos = golem.HumanoidRootPart
                    obpos = obpos.Position
                    local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hum = hum.Position
                    plr.HumanoidRootPart.CFrame = CFrame.new(obpos + Vector3.new(-14.4, 10, 0))
                    if (obpos - hum).magnitude < 30 then
                        local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                        ToolAction:FireServer(golem)
                    end
                end
            end
        end
    end
end

function EvilSkeleton()
    while _G.EvilSkeleton == true do
        if _G.EvilSkeleton == true then
            task.wait()
            local plr = game.Players.LocalPlayer.Character
            if game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Evil Skeleton') and plr:FindFirstChild('HumanoidRootPart') and plr:FindFirstChild('Humanoid') then
                local golem = game:GetService("Workspace").Replicators.NonPassive:FindFirstChild('Evil Skeleton')
                if golem:FindFirstChild('HumanoidRootPart') then
                    local obpos = golem.HumanoidRootPart
                    obpos = obpos.Position
                    local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hum = hum.Position
                    if golem.Humanoid.Health > 50 then
                        plr.HumanoidRootPart.CFrame = CFrame.new(obpos + Vector3.new(0, -15, 0))
                    else
                        plr.HumanoidRootPart.CFrame = CFrame.new(obpos + Vector3.new(0, 17.5, 0))
                    end
                    if (obpos - hum).magnitude < 30 then
                        local ToolAction = game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction
                        ToolAction:FireServer(golem)
                    end
                end
            end
        end
    end
end

--Gui Stuff

Combat:AddToggle({
    Name = 'Kill Aura',
    Default = false,
    Callback = function(Value)
       _G.KillAura = Value
       KillAura()
    end
})

Combat:AddToggle({
    Name = 'Escape Death(toggle anticheat)',
    Default = false,
    Callback = function(Value)
       _G.SafeDeath = Value
       SafeDeath()
    end
})

Combat:AddTextbox({
    Name = 'Whitelist Person(Kill Aura)',
    Default = '',
    TextDisappear = true,
    Callback = function(args)
        for i, v in pairs(game.Players:GetPlayers()) do
            if string.find(v.Name, tostring(args)) then
                plr = v.Name
                table.insert(Whitelist_table, plr)
                OrionLib:MakeNotification({
                    Name = "Player Added To WhiteList",
                    Content = plr .. ' was added to the whitelist table',
                    Image = "rbxassetid://4483345998",
                    Time = 6
                })
            end
        end
    end
})

Combat:AddTextbox({
    Name = 'Remove Whitelisted Person(Kill Aura)',
    Default = '',
    TextDisappear = true,
    Callback = function(args)
        for i, v in pairs(game.Players:GetPlayers()) do
            if string.find(v.Name, tostring(args)) then
                plr = v.Name
                for i2, v2 in pairs(Whitelist_table) do
                    if v2 == plr then
                        v2 = i2
                        table.remove(Whitelist_table, v2)
                        OrionLib:MakeNotification({
                            Name = "Player Added To WhiteList",
                            Content = plr .. ' was removed from whitelist table',
                            Image = "rbxassetid://4483345998",
                            Time = 6
                        })
                    end
                end
            end
        end
    end
})

Combat:AddToggle({
    Name = 'Mob Aura(not subject to evil chicken/skeleton)',
    Default = false,
    Callback = function(Value)
       _G.MobAura = Value
       MobAura()
    end
})

Combat:AddSection({
    Name = 'Bypass anticheat for the easiest possible kill'
})

Combat:AddToggle({
    Name = 'Spirit Boss Aura',
    Default = false,
    Callback = function(Value)
       _G.SpiritBoss = Value
       SpiritBoss()
    end
})

Combat:AddToggle({
    Name = 'Zenyte Boss Aura',
    Default = false,
    Callback = function(Value)
       _G.ZenyteBoss = Value
       ZenyteBoss()
    end
})

Combat:AddToggle({
    Name = 'Lucky Boss Aura',
    Default = false,
    Callback = function(Value)
       _G.LuckyBoss = Value
       LuckyBoss()
    end
})

Combat:AddToggle({
    Name = 'Obsidian Boss Aura',
    Default = false,
    Callback = function(Value)
       _G.ObsidianBoss = Value
       ObsidianBoss()
    end
})

Combat:AddToggle({
    Name = 'Ogre Aura',
    Default = false,
    Callback = function(Value)
       _G.OgreAura = Value
       OgreAura()
    end
})

Combat:AddToggle({
    Name = 'Lucky Slime Aura',
    Default = false,
    Callback = function(Value)
       _G.LuckySlime = Value
       LuckySlime()
    end
})

Combat:AddToggle({
    Name = 'Evil Skeleton Aura',
    Default = false,
    Callback = function(Value)
       _G.EvilSkeleton = Value
        EvilSkeleton()
    end
})

Misc:AddButton({
    Name = 'AntiCheat Bypasser(uneqip stuff; prevents glitches)',
    Callback = function()
        for i=1,250 do
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7127, 221, 18883)
        end
        wait(1.5)
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            v:Destroy()
        end
        OrionLib:MakeNotification({
            Name = "Youre a Shame",
            Content = 'Bypassing Anticheat so you can bully little kids?? Shame on you...(i do the exact same thing)',
            Image = "rbxassetid://4483345998",
            Time = 8
        })
        wait(2)
        OrionLib:MakeNotification({
            Name = "Go Crazy",
            Content = 'Anti-Cheat bypassed because im a fucking G, this will bypass until you leave :)',
            Image = "rbxassetid://4483345998",
            Time = 8
        })
    end
})

Misc:AddBind({
    Name = 'AutoPickup',
    Default = Enum.KeyCode.X,
    Hold = false,
    Callback = function()
       AutoPickup() 
    end
})

Misc:AddButton({
    Name = 'Go invisible',
    Callback = function()
       local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart
       oldpos = oldpos.Position
       wait(0.2)
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7137, 73, 18673)
       wait(1)
       for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("Motor6D") then
                if v.Parent ~= 'Head' or v.Parent ~= 'UpperTorso' or v.Parent ~= 'LowerTorso' then
                   v:Destroy()
                end
            end
        end
        wait(1.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldpos)
    end
})

Misc:AddButton({
    Name = 'Go Visible',
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

Misc:AddToggle({
    Name = 'Super Speed(toggle anticheat)',
    Default = false,
    Callback = function(Value)
       _G.SuperSpeed = Value 
       SuperSpeed()
    end
})

Misc:AddSlider({
    Name = 'SuperSpeed Speed',
    Min = 18,
	Max = 800,
	Default = 16,
	Color = Color3.fromRGB(60, 234, 176),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		speedthingy  = Value
	end 
})

Misc:AddToggle({
    Name = 'Mine Aura',
    Default = false,
    Callback = function(Value)
       _G.MineAura = Value
       MineAura()
    end
})

Misc:AddToggle({
    Name = 'Sneaky Speed',
    Default = false,
    Callback = function(Value)
       _G.ExtraSpeed = Value 
       ExtraSpeed()
    end
})

Misc:AddToggle({
    Name = 'Water Speed',
    Default = false,
    Callback = function(Value)
       _G.WaterSpeed = Value 
       WaterSpeed()
    end
})

Teleports:AddSection({
    Name = 'For any teleport, make sure to bypass anticheat'
})

Teleports:AddButton({
    Name = 'Lucky Slime',
    Callback = function()
        if game:GetService("Workspace").Replicators.Both:FindFirstChild("Lucky Slime") then
            local slime = game:GetService("Workspace").Replicators.Both["Lucky Slime"]
            if slime:FindFirstChild('Humanoid') and slime:FindFirstChild('HumanoidRootPart') then
                local slimpos = slime.HumanoidRootPart
                slimpos = slimpos.Position
                local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                hum.CFrame = CFrame.new(slimpos + Vector3.new(15, 0, 0))
            end
        else
            OrionLib:MakeNotification({
                Name = "No Lucky Slime Gangy",
                Content = 'A sad sad day... I know :(',
                Image = "rbxassetid://4483345998",
                Time = 6
            })
        end
    end
})

Teleports:AddButton({
    Name = 'Asteroid',
    Callback = function()
        if game.Workspace:FindFirstChild('Asteroid', true) then
            local ast = game.Workspace:FindFirstChild('Asteroid', true):GetPivot()
            local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
            hum.CFrame = CFrame.new(Vector3.new(ast.X, ast.Y, ast.Z) + Vector3.new(0, 35, 0))
        else
            OrionLib:MakeNotification({
                Name = "No Asteroids Gangy",
                Content = 'A sad sad day... I know :(',
                Image = "rbxassetid://4483345998",
                Time = 6
            })
        end
    end
})

Teleports:AddButton({
    Name = 'Pet Island',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(2889, 54, -6465)
    end
})

Teleports:AddButton({
    Name = 'Resource Trader',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(4288, 43, -4014)
    end
})

Teleports:AddButton({
    Name = 'Armor/Weapon Trader',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(427, 12, -3451)
    end
})

Teleports:AddButton({
    Name = 'Volcano',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(-842, 63, -3603)
    end
})

Teleports:AddButton({
    Name = 'Zenyte Boss',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(1741, -440, -4536)
    end
})

Teleports:AddButton({
    Name = 'Spirit Boss',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(1427, -293, -4959)
    end
})

Teleports:AddButton({
    Name = 'Magic Island',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(1292, 125, -7234)
    end
})

Teleports:AddButton({
    Name = 'Ice Biome',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(1961, -2, -3973)
    end
})

Teleports:AddButton({
    Name = 'Ocean Trader',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(1673, -290, -5659)
    end
})

Teleports:AddButton({
    Name = 'Volanic Furnace',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(2614, -454, -5579)
    end
})

Teleports:AddButton({
    Name = 'Central Caves',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(1532, -192, -4696)
    end
})

Teleports:AddButton({
    Name = 'Caves level 2',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(1559, -347, -4635)
    end
})

Teleports:AddButton({
    Name = 'Caves level 3',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(1581, -502, -4649)
    end
})

Teleports:AddButton({
    Name = 'Starter Island',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(-7507, 19, 7496)
    end
})

Teleports:AddButton({
    Name = 'Secret Island',
    Callback = function()
       local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
       hum.CFrame = CFrame.new(7139, 72, 18673)
    end
})

Orestuff:AddButton({
    Name = 'Tp Ore Finder',
    Callback = function()
        oretable = {}
        for i, v in pairs(Workspace:GetDescendants()) do
            if v.Name == itemesptype then
                if v:IsA('Model') and v.PrimaryPart then
                    local zenpos = v.PrimaryPart
                    zenpos = zenpos.Position
                    table.insert(oretable, zenpos)
                end
            end
        end
        if oretable[1] == nil then
            OrionLib:MakeNotification({
                Name = "No ".. itemesptype .. ' Gangy',
                Content = 'There is no '.. itemesptype .. ' :(',
                Image = "rbxassetid://4483345998",
                Time = 6
            })
        else
            local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
            hum.CFrame = CFrame.new(oretable[1] + Vector3.new(0, 5, 0))
            for i3, v3 in pairs(oretable) do
                v3 = nil
            end
        end
    end
})

Orestuff:AddDropdown({
    Name = 'Item Esp/Tp Finder Type',
    Default = 'Rock',
    Options = {'Lunar Rock', 'Volcanic Rock', 'Zenyte Rock', 'Diamond Rock', 'Gold Rock', 'Ruby Rock', 'Candy Rock', 'Coal Rock', 'Rock'},
    Callback = function(Value)
       itemesptype = Value 
    end
})

Orestuff:AddToggle({
    Name == 'Item Esp',
    Default = false,
    Callback = function(Value)
        _G.ItemEsp = Value 
        ItemEsp()
        if _G.ItemEsp == false then
            for i, v in pairs(game:GetService("Workspace").Replicators.Both:GetDescendants()) do
                if v.Name == 'itemesplol' then
                    v:Destroy()
                end
            end
        end
    end
})

Orestuff:AddSlider({
    Name = 'Esp Distance',
    Min = 50,
	Max = 10000,
	Default = 200,
	Color = Color3.fromRGB(60, 234, 176),
	Increment = 1,
	ValueName = "Studs",
	Callback = function(Value)
		itemespdistance  = Value
	end 
})

OtherStuff:AddButton({
    Name = 'Tp Finder',
    Callback = function()
        oretable1 = {}
        for i, v in pairs(Workspace:GetDescendants()) do
            if v.Name == itemesptype2 then
                if v:IsA('Model') and v.PrimaryPart then
                    local zenpos = v.PrimaryPart
                    zenpos = zenpos.Position
                    table.insert(oretable1, zenpos)
                end
            end
        end
        if oretable1[1] == nil then
            OrionLib:MakeNotification({
                Name = "No ".. itemesptype2 .. ' Gangy',
                Content = 'There is no '.. itemesptype2 .. ' :(',
                Image = "rbxassetid://4483345998",
                Time = 6
            })
        else
            local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
            hum.CFrame = CFrame.new(oretable1[1] + Vector3.new(-4, 6, 0))
            for i3, v3 in pairs(oretable1) do
                v = nil
            end
        end
    end
})

OtherStuff:AddDropdown({
    Name = 'Item Type',
    Default = 'Watermelon Patch',
    Options = {'Watermelon Patch', 'Potato Patch', 'Carrot Patch', 'Cabbage Patch', 'Small Oyster', 'Large Orange Shell', 'Large Pink Shell', 'Large White Shell', 'Small Orange Shell', 'Small Pink Shell', 'Small White Shell', 'Orange Slime', 'Green Slime', 'Blue Slime',},
    Callback = function(Value)
       itemesptype2 = Value 
    end
})

Chests:AddButton({
    Name = 'Spawn Easy Treaure Chest(100 tokens)',
    Callback = function()
        local args = {
        [1] = 1
        }
        game:GetService("ReplicatedStorage").References.Comm.Events.BuyWorldEvent:FireServer(unpack(args))
    end
})

Chests:AddButton({
    Name = 'Spawn Medium Treaure Chest(450 tokens)',
    Callback = function()
        local args = {
        [1] = 2
        }
        game:GetService("ReplicatedStorage").References.Comm.Events.BuyWorldEvent:FireServer(unpack(args))
    end
})

Chests:AddButton({
    Name = 'Spawn Hard Treaure Chest(1000 tokens)',
    Callback = function()
        local args = {
        [1] = 3
        }
        game:GetService("ReplicatedStorage").References.Comm.Events.BuyWorldEvent:FireServer(unpack(args))
    end
})

Chests:AddSection({
    Name = 'If there is no chests, you wont tp, also have anticheat bypass on'
})

Chests:AddButton({
    Name = 'Get Map Treaure',
    Callback = function()
        local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart
        oldpos = oldpos.Position
        for i, v in pairs(Workspace:GetDescendants()) do
            if string.find(v.Name, 'Treasure Chest') then
                chespos = v:GetPivot()
                local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
                hum.CFrame = CFrame.new(chespos.X, chespos.Y, chespos.Z)
                task.wait(1)
                game:GetService("ReplicatedStorage").References.Comm.Events.ItemInteracted:FireServer(v, "Pickup")
                task.wait(0.5)
                hum.CFrame = CFrame.new(oldpos)
            end
        end
    end
})


Playertp:AddTextbox({
    Name = 'Player Name(Case sensitive)',
    Default = '',
    TextDisappear = false,
    Callback = function(Value)
        for i, v in pairs(game.Players:GetPlayers()) do
            if string.find(v.Name, Value) or string.find(v.DisplayName, Value) then
                if v.Character:FindFirstChild('HumanoidRootPart') and v.Character:FindFirstChild('Humanoid') then
                    local getplrname = v.Name
                    local plr = v.Character.HumanoidRootPart
                    plr = plr.Position
                    table.insert(tptoplayer_Table, 1, plr)
                    OrionLib:MakeNotification({
                        Name = "You have entered ".. getplrname,
                        Content = 'If you want to tp to ' ..getplrname .. ', then click Confirm Tp',
                        Image = "rbxassetid://4483345998",
                        Time = 6
                    })
                end
            end
        end
    end
})

Playertp:AddButton({
    Name = 'Confirm Tp',
    Callback = function()
        if tptoplayer_Table[1] == nil then return end
        local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
        hum.CFrame = CFrame.new(tptoplayer_Table[1])
    end
})

Playertp:AddButton({
    Name = 'Cancel Tp',
    Callback = function()
        for i, v in pairs(tptoplayer_Table) do
            table.remove(tptoplayer_Table, i)
        end
        OrionLib:MakeNotification({
            Name = 'Canceled Tp',
            Content = 'You have cleared the tp list',
            Image = "rbxassetid://4483345998",
            Time = 6
        })
    end
})

Playertp:AddTextbox({
    Name = 'Op Kill Aura player name(Case sensitive)',
    Default = '',
    TextDisappear = false,
    Callback = function(Value)
        for i, v in pairs(game.Players:GetPlayers()) do
            if string.find(v.Name, Value) or string.find(v.DisplayName, Value) then
                if v.Character:FindFirstChild('HumanoidRootPart') and v.Character:FindFirstChild('Humanoid') then
                    local getplrname = v.Name
                    local plr = v.Character
                    table.insert(OpKillAuraTable, 1, plr)
                    OrionLib:MakeNotification({
                        Name = "You have entered ".. getplrname,
                        Content = 'You are going to target ' ..getplrname .. ' >:)',
                        Image = "rbxassetid://4483345998",
                        Time = 6
                    })
                end
            end
        end
    end
})

Playertp:AddToggle({
    Name = 'Op Kill Aura',
    Callback = function(Value)
        _G.OpKillAura = Value
        OpKillAura()
    end
})

AutoSell:AddSection({
    Name = 'Note: This does not account for pet token multipliers'
})

AutoSell:AddButton({
    Name = '4 Silver = 1 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 14)
    end
})

AutoSell:AddButton({
    Name = '4 Slime Ball = 1 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 15)
    end
})

AutoSell:AddButton({
    Name = '2 Gold = 1 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 16)
    end
})

AutoSell:AddButton({
    Name = '1 Ruby = 3 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 17)
    end
})

AutoSell:AddButton({
    Name = '1 Diamond = 4 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 18)
    end
})

AutoSell:AddButton({
    Name = '1 Soul = 5 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 22)
    end
})

AutoSell:AddButton({
    Name = '1 Zenyte = 6 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 19)
    end
})

AutoSell:AddButton({
    Name = '1 Volcanic Ore = 15 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 23)
    end
})

AutoSell:AddButton({
    Name = '1 Obsidian = 20 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 24)
    end
})

AutoSell:AddButton({
    Name = '1 Lunar Ore = 25 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 25)
    end
})

AutoSell:AddButton({
    Name = '1 Moonstone = 30 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Resource Trader", 30)
    end
})

AutoSell:AddSection({
    Name = 'Armor Trader',
})

AutoSell:AddButton({
    Name = 'Ruby Shield = 50 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 27)
    end
})

AutoSell:AddButton({
    Name = 'Diamond Shield = 100 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 28)
    end
})

AutoSell:AddButton({
    Name = 'Zenyte Shield = 150 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 29)
    end
})


AutoSell:AddButton({
    Name = 'Obsidian Shield = 350 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 29)
    end
})

AutoSell:AddButton({
    Name = 'Full Ruby Armor Set = 60 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 30)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 31)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 32)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 33)
    end
})

AutoSell:AddButton({
    Name = 'Full Diamond Armor Set = 108 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 34)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 35)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 36)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 37)
    end
})

AutoSell:AddButton({
    Name = 'Full Zenyte Armor Set = 180 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 38)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 39)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 40)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 41)
    end
})

AutoSell:AddButton({
    Name = 'Full Obsidian Armor Set = 460 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 42)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 43)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 44)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 45)
    end
})

AutoSell:AddButton({
    Name = 'Full Moostone Armor Set = 700 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 46)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 47)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 48)
        wait(0.4)
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 49)
    end
})

AutoSell:AddButton({
    Name = 'Springy Boots',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Armour Trader", 50)
    end
})

AutoSell:AddSection({
    Name = 'Weapon Trader'
})

AutoSell:AddButton({
    Name = 'Silver Sword = 1 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 11)
    end
})

AutoSell:AddButton({
    Name = 'Gold Sword = 2 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 12)
    end
})

AutoSell:AddButton({
    Name = 'Gold Bow = 3 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 13)
    end
})

AutoSell:AddButton({
    Name = 'Ruby Sword = 10 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 14)
    end
})

AutoSell:AddButton({
    Name = 'Diamond Sword = 18 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 15)
    end
})

AutoSell:AddButton({
    Name = 'Zenyte Sword = 30 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 17)
    end
})

AutoSell:AddButton({
    Name = 'Diamond Crossbow = 36 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 16)
    end
})

AutoSell:AddButton({
    Name = 'Zenyte Crossbow = 45 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 18)
    end
})

AutoSell:AddButton({
    Name = 'Obsidian Club = 80 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 19)
    end
})

AutoSell:AddButton({
    Name = 'Moonstone Sword = 130 Token',
    Callback = function()
        game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer("Weapon Trader", 20)
    end
})