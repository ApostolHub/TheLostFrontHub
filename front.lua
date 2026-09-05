local ActiveKey = "UPDATED"

local OldKeys = {
    "RELEASE",
    "TEST",
    "APOSTOLHUB",
    "FRONT",
    "APOSTOLLUA"
}

local TelegramContact = "@apostoltdm"

local SelectedLanguage = "RU"

local Translations = {
    RU = {
        KeyTitle = "⚔️ ApostolHub — Авторизация",
        KeyPlaceholder = "Введите ваш ключ...",
        SubmitKey = "Активировать",
        KeySuccess = "Ключ принят! Загрузка...",
        KeyOld = "Ключ устарел, за новым в тг " .. TelegramContact,
        KeyWrong = "Неверный ключ!",
        KeyGetInfo = "Получить ключ: " .. TelegramContact,
        TabCombat = "Боевые",
        TabESP = "ВХ",
        TabInfo = "Инфо",
        SecWeapons = "Настройки Оружия",
        NoRecoil = "Анти-Отдача (No Recoil)",
        SecAim = "Настройки Камера-Аима",
        AimEnabled = "Включить Aimbot",
        AimKeyHold = "Только при зажатии ПКМ",
        TeamCheck = "Проверка Команды",
        WallCheck = "Проверка Видимости",
        TargetPart = "Куда наводить",
        Smoothness = "Плавность наведения",
        AimMaxDist = "Макс. дистанция аима",
        SecFOV = "Настройки FOV",
        ShowFOV = "Показывать Круг FOV",
        RadiusFOV = "Радиус FOV",
        ColorFOV = "Цвет FOV",
        SecESP = "Основной ESP",
        EnableESP = "Включить ESP",
        Boxes = "Боксы (Boxes)",
        Names = "Имена (Names)",
        Distance = "Дистанция (Distance)",
        Health = "Здоровье (HP)",
        Tracers = "Линии (Tracers)",
        SecFilters = "Фильтры и Цвета",
        ShowTeammates = "Показывать Тиммейтов",
        VisibleCheckESP = "Цвет при видимости (Visible Check)",
        MaxDist = "Максимальная Дистанция",
        EnemyColor = "Цвет Врагов (За стеной)",
        VisibleColor = "Цвет Врагов (Видно)",
        TeammateColor = "Цвет Союзников",
        PartsHead = "Голова",
        PartsBody = "Тело",
        PartsLegs = "Ноги",
        SecKeyInfo = "Информация о ключе",
        KeyStatusActive = "Статус: Ключ активен",
        NotifyContent = "Скрипт успешно активирован в тактическом режиме!"
    },
    EN = {
        KeyTitle = "⚔️ ApostolHub — Tactical Auth",
        KeyPlaceholder = "Enter your key...",
        SubmitKey = "Submit",
        KeySuccess = "Key accepted! Loading...",
        KeyOld = "Key is outdated, get a new one in TG " .. TelegramContact,
        KeyWrong = "Invalid key!",
        KeyGetInfo = "Get key: " .. TelegramContact,
        TabCombat = "Combat",
        TabESP = "ESP",
        TabInfo = "Info",
        SecWeapons = "Weapon Settings",
        NoRecoil = "No Recoil",
        SecAim = "Aimbot Settings",
        AimEnabled = "Enable Aimbot",
        AimKeyHold = "Keyhold Only (RMB)",
        TeamCheck = "Team Check",
        WallCheck = "Wall Check",
        TargetPart = "Target Part",
        Smoothness = "Smoothness",
        AimMaxDist = "Aimbot Max Distance",
        SecFOV = "FOV Settings",
        ShowFOV = "Show FOV Circle",
        RadiusFOV = "FOV Radius",
        ColorFOV = "FOV Color",
        SecESP = "Main ESP",
        EnableESP = "Enable ESP",
        Boxes = "Boxes",
        Names = "Names",
        Distance = "Distance",
        Health = "Health (HP)",
        Tracers = "Tracers",
        SecFilters = "Filters & Colors",
        ShowTeammates = "Show Teammates",
        VisibleCheckESP = "Visible Check Color",
        MaxDist = "Max Distance",
        EnemyColor = "Enemy Color (Hidden)",
        VisibleColor = "Enemy Color (Visible)",
        TeammateColor = "Teammate Color",
        PartsHead = "Head",
        PartsBody = "Body",
        PartsLegs = "Legs",
        SecKeyInfo = "Key Information",
        KeyStatusActive = "Status: Key Active",
        NotifyContent = "Script successfully activated in tactical mode!"
    }
}

