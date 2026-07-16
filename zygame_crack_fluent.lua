-- // Tải thư viện Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- // CẤU HÌNH
local CORRECT_KEY = "aezygame"
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

    -- // Nút nổi (Floating Button) để bật tắt Menu
    local FloatingGui = Instance.new("ScreenGui", PlayerGui)
    local OpenBtn = Instance.new("TextButton", FloatingGui)
    OpenBtn.Size = UDim2.new(0, 50, 0, 50)
    OpenBtn.Position = UDim2.new(0, 20, 0.5, -25)
    OpenBtn.Text = "MENU"
    OpenBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.Draggable = true -- Cho phép kéo thả nút
    Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 10)

    local isVisible = true
    local function toggleMenu()
        isVisible = not isVisible
        Window:SetVisible(isVisible)
    end

    OpenBtn.MouseButton1Click:Connect(toggleMenu)

    -- // Logic phím tắt
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == ToggleKey then
            toggleMenu()
        end
    end)
    
    Fluent:Notify({Title = "Thành công", Content = "Đã tải Banana Cat Hub!", Duration = 5})
end

-- // Xử lý xác nhận Key
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
Fluent:Notify({
    Title = "Thông báo",
    Content = "Key hợp lệ, hệ thống đã được khởi tạo.",
    SubContent = "Banana Cat Hub v1.0", -- Dòng phụ nhỏ bên dưới
    Duration = 5
})
end
end>)

-- // TẠO NÚT NỔI KÉO THẢ ĐỘC LẬP
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local FloatingGui = Instance.new("ScreenGui", PlayerGui)
FloatingGui.Name = "FloatingMenuGui"
FloatingGui.ResetOnSpawn = false -- Không mất nút khi hồi sinh

local OpenBtn = Instance.new("TextButton", FloatingGui)
OpenBtn.Name = "OpenButton"
OpenBtn.Size = UDim2.new(0, 50, 0, 50)
OpenBtn.Position = UDim2.new(0, 20, 0.5, -25)
OpenBtn.Text = "MENU"
OpenBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 12
OpenBtn.Active = true
OpenBtn.Draggable = true -- Cho phép kéo thả
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 10)

-- // Logic kết nối với Menu của bạn (Thay 'Window' bằng biến menu của bạn)
OpenBtn.MouseButton1Click:Connect(function()
    -- Ví dụ: Window:SetVisible(not Window.Visible)
    print("Nút nổi được nhấn!")
end)
local startTime = os.time() -- Lưu lại thời điểm nhập Key thành công
local EXPIRATION_TIME = 120 -- 120 giây = 2 phút

-- Logic kiểm tra trong quá trình sử dụng
local function checkKeyExpiration()
    local currentTime = os.time()
    if (currentTime - startTime) > EXPIRATION_TIME then
        return false -- Key đã hết hạn
    end
    return true -- Key vẫn còn hiệu lực
end

-- Sử dụng trong vòng lặp hoặc khi nhấn nút tính năng
if checkKeyExpiration() then
    -- Cho phép sử dụng tính năng
else
    -- Khóa tính năng và yêu cầu nhập lại Key
    Fluent:Notify({
        Title = "Thông báo",
        Content = "Key của bạn đã hết hạn, vui lòng nhập lại!",
        Duration = 5
    })
    -- [Code để mở lại bảng nhập Key]
end
