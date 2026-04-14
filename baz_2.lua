-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 🪟 Buat Window
local Window = Rayfield:CreateWindow({
    Name = "Zoo Fix Regional",
    LoadingTitle = "Fixing UI Trigger...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Shop Fix", nil)
local MarketplaceService = game:GetService("MarketplaceService")
local player = game:GetService("Players").LocalPlayer

MainTab:CreateSection("Trigger Pembelian")

-- FUNGSI PEMBELIAN (DIBERSIHKAN)
local function panggilUI(id, tipe)
    local success, err = pcall(function()
        if tipe == "Product" then
            MarketplaceService:PromptProductPurchase(player, id)
        else
            MarketplaceService:PromptGamePassPurchase(player, id)
        end
    end)
    
    if not success then
        warn("GAGAL MUNCULIN UI: " .. tostring(err))
        Rayfield:Notify({
            Title = "Error Muncul!",
            Content = "Cek F9. Biasanya 'ThirdPartySales' dimatikan game ini.",
            Duration = 5
        })
    else
        print("Request dikirim untuk ID: " .. id)
    end
end

-- TOMBOL DEVELOPER PRODUCT (CELESTE)
MainTab:CreateButton({
    Name = "Panggil UI Celeste (3432069516)",
    Callback = function()
        panggilUI(3432069516, "Product")
    end,
})

-- TOMBOL GAMEPASS
MainTab:CreateButton({
    Name = "Panggil UI Gamepass (8066283370)",
    Callback = function()
        panggilUI(8066283370, "Pass")
    end,
})

MainTab:CreateSection("Troubleshoot")
MainTab:CreateParagraph("PENTING", "Kalau tetep nggak muncul, buka Console (F9). Kalau ada tulisan 'AllowThirdPartySales has been disabled', berarti game ini mengunci pembelian manual. Solusinya harus pakai InvokeServer (tapi harga jadi Global).")
