-- OMEGA HUB MAIN MENU - Grow a Garden
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local GuiService = game:GetService("StarterGui")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.Name = "OMEGAHubUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 400)
Frame.Position = UDim2.new(0.5, -200, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
Frame.BackgroundTransparency = 0.1

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "🌱 OMEGA HUB - Grow A Garden"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

function createButton(text, yPos, callback)
	local button = Instance.new("TextButton", Frame)
	button.Size = UDim2.new(0.9, 0, 0, 40)
	button.Position = UDim2.new(0.05, 0, yPos, 0)
	button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
	button.Text = text
	button.Font = Enum.Font.Gotham
	button.TextColor3 = Color3.new(1,1,1)
	button.TextScaled = true
	button.MouseButton1Click:Connect(callback)
	return button
end

-- Features Implementation
createButton("🌿 Auto Farm", 0.15, function()
	while true do
		local args = {[1] = "Collect",[2] = workspace.Plants:GetChildren()}
		game:GetService("ReplicatedStorage").Remotes.Plants:FireServer(unpack(args))
		task.wait(1)
	end
end)

createButton("🌱 Auto Buy Seeds", 0.25, function()
	while true do
		game:GetService("ReplicatedStorage").Remotes.Store:InvokeServer("Seed", "Buy", "Basic")
		task.wait(1)
	end
end)

createButton("🛠️ Auto Buy Gear", 0.35, function()
	while true do
		game:GetService("ReplicatedStorage").Remotes.Store:InvokeServer("Gear", "Buy", "Best")
		task.wait(1)
	end
end)

createButton("😺 Add Moon Cat Pet", 0.45, function()
	local petData = {
		Name = "Moon Cat",
		Rarity = "Mythic",
		Power = 99999
	}
	game:GetService("ReplicatedStorage").Remotes.Pets:FireServer("Add", petData)
end)

createButton("🧲 Group Pets (Passive)", 0.55, function()
	for _, pet in pairs(workspace.Pets:GetChildren()) do
		if pet:IsA("Model") and pet:FindFirstChild("HumanoidRootPart") then
			pet.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
		end
	end
end)

createButton("🔍 ESP (Show Egg Contents)", 0.65, function()
	for _, egg in pairs(workspace.Eggs:GetChildren()) do
		if egg:IsA("Model") and not egg:FindFirstChild("BillboardGui") then
			local gui = Instance.new("BillboardGui", egg)
			gui.Size = UDim2.new(0, 200, 0, 50)
			gui.AlwaysOnTop = true
			local label = Instance.new("TextLabel", gui)
			label.Size = UDim2.new(1, 0, 1, 0)
			label.Text = "Egg: "..egg.Name
			label.TextColor3 = Color3.new(1,1,1)
			label.BackgroundTransparency = 1
			label.TextScaled = true
		end
	end
end)

createButton("❌ Close Menu", 0.75, function()
	ScreenGui:Destroy()
end)
