-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Final Fix",
    LoadingTitle = "Bypassing Vulnerable Function...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProductBuyRF = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("ProductBuyRF")

MainTab:CreateSection("Beli via Remote (Regional Bypass)")

-- Tombol Celeste
MainTab:CreateButton({
    Name = "Buy Celeste Egg (Try Regional)",
    Callback = function()
        local args = {
            "CelesteEgg_x3", -- Nama item
            true,            -- Argumen bypass 1
            "ID"             -- Argumen region Indonesia
        }
        
        local success, err = pcall(function()
            -- Kita pakai unpack(args) sesuai permintaanmu tadi
            ProductBuyRF:InvokeServer(unpack(args))
        end)
        
        if success then
            Rayfield:Notify({Title = "Sent!", Content = "Cek pop-up yang muncul, moga dapet IDR!", Duration = 3})
        else
            warn("Gagal: " .. tostring(err))
        end
    end,
})

-- Tombol Sirius/Princess
MainTab:CreateButton({
    Name = "Buy Sirius Egg x10",
    Callback = function()
        local args = { "SiriusEgg_x10", true, "ID" }
        pcall(function() ProductBuyRF:InvokeServer(unpack(args)) end)
    end,
})

MainTab:CreateSection("Info Error")
MainTab:CreateParagraph("Kenapa Pakai Ini?", "Executor kamu (Delta) memblokir fungsi 'Prompt' (Vulnerable), jadi kita harus lewat Remote Game lagi. Semoga server game-nya pintar baca region kamu.")
