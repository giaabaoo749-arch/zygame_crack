-- // Tải thư viện Venyx UI
local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source.lua"))()

-- // Cấu hình
local CORRECT_KEY = "AE_ZYGAME_CRACK"
local UserInputService = game:GetService("UserInputService")
local ToggleKey = Enum.KeyCode.RightControl -- Phím tắt để bật/tắt menu

-- // (Giữ nguyên logic KeySystemUI như phần trước...)
-- [Bỏ qua phần tạo KeyGui để tránh lặp lại, hãy dán phần này sau khi KeyGui:Destroy()]

local function SetupHub()
    local UI = Venyx.new("BANANA CAT HUB")
    local Page = UI:addPage("Farm", 5012544693)
    local Section = Page:addSection("Chức năng chính")

    Section:addToggle("Tự động Cày Cấp", false, function(state)
        print("Auto Farm: ", state)
    end)

    -- // Logic Bật/Tắt Menu
    local menuVisible = true
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end -- Không kích hoạt nếu đang chat
        
        if input.KeyCode == ToggleKey then
            menuVisible = not menuVisible -- Đảo ngược trạng thái
            UI:setVisible(menuVisible)    -- Hàm có sẵn của Venyx để ẩn/hiện
        end
    end)
end

-- // Gắn vào nút xác nhận Key
CheckBtn.MouseButton1Click:Connect(function()
    if InputBox.Text == CORRECT_KEY then
        KeyGui:Destroy()
        SetupHub()
    else
        InputBox.Text = "SAI KEY!"
        wait(1)
        InputBox.Text = ""
    end
end)
