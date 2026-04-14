-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 🪟 Buat Window
local Window = Rayfield:CreateWindow({
    Name = "Zoo Regional Hub",
    LoadingTitle = "Regional Price Mode",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

-- 📑 Tab Utama & Services
local MainTab = Window:CreateTab("Regional Shop", nil)
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-------------------------------------------------------
-- 💸 Section: Regional Purchase
-------------------------------------------------------
MainTab:CreateSection("Direct Local Purchase")

-- Tombol Developer Product
MainTab:CreateButton({
    Name = "Buy Product (Regional ID: 3432069516)",
    Callback = function()
        local success, err = pcall(function()
            -- Memicu langsung dari Client agar sistem Roblox mendeteksi region Indonesia kamu
            MarketplaceService:PromptProductPurchase(player, 3432069516)
        end)
        
        if success then
            print("Memicu Regional Purchase untuk Product ID: 3432069516")
        else
            warn("Gagal memicu pembelian Product: ", err)
            Rayfield:Notify({
                Title = "Purchase Error",
                Content = "Cek F9! Kemungkinan ThirdPartySales dimatikan game.",
                Duration = 5
            })
        end
    end,
})

-- Tombol Gamepass
MainTab:CreateButton({
    Name = "Buy Gamepass (ID: 8066283370)",
    Callback = function()
        local success, err = pcall(function()
            MarketplaceService:PromptGamePassPurchase(player, 8066283370)
        end)
        
        if success then
            print("Memicu Gamepass Purchase untuk ID: 8066283370")
        else
            warn("Gagal memicu pembelian Gamepass: ", err)
        end
    end,
})

-------------------------------------------------------
-- 💡 Info & Feedback
-------------------------------------------------------
MainTab:CreateSection("Tips")
MainTab:CreateParagraph("Kenapa Lewat Sini?", "Memicu pembelian langsung dari Client (Local) lebih akurat untuk mendapatkan harga regional (IDR/Discount) daripada lewat InvokeServer yang sering dianggap transaksi global.")

-- Handler untuk mendeteksi hasil akhir (cek di F9)
MarketplaceService.PromptProductPurchaseFinished:Connect(function(userId, productId, isPurchased)
    if isPurchased then
        print("Transaksi Berhasil untuk ID: " .. productId)
        Rayfield:Notify({
            Title = "Success!",
            Content = "Pembelian berhasil diproses.",
            Duration = 3
        })
    else
        print("Transaksi dibatalkan atau gagal.")
    end
end)

-------------------------------------------------------
-- 🎉 Startup Notification
-------------------------------------------------------
Rayfield:Notify({
    Title = "Regional Mode Ready",
    Content = "Klik tombol untuk memunculkan pop-up harga murah (Regional).",
    Duration = 5
})

print("Zoo Regional Hub Loaded Successfully")
