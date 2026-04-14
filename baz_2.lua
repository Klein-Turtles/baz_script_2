-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Premium Hub",
    LoadingTitle = "Bypassing Regional...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProductBuyRF = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("ProductBuyRF")

MainTab:CreateSection("Premium Eggs (Regional Bypass Attempt)")

-- 🐳 Tombol Flower Whale Egg (NEW)
MainTab:CreateButton({
    Name = "Buy Flower Whale Egg x10",
    Callback = function()
        local args = {
            "FlowerWhaleEgg_x10", -- Pastikan penamaan string sudah benar
            true,                -- Bypass flag
            "ID"                 -- Regional ID
        }
        
        local success, err = pcall(function()
            ProductBuyRF:InvokeServer(unpack(args))
        end)
        
        if success then
            Rayfield:Notify({Title = "Success!", Content = "Request Flower Whale dikirim.", Duration = 3})
        else
            warn(err)
        end
    end,
})

-- 🥚 Tombol Celeste
MainTab:CreateButton({
    Name = "Buy Celeste Egg (Try Regional)",
    Callback = function()
        local args = { "CelesteEgg_x3", true, "ID" }
        pcall(function() ProductBuyRF:InvokeServer(unpack(args)) end)
        Rayfield:Notify({Title = "Sent!", Content = "Cek pop-up Celeste!", Duration = 3})
    end,
})

-- 👸 Tombol Sirius/Princess
MainTab:CreateButton({
    Name = "Buy Sirius Egg x10",
    Callback = function()
        local args = { "SiriusEgg_x10", true, "ID" }
        pcall(function() ProductBuyRF:InvokeServer(unpack(args)) end)
        Rayfield:Notify({Title = "Sent!", Content = "Cek pop-up Sirius!", Duration = 3})
    end,
})

MainTab:CreateSection("Catatan")
MainTab:CreateParagraph("Tentang Harga", "Jika harga tetap mahal (Global), berarti server game ini tidak memproses argumen region dari luar. Karena Delta memblokir fungsi 'Prompt' (Vulnerable), kita sangat bergantung pada cara server game menangani Remote ini.")

Rayfield:Notify({
    Title = "Script Updated",
    Content = "Flower Whale Egg telah ditambahkan!",
    Duration = 5
})
