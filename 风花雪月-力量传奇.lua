local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

-- ============================================
-- 卡密系统
-- ============================================
local CORRECT_KEY = "FHXY-2026"
local KEY_FILE = "FHXY_Key.txt"
local hasKey = false

pcall(function()
    if isfile and readfile and isfile(KEY_FILE) then
        local saved = readfile(KEY_FILE)
        if saved == CORRECT_KEY then
            hasKey = true
        end
    end
end)

if not hasKey then
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Name = "FHXY_KeySystem"
    KeyGui.ResetOnSpawn = false
    KeyGui.Parent = pg

    local bgFrame = Instance.new("Frame")
    bgFrame.Size = UDim2.new(0, 350, 0, 190)
    bgFrame.Position = UDim2.new(0.5, -175, 0.5, -95)
    bgFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    bgFrame.BorderSizePixel = 0
    bgFrame.Parent = KeyGui

    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 14)
    bgCorner.Parent = bgFrame

    local bgStroke = Instance.new("UIStroke")
    bgStroke.Color = Color3.fromRGB(120, 100, 200)
    bgStroke.Thickness = 2
    bgStroke.Parent = bgFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 12)
    title.BackgroundTransparency = 1
    title.Text = "🔒 风花雪月 · 卡密验证"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 18
    title.Font = Enum.Font.GothamBold
    title.Parent = bgFrame

    local subTitle = Instance.new("TextLabel")
    subTitle.Size = UDim2.new(1, 0, 0, 20)
    subTitle.Position = UDim2.new(0, 0, 0, 42)
    subTitle.BackgroundTransparency = 1
    subTitle.Text = "请输入卡密以使用本脚本"
    subTitle.TextColor3 = Color3.fromRGB(180, 180, 200)
    subTitle.TextSize = 12
    subTitle.Font = Enum.Font.Gotham
    subTitle.Parent = bgFrame

    local inputBox = Instance.new("TextBox")
    inputBox.Size = UDim2.new(0.8, 0, 0, 38)
    inputBox.Position = UDim2.new(0.1, 0, 0, 75)
    inputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    inputBox.BorderSizePixel = 0
    inputBox.Text = ""
    inputBox.PlaceholderText = "请输入卡密..."
    inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 150)
    inputBox.TextSize = 14
    inputBox.Font = Enum.Font.Gotham
    inputBox.ClearTextOnFocus = false
    inputBox.Parent = bgFrame

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 8)
    inputCorner.Parent = inputBox

    local submitBtn = Instance.new("TextButton")
    submitBtn.Size = UDim2.new(0.8, 0, 0, 38)
    submitBtn.Position = UDim2.new(0.1, 0, 0, 125)
    submitBtn.BackgroundColor3 = Color3.fromRGB(100, 130, 220)
    submitBtn.BorderSizePixel = 0
    submitBtn.Text = "确认验证"
    submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitBtn.TextSize = 14
    submitBtn.Font = Enum.Font.GothamBold
    submitBtn.Parent = bgFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = submitBtn

    local verified = false

    submitBtn.MouseButton1Click:Connect(function()
        if inputBox.Text == CORRECT_KEY then
            verified = true
            pcall(function()
                if writefile then
                    writefile(KEY_FILE, CORRECT_KEY)
                end
            end)
            KeyGui:Destroy()
        else
            inputBox.Text = ""
            inputBox.PlaceholderText = "❌ 卡密错误，请重试"
        end
    end)

    while not verified do
        task.wait(0.1)
    end
end

-- ============================================
-- 加载飘窗
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FHXY_Loading"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = pg

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 80)
Frame.Position = UDim2.new(0.5, -150, 0.5, -40)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0.6, 0)
Title.BackgroundTransparency = 1
Title.Text = "正在加载中，请稍等..."
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, 0, 0.4, 0)
Sub.Position = UDim2.new(0, 0, 0.6, 0)
Sub.BackgroundTransparency = 1
Sub.Text = "风花雪月 · 力量传奇"
Sub.TextColor3 = Color3.fromRGB(200, 200, 200)
Sub.TextScaled = true
Sub.Font = Enum.Font.Gotham
Sub.Parent = Frame

