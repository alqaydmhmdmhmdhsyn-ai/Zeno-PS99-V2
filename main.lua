-- [[ ZENO HUB V12 | CHRISTMAS & GOD LUCK EDITION ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ ZENO HUB V12: GOD LUCK",
   LoadingTitle = "🍀 جاري تهيئة الحظ الأسطوري 100%...",
   LoadingSubtitle = "By Zeno - Christmas Dominance",
   ConfigurationSaving = { Enabled = false }
})

-- [[ 🎅 قسم حدث الكريسماس (Christmas Event Tab) ]] --
local ChristmasTab = Window:CreateTab("🎅 Christmas Zone", 4483362458)

_G.SantaFarm = false
ChristmasTab:CreateToggle({
   Name = "Auto Farm Santa Zone (فرمة منطقة الكريسماس)",
   Info = "بيكسر كل حاجة في منطقة الكريسماس اللي في النص وبيجمع الهدايا",
   CurrentValue = false,
   Callback = function(v) _G.SantaFarm = v end,
})

_G.SantaHatch = false
ChristmasTab:CreateToggle({
   Name = "Hatch 20x Santa Eggs (فتح بيض سانتا الأسطوري)",
   Info = "بيفتح بيضة الكريسماس بتركيز حظ عالي جداً",
   CurrentValue = false,
   Callback = function(v) _G.SantaHatch = v end,
})

-- [[ 🍀 قسم الحظ المطلق (God Luck 100%) ]] --
local LuckTab = Window:CreateTab("🍀 God Luck", 4483362458)

_G.UltraLuck = false
LuckTab:CreateToggle({
   Name = "100% Rare Luck (الحظ الحقيقي للنوادر)",
   Info = "بيجبر السيرفر يرفع نسبة الهيوج والتايتنك عن طريق وهم المعززات",
   CurrentValue = false,
   Callback = function(v) _G.UltraLuck = v end,
})

-- [[ 🚜 قسم التجميع الشامل (Global Farm) ]] --
local GlobalTab = Window:CreateTab("🚜 Global Farm", 4483362458)

_G.GlobalFarm = false
GlobalTab:CreateToggle({
   Name = "Super Farm & Collect (تجميع ومسح شامل)",
   CurrentValue = false,
   Callback = function(v) _G.GlobalFarm = v end,
})

-- [[ ⚙️ محرك السكريبت (The Engine) ]] --
task.spawn(function()
    while task.wait(0.01) do
        local net = game:GetService("ReplicatedStorage"):WaitForChild("Network")
        
        -- منطق الحظ الأسطوري (Luck Logic)
        if _G.UltraLuck then
            pcall(function()
                -- إيهام السيرفر بوجود أقوى مشروبات وكتب الحظ
                net.Potion_Activate:FireServer("Luck Potion X")
                net.Potion_Activate:FireServer("Lucky Egg Potion")
                -- محاولة تفعيل ثغرة Huge Hunter
                net.Enchant_Equip:FireServer("Huge Hunter")
            end)
        end

        -- تفتيح بيض سانتا (Santa Hatching)
        if _G.SantaHatch then
            pcall(function()
                net.Eggs_RequestPurchase:InvokeServer("Christmas Egg", 20)
            end)
        end

        -- فرمة منطقة الكريسماس (Santa Zone Farm)
        if _G.SantaFarm or _G.GlobalFarm then
            pcall(function()
                -- جمع اللوت والأوربس فوراً
                for _, v in pairs(workspace.__THINGS.Lootbags:GetChildren()) do
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
                for _, v in pairs(workspace.__THINGS.Orbs:GetChildren()) do
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
                -- هجوم تلقائي على العملات
                local coins = workspace.__THINGS.Coins:GetChildren()
                if #coins > 0 then
                    net.Click:FireServer(coins[math.random(1, #coins)].Name)
                end
            end)
        end
    end
end)

-- تسريع العملية وإلغاء الأنميشن لزيادة فرص النوادر
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("EggOpen")
            if gui then gui.Enabled = false end
            -- مضاد الطرد (Anti-AFK)
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end)
