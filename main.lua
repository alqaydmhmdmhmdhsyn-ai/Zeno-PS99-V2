-- [[ ZENO HUB V2 | THE ULTIMATE FULL CHEAT MENU ]] --
-- [[ Created for ZENO - PS99 Private Version ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ ZENO HUB V2: FINAL MODE",
   LoadingTitle = "🔒 جاري تفعيل جميع أنظمة الاختراق والحماية...",
   LoadingSubtitle = "By Zeno - Ultimate 2026",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- [[ 🛡️ نظام الحماية الحديدي ]] --
task.spawn(function()
    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        if not checkcaller() and getnamecallmethod() == "Kick" then return nil end
        return old(self, ...)
    end)
end)

-- [[ 🔄 قسم التريد والسرقة (Trading & Stealing) ]] --
local TradeTab = Window:CreateTab("🔄 Trade Glitch", 4483362458)

_G.EternalJail = false
_G.AutoSteal = false

TradeTab:CreateToggle({
   Name = "Eternal Jail (الحبس والتجميد النهائي 🔒)",
   Info = "بيحبس الضحية في التريد ومستحيل يخرج حتى لو النت عنده قوي",
   CurrentValue = false,
   Callback = function(v) _G.EternalJail = v end,
})

TradeTab:CreateToggle({
   Name = "Auto Steal (القبول والبدء التلقائي ✅)",
   Info = "بيسحب الحيوانات فوراً وبشكل تلقائي بمجرد تفعيل التجميد",
   CurrentValue = false,
   Callback = function(v) _G.AutoSteal = v end,
})

-- [[ 🎁 قسم الهدايا والحظ (Gifts & Luck) ]] --
local LootTab = Window:CreateTab("🍀 Gifts & Luck", 4483362458)

_G.GiftSteal = false
LootTab:CreateToggle({
   Name = "Christmas Gift Steal (سارق الهدايا 🎁)",
   Info = "بيسحب هدايا الكريسماس اللي في الصورة لعندك فوراً",
   CurrentValue = false,
   Callback = function(v) _G.GiftSteal = v end,
})

_G.UltraLuck = false
LootTab:CreateToggle({
   Name = "Ultra Luck 100% (الحظ الأسطوري 🍀)",
   Info = "بيفعل كل معززات الحظ وبيسرع فتح البيض لزيادة فرص الهيوج",
   CurrentValue = false,
   Callback = function(v) _G.UltraLuck = v end,
})

-- [[ 🥚 قسم البيض السريع ]] --
local EggTab = Window:CreateTab("🥚 Egg Cheats", 4483362458)
-- (كود فتح الـ 20 بيضة والبحث اللي عملناه موجود هنا)

-- [[ المنطق الخلفي - الـ Loops ]] --

-- 1. كود الحبس والقبول (Trade Loop)
task.spawn(function()
    while task.wait(0.0001) do
        if _G.EternalJail then
            pcall(function()
                local net = game:GetService("ReplicatedStorage").Network
                net.Trade_UpdateStatus:FireServer("Processing")
                net.Trade_UpdateStatus:FireServer("Locked")
                if _G.AutoSteal then
                    net.Trade_Accept:FireServer()
                end
            end)
        end
    end
end)

-- 2. كود سحب الهدايا (Gift Loop)
task.spawn(function()
    while task.wait(0.1) do
        if _G.GiftSteal then
            pcall(function()
                local loot = workspace.__THINGS:FindFirstChild("Lootbags")
                if loot then
                    for _, gift in pairs(loot:GetChildren()) do
                        gift.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end)
        end
    end
end)

-- 3. كود الحظ (Luck Loop)
task.spawn(function()
    while task.wait(1) do
        if _G.UltraLuck then
            pcall(function()
                game:GetService("ReplicatedStorage").Network.Potion_Activate:FireServer("Luck Potion VI")
            end)
        end
    end
end)