local function ChooseLanguage()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ApostolLanguageSelector"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    
    local ok, coreGui = pcall(function() return game:GetService("CoreGui") end)
    gui.Parent = (ok and coreGui) or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    bg.BackgroundTransparency = 0.2
    bg.Parent = gui

    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 320, 0, 180)
    container.Position = UDim2.new(0.5, -160, 0.5, -90)
    container.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
    container.BorderSizePixel = 0
    container.Parent = bg

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(80, 80, 95)
    stroke.Transparency = 0.5
    stroke.Thickness = 1.5
    stroke.Parent = container

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Text = "⚔️ Select Language / Выберите язык"
    title.TextColor3 = Color3.fromRGB(220, 220, 230)
    title.TextSize = 15
    title.Font = Enum.Font.GothamBold
    title.Parent = container

    local function createButton(text, yPos, langCode)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 260, 0, 40)
        btn.Position = UDim2.new(0.5, -130, 0, yPos)
        btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 14
        btn.Font = Enum.Font.GothamSemibold
        btn.Text = text
        btn.Parent = container

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        local selected = false
        btn.MouseButton1Click:Connect(function()
            if not selected then
                selected = true
                SelectedLanguage = langCode
                gui:Destroy()
            end
        end)
    end

    createButton("Русский", 65, "RU")
    createButton("English", 115, "EN")

    local timeout = os.clock() + 15
    while gui.Parent and os.clock() < timeout do
        task.wait(0.1)
    end
    if gui.Parent then
        gui:Destroy()
    end
end

ChooseLanguage()
local T = Translations[SelectedLanguage] or Translations.RU

local function RequestKeyPrompt()
    local verified = false
    local gui = Instance.new("ScreenGui")
    gui.Name = "ApostolKeyAuth"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    
    local ok, coreGui = pcall(function() return game:GetService("CoreGui") end)
    gui.Parent = (ok and coreGui) or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    bg.BackgroundTransparency = 0.2
    bg.Parent = gui

    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 340, 0, 240)
    container.Position = UDim2.new(0.5, -170, 0.5, -120)
    container.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
    container.BorderSizePixel = 0
    container.Parent = bg

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(80, 80, 95)
    stroke.Transparency = 0.5
    stroke.Thickness = 1.5
    stroke.Parent = container

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 45)
    title.BackgroundTransparency = 1
    title.Text = T.KeyTitle
    title.TextColor3 = Color3.fromRGB(220, 220, 230)
    title.TextSize = 15
    title.Font = Enum.Font.GothamBold
    title.Parent = container

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 280, 0, 40)
    textBox.Position = UDim2.new(0.5, -140, 0, 50)
    textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Text = ""
    textBox.PlaceholderText = T.KeyPlaceholder
    textBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 165)
    textBox.TextSize = 14
    textBox.Font = Enum.Font.Gotham
    textBox.ClearTextOnFocus = true
    textBox.Parent = container

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 6)
    boxCorner.Parent = textBox

    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = Color3.fromRGB(80, 80, 95)
    boxStroke.Transparency = 0.7
    boxStroke.Parent = textBox

    local tgLabel = Instance.new("TextLabel")
    tgLabel.Size = UDim2.new(0, 280, 0, 25)
    tgLabel.Position = UDim2.new(0.5, -140, 0, 95)
    tgLabel.BackgroundTransparency = 1
    tgLabel.Text = T.KeyGetInfo
    tgLabel.TextColor3 = Color3.fromRGB(120, 170, 230)
    tgLabel.TextSize = 12
    tgLabel.Font = Enum.Font.GothamSemibold
    tgLabel.Parent = container

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, 0, 0, 25)
    statusLabel.Position = UDim2.new(0, 0, 0, 125)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = ""
    statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    statusLabel.TextSize = 12
    statusLabel.Font = Enum.Font.GothamSemibold
    statusLabel.Parent = container

    local submitBtn = Instance.new("TextButton")
    submitBtn.Size = UDim2.new(0, 280, 0, 40)
    submitBtn.Position = UDim2.new(0.5, -140, 0, 165)
    submitBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 200)
    submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitBtn.TextSize = 14
    submitBtn.Font = Enum.Font.GothamSemibold
    submitBtn.Text = T.SubmitKey
    submitBtn.Parent = container

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = submitBtn

    local function checkKey()
        local inputKey = textBox.Text
        local isValid = (inputKey == ActiveKey)
        local isOld = false

        if not isValid then
            for _, k in ipairs(OldKeys) do
                if k == inputKey then
                    isOld = true
                    break
                end
            end
        end

        if isValid then
            statusLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
            statusLabel.Text = T.KeySuccess
            task.wait(0.8)
            verified = true
            gui:Destroy()
        elseif isOld then
            statusLabel.TextColor3 = Color3.fromRGB(255, 180, 100)
            statusLabel.Text = T.KeyOld
        else
            statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            statusLabel.Text = T.KeyWrong
        end
    end

    submitBtn.MouseButton1Click:Connect(checkKey)
    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then checkKey() end
    end)

    while gui.Parent and not verified do
        task.wait(0.1)
    end
    if not verified then
        error("Авторизация отменена.")
    end
