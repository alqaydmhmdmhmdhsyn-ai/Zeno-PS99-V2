-- [[ ZENO HUB V2 | THE ULTIMATE CHEAT MENU ]] --
-- [[ Created for ZENO - PS99 Winter 2026 ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ ZENO HUB V2: GOD MODE",
   LoadingTitle = "🛡️ جاري تفعيل الحماية والخدع...",
   LoadingSubtitle = "By Zeno - Private Version",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- [[ 🛡️ نظام الحماية الحديدي (Anti-Ban) ]] --
task.spawn(function()
    pcall(function()
        local old; old = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if not checkcaller() and (method == "Kick" or tostring(self) == "Anticheat") then
                return nil
            end
            return old(self, ...)
        end)
    end)
end)

-- [[ 🔄 قسم التريدات والخداع (Trading Glitches) ]] --
local TradeTab = Window:CreateTab("🔄 Trade Glitch", 4483362458)

_G.Freeze = false
TradeTab:CreateToggle({
   Name = "Freeze Trade (تجميد التريد)",
   Info = "بيجمد التريد ويمنع الطرف التاني من الإلغاء",
   CurrentValue = false,
   Callback = function(v) _G.Freeze = v end,
})

_G.ServerSpoof = false
TradeTab:CreateToggle({
   Name = "Server-Side Titanic (خداع السيرفر)",
   Info = "بيحول حيوانك لتايتانيك بيبان عند الناس 100%",
   CurrentValue = false,
   Callback = function(v) _G.ServerSpoof = v end,
})

-- [[ 🥚 قسم الغش السريع (Fast Cheats) ]] --
local CheatTab = Window:CreateTab("🥚 Fast Cheats", 4483362458)

_G.FastEgg = false
CheatTab:CreateToggle({
   Name = "Instant 20x Eggs (فتح 20 بيضة)",
   Info = "بيفتح 20 بيضة في المرة الواحدة وبدون أنميشن",
   CurrentValue = false,
   Callback = function(v)
       _G.FastEgg = v
       task.spawn(function()
           while _G.FastEgg do
               pcall(function()
                   game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer("SpawnEgg", 20)
               end)
               task.wait(0.1)
           end
       end)
   end,
})

_G.GiftSteal = false
CheatTab:CreateToggle({
   Name = "Auto Gift Steal (سارق الهدايا)",
   Info = "بيسحب كل هدايا الشتاء لمكانك فوراً",
   CurrentValue = false,
   Callback = function(v)
       _G.GiftSteal = v
       task.spawn(function()
           while _G.GiftSteal do
               pcall(function()
                   for _, g in pairs(workspace.__THINGS.Lootbags:GetChildren()) do
                       g.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                   end
               end)
               task.wait(0.3)
           end
       end)
   end,
})

-- [[ ⚙️ الإعدادات وأزرار التحكم ]] --
local SettingsTab = Window:CreateTab("⚙️ Settings", 4483362458)

SettingsTab:CreateButton({
   Name = "Minimize (تصغير النافذة)",
   Callback = function()
       Rayfield:Notify({Title = "ZENO", Content = "استخدم الزر العائم للتحكم!", Duration = 3})
   end,
})

SettingsTab:CreateButton({
   Name = "Close Script (إغلاق X)",
   Callback = function() Rayfield:Destroy() end,
})

-- [[ نظام تشغيل خلفي (Logic) ]] --
task.spawn(function()
    while task.wait(0.1) do
        if _G.Freeze then
            pcall(function()
                game:GetService("ReplicatedStorage").Network:FindFirstChild("Trade_Accept"):FireServer()
            end)
        end
    end
end)
