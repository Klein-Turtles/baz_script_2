-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 🪟 Buat Window
local Window = Rayfield:CreateWindow({
    Name = "Zoo Regional Hub",
    LoadingTitle = "Regional Price Mode",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

-- 📑 Tab Utama
local MainTab = Window:CreateTab("Regional Shop", nil)
local MarketplaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

-------------------------------------------------------
-- 💸 Section: Regional Purchase
-------------------------------------------------------
MainTab:CreateSection("Direct Local Purchase")

-- Tombol Developer Product (Yang harganya sering kena Regional Price)
MainTab:CreateButton({
    Name = "Buy Product (Regional ID: 3432069516)",
    Callback = function()
        -- Memicu langsung dari Client agar sistem Roblox mendeteksi region Indonesia kamu
        MarketplaceService:PromptProductPurchase(player, 3432069516)
        print("Memicu Regional Purchase untuk Product ID: 3432069516")
    end,
})

-- Tombol Gamepass
MainTab:CreateButton({
    Name = "Buy Gamepass (ID: 8066283370)",
    Callback = function()
        MarketplaceService:PromptGamePassPurchase(player, 8066283370)
        print("Memicu Gamepass Purchase untuk ID: 8066283370")
    end,
})

-------------------------------------------------------
-- 💡 Info
-------------------------------------------------------
MainTab:CreateSection("Tips")
MainTab:CreateParagraph("Kenapa Lewat Sini?", "Memicu pembelian langsung dari Client (Local) lebih akurat untuk mendapatkan harga regional daripada lewat InvokeServer yang sering dianggap transaksi global.")

Rayfield:Notify({
    Title = "Regional Mode Ready",
    Content = "Klik tombol untuk memunculkan pop-up harga murah.",
    Duration = 5
})