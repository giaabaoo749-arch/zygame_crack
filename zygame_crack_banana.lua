-- // Tải thư viện Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- // CẤU HÌNH
local CORRECT_KEY = "AE_ZYGAME_CRACK"
local ToggleKey = Enum.KeyCode.RightControl

-- // 1. KHỞI TẠO GIAO DIỆN NHẬP KEY
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

-- // 2. LOGIC HUB CHÍNH
local function StartFluentHub()
    local Window = Fluent:CreateWindow({
        Title = "BANANA CAT HUB",
        SubTitle = "v1.0",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark"
    })

    local Tabs = {
        Main = Window:AddTab({ Title = "Farm", Icon = "rbxassetid://4483345998" })
    }

    Tabs.Main:AddToggle("AutoFarm", {Title = "Tự động Cày Cấp", Default = false, Callback = function(Value)
        print("Auto Farm: ", Value)
    end})

    Tabs.Main:AddToggle("AutoRaid", {Title = "Tự động Factory Raid", Default = false, Callback = function(Value)
        print("Auto Raid: ", Value)
    end})

    -- // Logic phím tắt ẩn/hiện menu
    local isVisible = true
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == ToggleKey then
            isVisible = not isVisible
            Window:SetVisible(isVisible)
            Fluent:Notify({Title = "Menu", Content = isVisible and "Đã hiện Menu" or "Đã ẩn Menu", Duration = 2})
        end
    end)
    
    Fluent:Notify({Title = "Thành công", Content = "Banana Cat Hub đã sẵn sàng!", Duration = 5})
end

-- // Sự kiện xử lý nút xác nhận Key
CheckBtn.MouseButton1Click:Connect(function()
    if InputBox.Text == CORRECT_KEY then
        KeyGui:Destroy()
        StartFluentHub()
    else
        InputBox.Text = "SAI KEY!"
        wait(1.5)
        InputBox.Text = ""
    end
end)
