-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Premium Hub",
    LoadingTitle = "Updating Shop Items...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProductBuyRF = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("ProductBuyRF")

-- Fungsi Helper untuk memanggil Remote (Biar Kode Gak Kepanjangan)
local function buyItem(itemName)
    local args = {
        itemName, -- Nama item (misal: "CelesteEgg_x10")
        true,     -- Bypass flag
        "ID"      -- Regional ID
    }
    local success, err = pcall(function()
        ProductBuyRF:InvokeServer(unpack(args))
    end)
    if success then
        Rayfield:Notify({Title = "Sent!", Content = "Request " .. itemName .. " dikirim.", Duration = 2})
    else
        warn("Gagal membeli " .. itemName .. ": " .. tostring(err))
    end
end

-------------------------------------------------------
-- 🥚 Section: Premium Eggs x10
-------------------------------------------------------
MainTab:CreateSection("Premium Eggs (All x10)")

-- 1. Celeste Egg (Sudah diubah ke x10)
MainTab:CreateButton({
    Name = "Buy Celeste Egg x10",
    Callback = function() buyItem("CelesteEgg_x10") end,
})

-- 2. Flower Whale Egg x10
MainTab:CreateButton({
    Name = "Buy Flower Whale Egg x10",
    Callback = function() buyItem("FlowerWhaleEgg_x10") end,
})

-- 3. Princess Egg x10
MainTab:CreateButton({
    Name = "Buy Princess Egg x10",
    Callback = function() buyItem("PrincessEgg_x10") end,
})

-- 4. Bumblebee Egg x10
MainTab:CreateButton({
    Name = "Buy Bumblebee Egg x10",
    Callback = function() buyItem("BumblebeeEgg_x10") end,
})

-- 5. Fiery Dragon Egg x10
MainTab:CreateButton({
    Name = "Buy Fiery Dragon Egg x10",
    Callback = function() buyItem("FieryDragonEgg_x10") end,
})

-- 6. Ancient Egg x10
MainTab:CreateButton({
    Name = "Buy Ancient Egg x10",
    Callback = function() buyItem("AncientEgg_x10") end,
})

-- 7. Winged Egg x10
MainTab:CreateButton({
    Name = "Buy Winged Egg x10",
    Callback = function() buyItem("WingedEgg_x10") end,
})

-- 8. Sea Dragon Egg x10
MainTab:CreateButton({
    Name = "Buy Sea Dragon Egg x10",
    Callback = function() buyItem("SeaDragonEgg_x10") end,
})

-------------------------------------------------------
-- 🎉 Startup Notification
-------------------------------------------------------
Rayfield:Notify({
    Title = "Script Updated!",
    Content = "Semua Egg x10 berhasil ditambahkan.",
    Duration = 5
})
