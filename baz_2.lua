-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 🪟 Buat Window
local Window = Rayfield:CreateWindow({
    Name = "Regional Price UI",
    LoadingTitle = "Memicu UI Roblox...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

-- 📑 Tab Utama
local MainTab = Window:CreateTab("Buy Menu", nil)
local MarketplaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

MainTab:CreateSection("Klik untuk Munculin UI Roblox")

-- 🥚 TOMBOL CELESTE (DEVELOPER PRODUCT)
MainTab:CreateButton({
    Name = "Panggil UI Celeste (ID: 3432069516)",
    Callback = function()
        -- Fungsi ini KERJANYA cuma buat manggil pop-up konfirmasi Roblox
        -- Karena dipanggil lewat Client, harusnya harga Regional IDR muncul
        MarketplaceService:PromptProductPurchase(player, 3432069516)
    end,
})

-- 🎫 TOMBOL GAMEPASS
MainTab:CreateButton({
    Name = "Panggil UI Gamepass (ID: 8066283370)",
    Callback = function()
        -- Manggil jendela konfirmasi buat Gamepass
        MarketplaceService:PromptGamePassPurchase(player, 8066283370)
    end,
})

MainTab:CreateSection("Info")
MainTab:CreateParagraph("Catatan", "Setelah klik tombol, tunggu 1-3 detik sampai jendela konfirmasi biru asli dari Roblox muncul di layar kamu.")

Rayfield:Notify({
    Title = "Ready!",
    Content = "Silakan klik tombol buat munculin UI Roblox.",
    Duration = 5
})