end

RequestKeyPrompt()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Environment = getgenv and getgenv() or shared

if Environment.ApostolHub and type(Environment.ApostolHub.Unload) == "function" then
    pcall(Environment.ApostolHub.Unload)
end

if not Drawing or type(Drawing.new) ~= "function" then
    error("Ваш эксплоит не поддерживает библиотеку Drawing!")
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Controller = {
    Unloaded = false,
    AimbotTarget = nil,
    IsAiming = false,
    TeamRegistryFound = false,
    LocalTeam = "unknown",
    Connections = {},
    PlayerEntries = {},
    Settings = {
        AimbotEnabled = false,
        AimbotTeamCheck = true,
        AimbotWallCheck = true,
        AimbotTargetPart = T.PartsHead,
        AimbotSmoothness = 3,
        AimbotKeyHold = true,
        AimbotFOV = 150,
        AimbotMaxDistance = 1500,
        AimbotShowFOV = true,
        AimbotFOVColor = Color3.fromRGB(200, 200, 220),
        AimbotFOVThickness = 1,
        AimbotFOVOpacity = 0.8,
        NoRecoilEnabled = false,
        PlayerEnabled = true,
        PlayerBoxes = true,
        PlayerNames = true,
        PlayerDistance = true,
        PlayerHealth = true,
        PlayerTracers = false,
        ShowTeammates = false,
        ESPVisibleCheck = true,
        PlayerMaxDistance = 2500,
        EnemyColor = Color3.fromRGB(255, 80, 80),
        VisibleEnemyColor = Color3.fromRGB(80, 255, 120),
        TeammateColor = Color3.fromRGB(80, 150, 255),
        BoxThickness = 1,
        TextSize = 13
    }
}

Environment.ApostolHub = Controller

local function addConnection(connection)
    table.insert(Controller.Connections, connection)
    return connection
end

local function createDrawing(kind, properties)
    local object = Drawing.new(kind)
    for property, value in pairs(properties) do
        object[property] = value
    end
    return object
end

local function removeDrawing(object)
    if not object then return end
    pcall(function() object.Visible = false end)
    pcall(function()
        if object.Remove then object:Remove() else object:Destroy() end
    end)
end

local FOVCircle = createDrawing("Circle", {
    Visible = false,
    Filled = false,
    Color = Controller.Settings.AimbotFOVColor,
    NumSides = 72,
    Radius = Controller.Settings.AimbotFOV,
    Thickness = Controller.Settings.AimbotFOVThickness,
    Transparency = Controller.Settings.AimbotFOVOpacity,
    ZIndex = 5
})

