-- [[ ZENO HUB V8 | SANTA EVENT & TRIPLE STEAL ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ ZENO HUB V8: SANTA FIX",
   LoadingTitle = "🔒 جاري تهيئة نظام الكريسماس والحبس...",
   LoadingSubtitle = "By Zeno - Christmas 2026",
   ConfigurationSaving = { Enabled = false }
})

-- [[ 🥚 قسم بيضة سانتا (Christmas Egg) ]] --
local EggTab = Window:CreateTab("🥚 Christmas Egg", 4483362458)

_G.AutoOpenSanta = false
EggTab:CreateToggle({
   Name = "Auto Open 20x Santa Egg (فتح 20 بيضة سانتا)",
   Info = "بيفتح بيضة حدث الكريسماس فقط وبمعدل 20 مرة لزيادة الحظ",
   CurrentValue = false,
   Callback = function(v)
       _G.AutoOpenSanta = v
       if v then
           Rayfield:Notify({Title = "ZENO HUB", Content = "Santa Egg Farm: ACTIVE 🎅", Duration = 3})
       end
   end,
})

-- [[ 🔄 قسم التريد والسرقة (Fixed Stealer) ]] --
local TradeTab = Window:CreateTab("🔄 Fixed Stealer", 4483362458)

_G.FreezeJail = false
TradeTab:CreateToggle({
   Name = "Stainless Freeze (تجميد الثلاجة ❄️)",
   Info = "بيحبس الضحية ويمنعه من إلغاء التريد",
   CurrentValue = false,
   Callback = function(v) _G.FreezeJail = v end,
})

TradeTab:CreateButton({
   Name = "FORCE START (بدء السحب القسري ✅)",
   Info = "اضغط هنا لسحب الحيوانات فوراً (تم إصلاح الخطأ)",
   Callback = function()
       pcall(function()
           local net = game:GetService("ReplicatedStorage"):WaitForChild("Network")
           -- إرسال أوامر القبول المزدوجة المتتالية لكسر حماية السيرفر
           for i = 1, 10 do
               net.Trade_Accept:FireServer()
               net.Trade_UpdateStatus:FireServer("Ready")
               task.wait(0.01)
           end
       end)
   end,
})

-- [[ 🛠️ كود المنطق الخلفي وتصليح الأخطاء ]] --
task.spawn(function()
    while task.wait(0.1) do
        -- 1. ميزة فتح بيضة الكريسماس (20 مرة)
        if _G.AutoOpenSanta then
            pcall(function()
                -- "Christmas Egg" هو الاسم البرمجي لبيضة حدث سانتا في الكود
                game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer("Christmas Egg", 20)
            end)
        end
        
        -- 2. ميزة التجميد (ثبات السيرفر)
        if _G.FreezeJail then
            pcall(function()
                local net = game:GetService("ReplicatedStorage").Network
                net.Trade_UpdateStatus:FireServer("Locked")
            end)
        end
    end
end)

-- نظام الحماية ضد الطرد وتخطي الأنميشن لزيادة الحظ
task.spawn(function()
    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        if getnamecallmethod() == "Kick" then return nil end
        return old(self, ...)
    end)
    
    -- إخفاء أنميشن البيض لزيادة السرعة والفرص
    while task.wait(1) do
        pcall(function()
            local gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("EggOpen")
            if gui then gui.Enabled = false end
        end)
    end
end)
