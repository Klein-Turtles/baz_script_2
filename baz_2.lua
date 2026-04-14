-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Premium Hub",
    LoadingTitle = "Updating Database...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProductBuyRF = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("ProductBuyRF")

-- Fungsi Helper untuk memanggil Remote
local function buyItem(itemName)
    local args = {
        itemName, 
        true,     
        "ID"      
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
-- 🥚 Section: Premium Eggs x10 (Updated Names)
-------------------------------------------------------
MainTab:CreateSection("Premium Eggs (All x10)")

-- 1. Celeste Egg
MainTab:CreateButton({
    Name = "Buy Celeste Egg x10",
    Callback = function() buyItem("CelesteEgg_x10") end,
})

-- 2. Fly Egg (Ganti dari Winged Egg)
MainTab:CreateButton({
    Name = "Buy Fly Egg x10",
    Callback = function() buyItem("FlyEgg_x10") end,
})

-- 3. Pink Unicorn Egg (Ganti dari Princess Egg)
MainTab:CreateButton({
    Name = "Buy Pink Unicorn Egg x10",
    Callback = function() buyItem("PinkUnicornEgg_x10") end,
})

-- 4. Shadow King Egg (NEW)
MainTab:CreateButton({
    Name = "Buy Shadow King Egg x10",
    Callback = function() buyItem("ShadowKingEgg_x10") end,
})

-- 5. Bumblebee Egg
MainTab:CreateButton({
    Name = "Buy Bumblebee Egg x10",
    Callback = function() buyItem("BumblebeeEgg_x10") end,
})

-- 6. Fiery Dragon Egg
MainTab:CreateButton({
    Name = "Buy Fiery Dragon Egg x10",
    Callback = function() buyItem("FieryDragonEgg_x10") end,
})

-- 7. Ancient Egg
MainTab:CreateButton({
    Name = "Buy Ancient Egg x10",
    Callback = function() buyItem("AncientEgg_x10") end,
})

-- 8. Sea Dragon Egg
MainTab:CreateButton({
    Name = "Buy Sea Dragon Egg x10",
    Callback = function() buyItem("SeaDragonEgg_x10") end,
})

-- 9. Flower Whale Egg
MainTab:CreateButton({
    Name = "Buy Flower Whale Egg x10",
    Callback = function() buyItem("FlowerWhaleEgg_x10") end,
})

-------------------------------------------------------
-- 🎉 Notifikasi
-------------------------------------------------------
Rayfield:Notify({
    Title = "Database Updated",
    Content = "Winged -> Fly, Princess -> Pink Unicorn. Shadow King added!",
    Duration = 5
})