local function createVisual()
    local font = Drawing.Fonts and (Drawing.Fonts.Plex or Drawing.Fonts.UI) or 2
    return {
        Outline = createDrawing("Square", { Visible = false, Filled = false, Color = Color3.new(0, 0, 0), Thickness = 3, Transparency = 1, ZIndex = 1 }),
        Box = createDrawing("Square", { Visible = false, Filled = false, Color = Color3.new(1, 1, 1), Thickness = 1, Transparency = 1, ZIndex = 2 }),
        Text = createDrawing("Text", { Visible = false, Center = true, Outline = true, OutlineColor = Color3.new(0, 0, 0), Color = Color3.new(1, 1, 1), Size = 13, Font = font, Transparency = 1, ZIndex = 3 }),
        Tracer = createDrawing("Line", { Visible = false, Color = Color3.new(1, 1, 1), Thickness = 1, Transparency = 1, ZIndex = 2 })
    }
end

local function hideVisual(visual)
    visual.Outline.Visible = false
    visual.Box.Visible = false
    visual.Text.Visible = false
    visual.Tracer.Visible = false
end

local function removeVisual(visual)
    removeDrawing(visual.Outline)
    removeDrawing(visual.Box)
    removeDrawing(visual.Text)
    removeDrawing(visual.Tracer)
end

local TeamRegistry
local LastTeamRegistrySearch = 0

local function getTeamRegistry()
    if TeamRegistry and type(TeamRegistry.players) == "table" then
        return TeamRegistry
    end

    if os.clock() - LastTeamRegistrySearch < 2 then
        return nil
    end

    LastTeamRegistrySearch = os.clock()
    if type(filtergc) ~= "function" then
        return nil
    end

    local success, registry = pcall(filtergc, "table", {
        Keys = { "isFriendly", "getclient", "getEnemyTeam", "getPlayer", "players" }
    }, true)

    if not success or type(registry) ~= "table" or type(registry.players) ~= "table" then
        return nil
    end

    TeamRegistry = registry
    Controller.TeamRegistryFound = true
    local clientData = registry.players[LocalPlayer]
    Controller.LocalTeam = clientData and clientData.team or "unknown"
    return registry
end

local function isTeammate(player)
    if not player then return false end

    local registry = getTeamRegistry()
    if registry then
        local clientData = registry.players[LocalPlayer]
        local playerData = registry.players[player]
        if clientData and playerData and clientData.team and playerData.team then
            return clientData.team == playerData.team
        end
    end

    if player == LocalPlayer then return true end

    if LocalPlayer.Team and player.Team then
        return LocalPlayer.Team == player.Team
    end

    local localCharacter = LocalPlayer.Character
    local character = player.Character
    if not localCharacter or not character then return false end

    local localContainer = localCharacter.Parent
    local targetContainer = character.Parent
    if not localContainer or not targetContainer or localContainer == Workspace or targetContainer == Workspace then
        return false
    end

    return localContainer == targetContainer
end

local function isPartVisible(part, camera)
    if not part then return false end

    local origin = camera.CFrame.Position
    local targetPos = part.Position
    local direction = targetPos - origin

    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    
    local ignoreList = { camera }
    if LocalPlayer.Character then table.insert(ignoreList, LocalPlayer.Character) end
    if part.Parent then table.insert(ignoreList, part.Parent) end
    
    raycastParams.FilterDescendantsInstances = ignoreList
    raycastParams.IgnoreWater = true

    local result = Workspace:Raycast(origin, direction, raycastParams)
    return result == nil
end

local function getAimbotTargetPart(player)
    local char = player and player.Character
    if not char then return nil end

    local choice = Controller.Settings.AimbotTargetPart
    if choice == T.PartsHead then
        return char:FindFirstChild("Head")
    elseif choice == T.PartsBody then
        return char:FindFirstChild("HumanoidRootPart") 
            or char:FindFirstChild("UpperTorso") 
            or char:FindFirstChild("Torso")
    elseif choice == T.PartsLegs then
        return char:FindFirstChild("RightUpperLeg") 
            or char:FindFirstChild("LeftUpperLeg") 
            or char:FindFirstChild("Right Leg") 
            or char:FindFirstChild("Left Leg") 
            or char:FindFirstChild("HumanoidRootPart")
    end
    return char:FindFirstChild("Head")
end

addConnection(UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Controller.IsAiming = true
    end
end))

addConnection(UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Controller.IsAiming = false
    end
end))