task.spawn(function()
    task.wait(3)
    if ScreenGui and ScreenGui.Parent then
        ScreenGui:Destroy()
    end
end)

-- ============================================
-- 加载 WindUI
-- ============================================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "风花雪月 ✨",
    Icon = "wind",
    Author = "风花雪月",
    Size = UDim2.fromOffset(520, 440),
    Theme = "Dark",
    ToggleKey = Enum.KeyCode.RightShift,
    Transparent = true,
    Acrylic = true
})
Window:Tag({Title="力量传奇", Color=Color3.fromRGB(255, 100, 200)})

local HomeTab = Window:Tab({Title="主页", Icon="home"})
local GymTab = Window:Tab({Title="健身房", Icon="activity"})
local TrainTab = Window:Tab({Title="断炼重生", Icon="dumbbell"})
local KillTab = Window:Tab({Title="击杀全服人", Icon="skull"})

local muscleEvent = lp:WaitForChild("muscleEvent", 15)
local leaderstats = lp:WaitForChild("leaderstats", 15)
local Rebirths = leaderstats and leaderstats:FindFirstChild("Rebirths")

local isAutoTraining = false
local isAutoRebirth = false
local whiteList = {}
local blackList = {}
local killAllEnabled = false
local killBlacklistEnabled = false

HomeTab:Section({Title="✨ 风花雪月 · 力量传奇", TextXAlignment="Left"})
HomeTab:Paragraph({Title="作者：风花雪月", Desc="本脚本为《力量传奇》专属定制工具。", Image="user", ImageSize=20})
HomeTab:Paragraph({Title="脚本介绍", Desc="集成快速传送、断炼重生、击杀全服等功能。", Image="info", ImageSize=20})
HomeTab:Paragraph({Title="使用说明", Desc="左侧切换功能。RightShift 隐藏/显示窗口。", Image="keyboard", ImageSize=20})

local function teleportTo(pos, name)
    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(pos)
        WindUI:Notify({Title="传送成功", Content="已传送至 "..name, Icon="check", Duration=2})
    end
end

GymTab:Section({Title="健身房传送", TextXAlignment="Left"})
GymTab:Button({Title="❄️ 冰霜健身房", Desc="点击传送", Callback=function()
    teleportTo(Vector3.new(-2623.41, 6.99, -409.34), "冰霜健身房")
end})
GymTab:Button({Title="🌟 神话健身房", Desc="点击传送", Callback=function()
    teleportTo(Vector3.new(2250.39, 6.99, 1072.77), "神话健身房")
end})
GymTab:Button({Title="🌌 永恒健身房", Desc="点击传送", Callback=function()
    teleportTo(Vector3.new(-6758.39, 6.99, -1284.45), "永恒健身房")
end})
GymTab:Button({Title="🏆 传奇健身房", Desc="点击传送", Callback=function()
    teleportTo(Vector3.new(4603.40, 990.99, -3897.44), "传奇健身房")
end})
GymTab:Button({Title="🏋️ 肌肉之王健身房", Desc="点击传送", Callback=function()
    teleportTo(Vector3.new(-8625.40, 16.99, -5730.41), "肌肉之王健身房")
end})
GymTab:Button({Title="🌳 丛林健身房", Desc="点击传送", Callback=function()
    teleportTo(Vector3.new(-8685.01, 5.99, 2392.06), "丛林健身房")
end})
GymTab:Button({Title="🏭 工业健身房", Desc="点击传送", Callback=function()
    teleportTo(Vector3.new(-5496.68, 59.04, 4927.74), "工业健身房")
end})
GymTab:Button({Title="⚡ 超载健身房", Desc="点击传送", Callback=function()
    teleportTo(Vector3.new(-3045.30, 165.41, 4990.69), "超载健身房")
end})

TrainTab:Section({Title="断炼重生", TextXAlignment="Left"})

TrainTab:Toggle({Title="自动锻炼", Desc="自动持续锻炼增加力量", Value=false, Callback=function(s)
    isAutoTraining = s
    if s and muscleEvent then
        task.spawn(function()
            while isAutoTraining do
                muscleEvent:FireServer("rep")
                task.wait(0.1)
            end
        end)
        WindUI:Notify({Title="自动锻炼 已开启", Icon="play", Duration=2})
    else
        WindUI:Notify({Title="自动锻炼 已关闭", Icon="pause", Duration=2})
    end
end})

