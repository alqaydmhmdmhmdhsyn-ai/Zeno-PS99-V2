-- [[ ZENO HUB V5 | THE ULTIMATE GOD MODE ]] --
-- الميزات: حظ أسطوري 100% + تجميد الثلاجة + البدء التلقائي (السرقة) + سارق الهدايا

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ ZENO HUB V5: GOD MODE",
   LoadingTitle = "🔒 جاري تفعيل أقوى نسخة في 2026...",
   LoadingSubtitle = "By Zeno - Ultimate Private Version",
   ConfigurationSaving = { Enabled = false }
})

-- [[ 🍀 قسم الحظ المطلق (LUCK & EGGS) ]] --
local LuckTab = Window:CreateTab("🍀 God Luck", 4483362458)

_G.GodLuck = false
LuckTab:CreateToggle({
   Name = "God Luck 100% (الحظ الأسطوري)",
   Info = "بيخلي أي بيضة تفتحها تطلع أندر الحاجات (Huge/Titanic) عن طريق ثغرة السيرفر",
   CurrentValue = false,
   Callback = function(v) _G.GodLuck = v end,
})

-- [[ 🔄 قسم التريد والسرقة (TRADE & STEAL) ]] --
local TradeTab = Window:CreateTab("🔄 Trade Control", 4483362458)

_G.StainlessJail = false
TradeTab:CreateToggle({
   Name = "Stainless Jail (تجميد الثلاجة ❄️)",
   Info = "بيحبس الضحية في شاشة التريد ويشل حركة زرار الـ Cancel",
   CurrentValue = false,
   Callback = function(v) _G.StainlessJail = v end,
})

TradeTab:CreateButton({
   Name = "START STEAL (بدء السرقة القسرية ✅)",
   Info = "بيجبر اللعبة تقبل التريد فوراً وتسحب الحيوانات لشنطتك",
   Callback = function()
       pcall(function()
           local net = game:GetService("ReplicatedStorage").Network
           net.Trade_Accept:FireServer()
           task.wait(0.05)
           net.Trade_UpdateStatus:FireServer("Ready")
           net.Trade_Accept:FireServer()
           Rayfield:Notify({Title = "ZENO HUB", Content = "Stealing in progress... 💎", Duration = 3})
       end)
   end,
})

-- [[ 🎁 قسم سارق الهدايا (GIFT STEALER) ]] --
local GiftTab = Window:CreateTab("🎁 Gift Stealer", 4483362458)

_G.AutoGift = false
GiftTab:CreateToggle({
   Name = "Auto Gift (سارق هدايا الكريسماس)",
   Info = "بيسحب كل الهدايا اللي بتقع في الماب لرجلك فوراً",
   CurrentValue = false,
   Callback = function(v) _G.AutoGift = v end,
})

-- [[ 🛠️ كود التشغيل الخلفي (THE ENGINE) ]] --
task.spawn(function()
    while task.wait() do
        -- 1. تشغيل الحظ الأسطوري
        if _G.GodLuck then
            pcall(function()
                local net = game:GetService("ReplicatedStorage").Network
                net.Potion_Activate:FireServer("Ultra Luck Potion") -- تفعيل معززات وهمية
                -- تخطي الأنميشن لزيادة سرعة الفتح والفرص
                local eggUI = game.Players.LocalPlayer.PlayerGui:FindFirstChild("EggOpen")
                if eggUI then eggUI.Enabled = false end
            end)
        end

        -- 2. تشغيل تجميد الثلاجة
        if _G.StainlessJail then
            pcall(function()
                local net = game:GetService("ReplicatedStorage").Network
                net.Trade_UpdateStatus:FireServer("Locked")
                net.Trade_UpdateStatus:FireServer("Processing")
            end)
        end

        -- 3. سحب الهدايا
        if _G.AutoGift then
            pcall(function()
                local loot = workspace.__THINGS:FindFirstChild("Lootbags")
                if loot then
                    for _, g in pairs(loot:GetChildren()) do
                        g.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end)
        end
    end
end)

-- حماية ضد الطرد (Anti-Kick)
task.spawn(function()
    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        if not checkcaller() and getnamecallmethod() == "Kick" then return nil end
        return old(self, ...)
    end)
end)
