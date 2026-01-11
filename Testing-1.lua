local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local MainWindow = Rayfield:CreateWindow({
   Name = "Main",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by Troa",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = Xhubv2, -- Create a custom folder for your hub/game
      FileName = "X HubUniV2"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/CMBTtXNfAC", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "XhubUniV2",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Xhubkey.lua", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"iloveuXenoz"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local MainTab = MainWindow:CreateTab("Player", 4483362458) -- Title, Image

-- infinite jump

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local infJumpEnabled = false
local jumpConnection = nil

MainTab:CreateButton({
    Name = "Infinite Jump",
    Callback = function()

        infJumpEnabled = not infJumpEnabled

        if infJumpEnabled then
            -- İLERİ (AÇIK)
            jumpConnection = UIS.JumpRequest:Connect(function()
                local character = player.Character
                if not character then return end

                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if not humanoid then return end

                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end)

        else
            -- GERİ (KAPALI)
            if jumpConnection then
                jumpConnection:Disconnect()
                jumpConnection = nil
            end
        end
    end,
})

--Noclip

local Button = MainTab:CreateButton({
   Name = "Noclip",
   Callback = function(Noclip)
loadstring(game:HttpGet("https://pastebin.com/raw/TNpKEPEp"))()
   end,
})



---Walk Speed Jump power

 local Slider = MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 250},
    Increment = 10,
    Suffix = "Walkspeed",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end,
 })


  local Slider = MainTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 10,
    Suffix = "JumpPower",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end,
 })

 local MainTab = MainWindow:CreateTab("Visual", 4483362458) -- Title, Image

-- ESP

 local Button = MainTab:CreateButton({
   Name = "Basic Esp",
   Range = {16, 250},
   Increment = 10,
    Suffix = "Espdistance",
   Callback = function(Wallhack)

getgenv().ESPEnabled = true -- toggle true = esp false = no esp

local function createESP(player)
	if player ~= game.Players.LocalPlayer and player.Character then
		local character = player.Character
		if not character:FindFirstChild("Highlight") then
			local highlight = Instance.new("Highlight", character)
			highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red
			highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- White
			highlight.FillTransparency = 0.5
			highlight.OutlineTransparency = 0
		end
	end
end

local function updateESP()
	while getgenv().ESPEnabled do
		for _, player in pairs(game.Players:GetPlayers()) do
			createESP(player)
		end
		wait(0.2)
	end
	for _, player in pairs(game.Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("Highlight") then
			player.Character.Highlight:Destroy()
		end
	end
end

game.Players.PlayerAdded:Connect(createESP)
updateESP()

   end,
})

local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

getgenv().StretchedEnabled = false
getgenv().StretchValue = 0.80 -- 0.70 = daha fazla, 0.85 = daha az

local stretchConnection
local originalCFrame

local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

getgenv().StretchValue = 0.80
local enabled = false
local stretchConnection

--STRETCHED RES

local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local stretchConnection = nil
local StretchValue = 0.80 -- ayar

MainTab:CreateToggle({
    Name = "Stretched Res",
    Default = false, -- geri konumda başlar
    Callback = function(state)

        if state then
            -- İLERİ (AÇIK)
            stretchConnection = RunService.RenderStepped:Connect(function()
                Camera.CFrame =
                    Camera.CFrame * CFrame.new(
                        0, 0, 0,
                        1, 0, 0,
                        0, StretchValue, 0,
                        0, 0, 1
                    )
            end)

        else
            -- GERİ (KAPALI)
            if stretchConnection then
                stretchConnection:Disconnect()
                stretchConnection = nil
            end
        end
    end,
})

-- Aimbot - Hitbox

local MainTab = MainWindow:CreateTab("Aimbot", 4483362458) -- Title, Image

local Button = MainTab:CreateButton({
   Name = "Aimbot Gui",
   Callback = function(Aimbot)
loadstring(game:HttpGet("https://raw.githubusercontent.com/zysws/scripts/main/universal-aimbot.luau"))()
   end,
})