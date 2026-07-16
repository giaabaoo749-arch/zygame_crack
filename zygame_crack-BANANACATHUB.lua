-- // Tải thư viện Venyx UI
local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source.lua"))()

-- // CẤU HÌNH
local CORRECT_KEY = "AE_ZYGAME_CRACK"
local ToggleKey = Enum.KeyCode.RightControl -- Phím tắt để ẩn/hiện menu

-- // 1. TẠO GIAO DIỆN NHẬP KEY
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local KeyGui = Instance.new("ScreenGui", PlayerGui)
KeyGui.Name = "KeySystemUI"

local MainFrame = Instance.new("Frame", KeyGui)
MainFrame.Size = UDim2.new(0, 320, 0, 180)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "BANANA CAT HUB - KEY"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold

local InputBox = Instance.new("TextBox", MainFrame)
InputBox.Size = UDim2.new(0.8, 0, 0, 40)
InputBox.Position = UDim2.new(0.1, 0, 0.3, 0)
InputBox.PlaceholderText = "Nhập Key tại đây..."
InputBox.Text = ""
InputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 6)

local CheckBtn = Instance.new("TextButton", MainFrame)
CheckBtn.Size = UDim2.new(0.8, 0, 0, 40)
CheckBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
CheckBtn.Text = "XÁC NHẬN"
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", CheckBtn).CornerRadius = UDim.new(0, 6)

-- // 2. LOGIC KHỞI TẠO HUB SAU KHI NHẬP ĐÚNG KEY
local function StartHub()
    local UI = Venyx.new("BANANA CAT HUB")
    local Page = UI:addPage("Farm", 5012544693)
    local Section = Page:addSection("Chức năng chính")

    Section:addToggle("Tự động Cày Cấp", false, function(state)
        print("Auto Farm: ", state)
    end)

    Section:addToggle("Tự động Factory Raid", false, function(state)
        print("Auto Raid: ", state)
    end)

    -- // Logic Bật/Tắt Menu bằng phím tắt
    local menuVisible = true
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == ToggleKey then
            menuVisible = not menuVisible
            UI:setVisible(menuVisible)
        end
    end)
    
    UI:SelectPage(UI.pages[1], true)
end

-- // Sự kiện nhấn nút xác nhận
CheckBtn.MouseButton1Click:Connect(function()
    if InputBox.Text == CORRECT_KEY then
        KeyGui:Destroy()
        StartHub()
    else
        InputBox.Text = "SAI KEY!"
        wait(1)
        InputBox.Text = ""
    end
end)