local function updateAimbot(camera)
    local settings = Controller.Settings
    local center = camera.ViewportSize * 0.5

    FOVCircle.Position = center
    FOVCircle.Radius = settings.AimbotFOV
    FOVCircle.Thickness = settings.AimbotFOVThickness
    FOVCircle.Transparency = settings.AimbotFOVOpacity
    FOVCircle.Visible = settings.AimbotEnabled and settings.AimbotShowFOV

    if not settings.AimbotEnabled then
        Controller.AimbotTarget = nil
        return
    end

    if settings.AimbotKeyHold and not Controller.IsAiming then
        Controller.AimbotTarget = nil
        return
    end

    local currentTarget = Controller.AimbotTarget
    local targetValid = false
    if currentTarget and currentTarget.Character then
        local humanoid = currentTarget.Character:FindFirstChildOfClass("Humanoid")
        local root = currentTarget.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoid and humanoid.Health > 0 and root and myRoot then
            local dist = (root.Position - myRoot.Position).Magnitude
            if dist <= settings.AimbotMaxDistance then
                if not (settings.AimbotTeamCheck and isTeammate(currentTarget)) then
                    targetValid = true
                                    end
                end
            end
        end

        local bestTarget = targetValid and currentTarget or nil
        local bestPart = bestTarget and getAimbotTargetPart(bestTarget) or nil

        if not bestTarget then
            local bestScreenDistance = settings.AimbotFOV

            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    if not (settings.AimbotTeamCheck and isTeammate(player)) then
                        local char = player.Character
                        local root = char and char:FindFirstChild("HumanoidRootPart")
                        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        if char and root and humanoid and humanoid.Health > 0 then
                            local dist = myRoot and (root.Position - myRoot.Position).Magnitude or 0
                            if dist <= settings.AimbotMaxDistance then
                                local part = getAimbotTargetPart(player)
                                if part then
                                    if not settings.AimbotWallCheck or isPartVisible(part, camera) then
                                        local screenPoint, onScreen = camera:WorldToViewportPoint(part.Position)
                                        if onScreen and screenPoint.Z > 0 then
                                            local screenDistance = (Vector2.new(screenPoint.X, screenPoint.Y) - center).Magnitude
                                            if screenDistance <= bestScreenDistance then
                                                bestScreenDistance = screenDistance
                                                bestTarget = player
                                                bestPart = part
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        Controller.AimbotTarget = bestTarget

        if bestTarget and bestPart then
            local targetPos = bestPart.Position
            local currentCFrame = camera.CFrame
            local targetCFrame = CFrame.new(currentCFrame.Position, targetPos)
            local lerpFactor = math.clamp(1 / math.max(settings.AimbotSmoothness, 1), 0.05, 1)
            camera.CFrame = currentCFrame:Lerp(targetCFrame, lerpFactor)
        end
    end

    local function getBounds(model, camera)
        local success, boxCFrame, boxSize = pcall(model.GetBoundingBox, model)
        if not success or boxSize.Magnitude <= 0 then return nil end

        local minX, minY = math.huge, math.huge
        local maxX, maxY = -math.huge, -math.huge
        local viewport = camera.ViewportSize

        for x = -1, 1, 2 do
            for y = -1, 1, 2 do
                for z = -1, 1, 2 do
                    local worldPoint = boxCFrame:PointToWorldSpace(Vector3.new(boxSize.X * x * 0.5, boxSize.Y * y * 0.5, boxSize.Z * z * 0.5))
                    local screenPoint = camera:WorldToViewportPoint(worldPoint)
                    if screenPoint.Z <= 0 then return nil end
                    minX = math.min(minX, screenPoint.X)
                    minY = math.min(minY, screenPoint.Y)
                    maxX = math.max(maxX, screenPoint.X)
                    maxY = math.max(maxY, screenPoint.Y)
                end
            end
        end

        if maxX < 0 or maxY < 0 or minX > viewport.X or minY > viewport.Y then return nil end
        return Vector2.new(minX, minY), Vector2.new(maxX - minX, maxY - minY)
    end

    local ModifiedRecoilTables = setmetatable({}, {__mode = "k"})
    local LastRecoilSearch = 0
    local recoilKeys = {
        "recoil", "Recoil", "camRecoil", "camrecoil", "CameraKick", "camerakick",
        "RecoilKick", "recoilkick", "MaxRecoil", "maxrecoil", "recoilForce",
        "recoilSpring", "recoilX", "recoilY", "recoil_x", "recoil_y",
        "recoilMultiplier", "recoilAmount", "spread", "Spread", "minSpread", "maxSpread",
        "kickBack", "kick", "Kick"
    }

    local function zeroOutValue(tbl, key)
        local val = rawget(tbl, key)
        if val == nil then return end
        local valType = typeof(val)
        if valType == "number" then
            tbl[key] = 0
        elseif valType == "Vector3" then
            tbl[key] = Vector3.new(0, 0, 0)
        elseif valType == "Vector2" then
            tbl[key] = Vector2.new(0, 0)
        elseif valType == "NumberRange" then
            tbl[key] = NumberRange.new(0, 0)
        elseif valType == "table" then
            for subKey, subVal in pairs(val) do
                if typeof(subVal) == "number" then val[subKey] = 0
                elseif typeof(subVal) == "Vector3" then val[subKey] = Vector3.new(0, 0, 0)
                elseif typeof(subVal) == "Vector2" then val[subKey] = Vector2.new(0, 0) end
            end
        end
    end

    local function applyNoRecoil()
        if not Controller.Settings.NoRecoilEnabled then return end
        local now = os.clock()
        if now - LastRecoilSearch > 1.5 then
            LastRecoilSearch = now
            local gcTables = {}
            if type(filtergc) == "function" then
                pcall(function() gcTables = filtergc("table", { Keys = {"Recoil", "recoil", "camRecoil", "CameraKick"} }) end)
            end
            if (#gcTables == 0) and type(getgc) == "function" then
                pcall(function()
                    for _, obj in pairs(getgc(true)) do
                        if type(obj) == "table" then table.insert(gcTables, obj) end
                    end
                end)
            end
            for _, tbl in ipairs(gcTables) do
                if type(tbl) == "table" then
                    for _, key in ipairs(recoilKeys) do
                        if rawget(tbl, key) ~= nil then
                            ModifiedRecoilTables[tbl] = true
                            break
                        end
                    end
                end
            end
        end
        for tbl in pairs(ModifiedRecoilTables) do
            for _, key in ipairs(recoilKeys) do
                pcall(zeroOutValue, tbl, key)
            end
        end
    end

    addConnection(RunService.RenderStepped:Connect(function()
        local camera = Workspace.CurrentCamera
        if not camera then return end

        updateAimbot(camera)
        applyNoRecoil()

        if not Controller.Settings.PlayerEnabled then
            for _, visual in pairs(Controller.PlayerEntries) do hideVisual(visual) end
            return
        end

        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")

        for _, player in ipairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end

            if not Controller.PlayerEntries[player] then
                Controller.PlayerEntries[player] = createVisual()
            end

            local visual = Controller.PlayerEntries[player]
            local char = player.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local humanoid = char and char:FindFirstChildOfClass("Humanoid")

            if char and root and humanoid and humanoid.Health > 0 then
                local teammate = isTeammate(player)
                
                if teammate and not Controller.Settings.ShowTeammates then
                    hideVisual(visual)
                    continue
                end

                local dist = myRoot and (root.Position - myRoot.Position).Magnitude or 0
                if dist <= Controller.Settings.PlayerMaxDistance then
                    local pos, size = getBounds(char, camera)
                    if pos and size then
                        local headPart = char:FindFirstChild("Head") or root
                        local isVisible = isPartVisible(headPart, camera)

                        local color
                        if teammate then
                            color = Controller.Settings.TeammateColor
                        else
                            if Controller.Settings.ESPVisibleCheck and isVisible then
                                color = Controller.Settings.VisibleEnemyColor
                            else
                                color = Controller.Settings.EnemyColor
                            end
                        end
                        
                        if Controller.Settings.PlayerBoxes then
                            visual.Box.Position = pos
                            visual.Box.Size = size
                            visual.Box.Color = color
                            visual.Box.Thickness = Controller.Settings.BoxThickness
                            visual.Box.Visible = true

                            visual.Outline.Position = pos - Vector2.new(1, 1)
                            visual.Outline.Size = size + Vector2.new(2, 2)
                            visual.Outline.Visible = true
                        else
                            visual.Box.Visible = false
                            visual.Outline.Visible = false
                        end

                        if Controller.Settings.PlayerNames or Controller.Settings.PlayerDistance or Controller.Settings.PlayerHealth then
                            local textParts = {}
                            if Controller.Settings.PlayerNames then table.insert(textParts, player.DisplayName) end
                            if Controller.Settings.PlayerDistance then table.insert(textParts, math.floor(dist) .. "m") end
                            if Controller.Settings.PlayerHealth then table.insert(textParts, math.floor(humanoid.Health) .. "HP") end
                            
                            visual.Text.Position = Vector2.new(pos.X + size.X / 2, pos.Y - 16)
                            visual.Text.Text = table.concat(textParts, " | ")
                            visual.Text.Color = color
                            visual.Text.Size = Controller.Settings.TextSize
                            visual.Text.Visible = true
                        else
                            visual.Text.Visible = false
                        end

                        if Controller.Settings.PlayerTracers then
                            visual.Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                            visual.Tracer.To = Vector2.new(pos.X + size.X / 2, pos.Y + size.Y)
                            visual.Tracer.Color = color
                            visual.Tracer.Visible = true
                        else
                            visual.Tracer.Visible = false
                        end
                    else
                        hideVisual(visual)
                    end
                else
                    hideVisual(visual)
                end
            else
                hideVisual(visual)
            end
        end
    end))

    addConnection(Players.PlayerRemoving:Connect(function(player)
        if Controller.PlayerEntries[player] then
            removeVisual(Controller.PlayerEntries[player])
            Controller.PlayerEntries[player] = nil
        end
    end))

    Controller.Unload = function()
        Controller.Unloaded = true
        for _, conn in ipairs(Controller.Connections) do pcall(function() conn:Disconnect() end) end
        for _, visual in pairs(Controller.PlayerEntries) do removeVisual(visual) end
        removeDrawing(FOVCircle)
        Rayfield:Destroy()
    end

    local Window = Rayfield:CreateWindow({
        Name = "⚔️ ApostolHub | Tactical Edition",
        LoadingTitle = "ApostolHub Tactical",
        LoadingSubtitle = "by Apostol",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "ApostolHubTactical",
            FileName = "ApostolHubConfig"
        },
        KeySystem = false
    })

    local CombatTab = Window:CreateTab(T.TabCombat, 4483362458)
    CombatTab:CreateSection(T.SecWeapons)

    CombatTab:CreateToggle({
        Name = T.NoRecoil,
        CurrentValue = Controller.Settings.NoRecoilEnabled,
        Callback = function(Value)
            Controller.Settings.NoRecoilEnabled = Value
        end
    })

    CombatTab:CreateSection(T.SecAim)

    CombatTab:CreateToggle({
        Name = T.AimEnabled,
        CurrentValue = Controller.Settings.AimbotEnabled,
        Callback = function(Value)
            Controller.Settings.AimbotEnabled = Value
        end
    })

    CombatTab:CreateToggle({
        Name = T.AimKeyHold,
        CurrentValue = Controller.Settings.AimbotKeyHold,
        Callback = function(Value)
            Controller.Settings.AimbotKeyHold = Value
        end
    })

    CombatTab:CreateToggle({
        Name = T.TeamCheck,
        CurrentValue = Controller.Settings.AimbotTeamCheck,
        Callback = function(Value)
            Controller.Settings.AimbotTeamCheck = Value
        end
    })

    CombatTab:CreateToggle({
        Name = T.WallCheck,
        CurrentValue = Controller.Settings.AimbotWallCheck,
        Callback = function(Value)
            Controller.Settings.AimbotWallCheck = Value
        end
    })

    CombatTab:CreateDropdown({
        Name = T.TargetPart,
        Options = {T.PartsHead, T.PartsBody, T.PartsLegs},
        CurrentOption = T.PartsHead,
        Callback = function(Option)
            Controller.Settings.AimbotTargetPart = Option
        end
    })

    CombatTab:CreateSlider({
        Name = T.Smoothness,
        Range = {1, 10},
        Increment = 1,
        CurrentValue = Controller.Settings.AimbotSmoothness,
        Callback = function(Value)
            Controller.Settings.AimbotSmoothness = Value
        end
    })

    CombatTab:CreateSlider({
        Name = T.AimMaxDist,
        Range = {100, 5000},
        Increment = 50,
        CurrentValue = Controller.Settings.AimbotMaxDistance,
        Callback = function(Value)
            Controller.Settings.AimbotMaxDistance = Value
        end
    })

    CombatTab:CreateSection(T.SecFOV)

    CombatTab:CreateToggle({
        Name = T.ShowFOV,
        CurrentValue = Controller.Settings.AimbotShowFOV,
        Callback = function(Value)
            Controller.Settings.AimbotShowFOV = Value
        end
    })

    CombatTab:CreateSlider({
        Name = T.RadiusFOV,
        Range = {30, 600},
        Increment = 5,
        CurrentValue = Controller.Settings.AimbotFOV,
        Callback = function(Value)
            Controller.Settings.AimbotFOV = Value
        end
    })

    CombatTab:CreateColorPicker({
        Name = T.ColorFOV,
        Color = Controller.Settings.AimbotFOVColor,
        Callback = function(Value)
            Controller.Settings.AimbotFOVColor = Value
        end
    })

    local ESPTab = Window:CreateTab(T.TabESP, 4483362458)
    ESPTab:CreateSection(T.SecESP)

    ESPTab:CreateToggle({
        Name = T.EnableESP,
        CurrentValue = Controller.Settings.PlayerEnabled,
        Callback = function(Value)
            Controller.Settings.PlayerEnabled = Value
        end
    })

    ESPTab:CreateToggle({
        Name = T.Boxes,
        CurrentValue = Controller.Settings.PlayerBoxes,
        Callback = function(Value)
            Controller.Settings.PlayerBoxes = Value
        end
    })

    ESPTab:CreateToggle({
        Name = T.Names,
        CurrentValue = Controller.Settings.PlayerNames,
        Callback = function(Value)
            Controller.Settings.PlayerNames = Value
        end
    })

    ESPTab:CreateToggle({
        Name = T.Distance,
        CurrentValue = Controller.Settings.PlayerDistance,
        Callback = function(Value)
            Controller.Settings.PlayerDistance = Value
        end
    })

    ESPTab:CreateToggle({
        Name = T.Health,
        CurrentValue = Controller.Settings.PlayerHealth,
        Callback = function(Value)
            Controller.Settings.PlayerHealth = Value
        end
    })

    ESPTab:CreateToggle({
        Name = T.Tracers,
        CurrentValue = Controller.Settings.PlayerTracers,
        Callback = function(Value)
            Controller.Settings.PlayerTracers = Value
        end
    })

    ESPTab:CreateSection(T.SecFilters)

    ESPTab:CreateToggle({
        Name = T.ShowTeammates,
        CurrentValue = Controller.Settings.ShowTeammates,
        Callback = function(Value)
            Controller.Settings.ShowTeammates = Value
        end
    })

    ESPTab:CreateToggle({
        Name = T.VisibleCheckESP,
        CurrentValue = Controller.Settings.ESPVisibleCheck,
        Callback = function(Value)
            Controller.Settings.ESPVisibleCheck = Value
        end
    })

    ESPTab:CreateSlider({
        Name = T.MaxDist,
        Range = {100, 5000},
        Increment = 50,
        CurrentValue = Controller.Settings.PlayerMaxDistance,
        Callback = function(Value)
            Controller.Settings.PlayerMaxDistance = Value
        end
    })

    ESPTab:CreateColorPicker({
        Name = T.EnemyColor,
        Color = Controller.Settings.EnemyColor,
        Callback = function(Value)
            Controller.Settings.EnemyColor = Value
        end
    })

    ESPTab:CreateColorPicker({
        Name = T.VisibleColor,
        Color = Controller.Settings.VisibleEnemyColor,
        Callback = function(Value)
            Controller.Settings.VisibleEnemyColor = Value
        end
    })

    ESPTab:CreateColorPicker({
        Name = T.TeammateColor,
        Color = Controller.Settings.TeammateColor,
        Callback = function(Value)
            Controller.Settings.TeammateColor = Value
        end
    })

    local InfoTab = Window:CreateTab(T.TabInfo, 4483362458)
    InfoTab:CreateSection(T.SecKeyInfo)
    InfoTab:CreateLabel(T.KeyStatusActive)

    Rayfield:Notify({
        Title = "⚔️ ApostolHub Tactical",
        Content = T.NotifyContent,
        Duration = 4
    })

            