local rebirthInput = TrainTab:Input({Title="目标重生次数", Desc="达到目标次数自动停止", Placeholder="例如: 10"})

TrainTab:Toggle({Title="自动重生", Desc="自动重生直到达到目标次数", Value=false, Callback=function(s)
    isAutoRebirth = s
    if s then
        task.spawn(function()
            while isAutoRebirth do
                local target = tonumber(rebirthInput.Value) or 0
                if Rebirths and target > 0 and Rebirths.Value < target then
                    muscleEvent:FireServer("rebirth")
                    task.wait(3)
                end
                task.wait(0.5)
            end
        end)
        WindUI:Notify({Title="自动重生 已开启", Icon="refresh-cw", Duration=2})
    else
        WindUI:Notify({Title="自动重生 已关闭", Icon="pause", Duration=2})
    end
end})

KillTab:Section({Title="击杀设置", TextXAlignment="Left"})

local function equipPunch()
    local backpack = lp:FindFirstChild("Backpack")
    local char = lp.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local punch = backpack and backpack:FindFirstChild("Punch")
    if punch then
        humanoid:EquipTool(punch)
        task.wait(0.05)
    end
end

local function attackTarget(target)
    local char = lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local targetHrp = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp or not targetHrp then return end
    hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 3)
    task.wait(0.1)
    for i = 1, 5 do
        if not (killAllEnabled or killBlacklistEnabled) then return end
        equipPunch()
        muscleEvent:FireServer("punch", "rightHand")
        task.wait(0.15)
    end
end

KillTab:Toggle({Title="击杀全服人", Desc="自动传送到每位玩家面前挥拳击杀", Value=false, Callback=function(s)
    killAllEnabled = s
    if s then
        task.spawn(function()
            while killAllEnabled do
                for _, p in ipairs(Players:GetPlayers()) do
                    if not killAllEnabled then break end
                    if p ~= lp and p.Character and not whiteList[p.Name] then
                        attackTarget(p)
                    end
                end
                task.wait(0.2)
            end
        end)
        WindUI:Notify({Title="击杀全服 已开启", Icon="skull", Duration=2})
    else
        WindUI:Notify({Title="击杀全服 已关闭", Icon="x", Duration=2})
    end
end})

KillTab:Toggle({Title="仅击杀黑名单", Desc="只针对黑名单内的玩家执行击杀", Value=false, Callback=function(s)
    killBlacklistEnabled = s
    if s then
        task.spawn(function()
            while killBlacklistEnabled do
                for _, p in ipairs(Players:GetPlayers()) do
                    if not killBlacklistEnabled then break end
                    if p ~= lp and p.Character and blackList[p.Name] then
                        attackTarget(p)
                    end
                end
                task.wait(0.2)
            end
        end)
        WindUI:Notify({Title="黑名单击杀 已开启", Icon="skull", Duration=2})
    else
        WindUI:Notify({Title="黑名单击杀 已关闭", Icon="x", Duration=2})
    end
end})

KillTab:Section({Title="白名单 / 黑名单", TextXAlignment="Left"})
local nameInput = KillTab:Input({Title="输入玩家名字", Placeholder="精确输入玩家名字"})

KillTab:Button({Title="添加到白名单", Desc="白名单玩家免疫击杀全服", Callback=function()
    local n = nameInput.Value
    if n and n ~= "" then
        whiteList[n] = true
        WindUI:Notify({Title="白名单已添加", Content=n, Icon="check", Duration=2})
    end
end})

KillTab:Button({Title="添加到黑名单", Desc="用于仅击杀黑名单模式", Callback=function()
    local n = nameInput.Value
    if n and n ~= "" then
        blackList[n] = true
        WindUI:Notify({Title="黑名单已添加", Content=n, Icon="check", Duration=2})
    end
end})

WindUI:Notify({Title="风花雪月 已加载 ✨", Content="祝测试愉快！", Icon="sparkles", Duration=5})