--= @(This code was written by Zestycodes, and is ultimately simple to understand.) =--
local X
getgenv = getgenv or function() return _G end
local Library = {}

local rainbowcolor = Color3.fromRGB(1, 1, 1)

local function code(f)
	f()
end

task.spawn(function()
code(function()
	(function()
		spawn(function()
			return (function()
				return {(function()
					return task.spawn(function()
						while game:GetService("RunService").Heartbeat:wait() do
							for i = 0, 1, 0.001*5 do
								rainbowcolor = Color3.fromHSV(i,1,1)
								wait()
							end
						end
					end)
				end)()}
			end)()
		end)
	end)()
end)
end)

local huifolder = Instance.new("Folder",game.CoreGui)
huifolder.Name = "Imgui"

if syn and syn.protect_gui then
	pcall(syn.protect_gui, huifolder)
end

(function()
	spawn(function()
		a={(function()
			a = game:GetService("HttpService"):GenerateGUID(false)
			for i = 1, 90 do
				a = a..game:GetService("HttpService"):GenerateGUID(false)
			end
			X = a
		end)()}
	end)
end)()
repeat task.wait(0.5) until X ~= nil

huifolder.Name = X

if debug and debug.getmetatable and setreadonly and checkcaller and newcclosure then
	meta = debug.getmetatable(game)
	setreadonly(meta, false)
	old = {meta.__namecall, meta.__index, meta.__newindex}
	meta.__namecall = newcclosure(function(self, ...)
		if not checkcaller() and self == huifolder then
			return old[1](self, ...)
		elseif checkcaller() and self == huifolder then
			return old[1](nil)
		end
		return old[1](self, ...)
	end)
	meta.__index = newcclosure(function(self, prop)
		if not checkcaller() and self == huifolder then
			return old[2](self, prop)
		elseif checkcaller() and self == huifolder then
			return old[2](nil, nil)
		end
		return old[2](self, prop)
	end)
	meta.__newidex = newcclosure(function(self, prop, val)
		if self == huifolder and not checkcaller() then
			return old[3](self, prop, val)
		elseif self == huifolder and checkcaller() then
			return old[3](self, prop, val)
		end
		return old[3](self, prop, val)
	end)
end

local HUI = gethui or function()
	return huifolder
end

function LabelToButton(txtLabel, runfunc)
	local data
	local hovering = false
	txtLabel.Selectable = false

	txtLabel.MouseEnter:Connect(function()
		hovering = true
	end)

	txtLabel.MouseLeave:Connect(function()
		hovering = false
	end)

	txtLabel.InputBegan:Connect(function(ip)
		if ip.UserInputType == Enum.UserInputType.MouseButton1 and hovering == true then
			data = runfunc()
		end
	end)
end

function draggable(topbar, menu)
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		menu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	topbar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = menu.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	topbar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game.UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

local gui_imgui = Instance.new("ScreenGui")
gui_imgui.Name = game:GetService("HttpService"):GenerateGUID(false)

if syn and syn.protect_gui then
	syn.protect_gui(gui_imgui)
end
gui_imgui.Parent = HUI()

Library.new = function(title, size, maincolor, lighttheme, addoptions)
	if maincolor == nil then
		if lighttheme then
			maincolor = Color3.fromRGB(6, 209, 255)
		else
			maincolor = Color3.fromRGB(19, 121, 255)
		end
	end

	local textcolor
	local backgroundclr
	if lighttheme then
		textcolor = Color3.fromRGB(27, 27, 27)
		backgroundclr = Color3.fromRGB(211, 211, 211)
	else
		textcolor = Color3.fromRGB(255, 255, 255)
		backgroundclr = Color3.fromRGB(34, 34, 34)
	end

	local img = {Rainbow = false}
	local ImGuiv1 = Instance.new("Frame")
	game:GetService("UserInputService").InputBegan:Connect(function(ip)
		if ip.KeyCode == Enum.KeyCode.Insert then
			ImGuiv1.Visible = not ImGuiv1.Visible
		end
	end)
	ImGuiv1.AutoLocalize = false
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local UICorner_2 = Instance.new("UICorner")
	local Tabs = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")

	draggable(Title, ImGuiv1)

	gui_imgui.Name = "$imgui"

	ImGuiv1.Name = "ImGui.v1"
	ImGuiv1.Parent = gui_imgui
	ImGuiv1.BackgroundColor3 = backgroundclr
	ImGuiv1.Position = UDim2.new(0.363244176, 0, 0.270512819, 0)
	ImGuiv1.Size = UDim2.new(0, 316, 0, 358)

	UICorner.Parent = ImGuiv1

	Title.Name = "Title"
	Title.Parent = ImGuiv1
	Title.BackgroundColor3 = maincolor
	Title.Position = UDim2.new(-0.00067988527, 0, -0.000436921371, 0)
	Title.Size = UDim2.new(0, 316, 0, 37)
	Title.Font = Enum.Font.Code
	Title.Text = " "..tostring(title) or " $imgui v1.0a"
	if lighttheme == true then
		Title.TextColor3 = Color3.fromRGB(40, 40, 40)
	else
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
	Title.TextSize = 16.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.TextYAlignment = Enum.TextYAlignment.Top
	game:GetService("RunService")["RenderStepped"]:Connect(function()
		if img.Rainbow then
			Title.BackgroundColor3 = rainbowcolor
		else
			Title.BackgroundColor3 = maincolor
		end
	end)

	UICorner_2.Parent = Title

	Tabs.Name = "Tabs"
	Tabs.Parent = ImGuiv1
	if #{setmetatable({0x4},{__index = function() return nil end})} >= -1 then
		if lighttheme then
			Tabs.BackgroundColor3 = Color3.fromRGB(backgroundclr.R-34,backgroundclr.G-34,backgroundclr.B-34)
		else
			Tabs.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		end
	end
	Tabs.Position = UDim2.new(-0.00067988527, 0, 0.0498424098, 0)
	Tabs.Size = UDim2.new(0, 316, 0, 19)

	UICorner_3.CornerRadius = UDim.new(0, 2)
	UICorner_3.Parent = Tabs

	Instance.new("UIListLayout", Tabs).FillDirection = Enum.FillDirection.Horizontal

	img.Section = function(title)
		local Children = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")

		Children.Name = title
		Children.Parent = ImGuiv1
		Children.BackgroundColor3 = backgroundclr
		Children.BackgroundTransparency = 1.000
		Children.Position = UDim2.new(0.00999999978, 0, 0.103, 0)
		Children.Size = UDim2.new(0, 312, 0, 321)
		Children.Visible = false
		Children.BorderSizePixel = 0
		UICorner.CornerRadius = UDim.new(0, 2)
		UICorner.Parent = Children

		UIListLayout.Parent = Children
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 2)

		local API = {}
		local Tab = Instance.new("TextLabel")
		local UICorner = Instance.new("UICorner")

		Tab.Name = "Tab"
		Tab.Parent = Tabs
		Tab.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		game:GetService("RunService")["RenderStepped"]:Connect(function()
			if img.Rainbow then
				Tab.BackgroundColor3 = rainbowcolor
			else
				Tab.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
			end
		end)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Tab.Size = UDim2.new(0, 53, 0, 19)
		Tab.Font = Enum.Font.Code
		Tab.Text = title or "Tab"
		Tab.TextColor3 = textcolor
		Tab.TextSize = 14.000
		Tab.Size = UDim2.new(0, 50 + #title + 2, 0, 16)

		local _ = nil;

		LabelToButton(Tab, function()
			for _, v in pairs(ImGuiv1:GetChildren()) do
				if v:IsA("Frame") and v.Name:find(Children.Name) then
					v.Visible = true
				elseif v:IsA("Frame") and not v.Name:find(Children.Name) then
					v.Visible = false
				else end
			end
			Tabs.Visible = true
			Title.Visible = true
		end)

		UICorner.Parent = Tab

		API.Button = function(title)
			local yep = {}
			local TextLabel = Instance.new("TextLabel")

			TextLabel.Parent = Children
			TextLabel.BackgroundColor3 = maincolor
			game:GetService("RunService")["RenderStepped"]:Connect(function()
				if img.Rainbow then
					TextLabel.BackgroundColor3 = rainbowcolor
				else
					TextLabel.BackgroundColor3 = maincolor
				end
			end)
			TextLabel.Size = UDim2.new(0, 67, 0, 15)
			TextLabel.Font = Enum.Font.Code
			TextLabel.TextColor3 = Color3.fromRGB(216, 216, 216)
			TextLabel.TextSize = 14.000

			TextLabel.Text = title
			TextLabel.Size = UDim2.new(0, TextLabel.TextBounds.X + 2, 0, 15)

			yep.OnClick = {}
			function yep.OnClick:Connect(f)
				LabelToButton(TextLabel, function()
					f()
				end)
			end
			return yep
		end

		API.Label = function(text)
			local label = Instance.new("TextLabel")
			game:GetService("RunService")["RenderStepped"]:Connect(function()
				if img.Rainbow then
					label.BackgroundColor3 = rainbowcolor
				else
					label.BackgroundColor3 = maincolor
				end
			end)
			label.Parent = Children
			label.BackgroundColor3 = maincolor
			label.TextColor3 = Color3.fromRGB(255, 255, 255)
			label.Font = Enum.Font.Code
			label.Position = UDim2.new(0, 0, 0.0654205605, 0)
			label.Size = UDim2.new(0, 312, 0, 16)
			label.TextSize = 14.000
			label.TextXAlignment = Enum.TextXAlignment.Left

			label.Text = " "..tostring(text) or " "

			return {
				setText = function(txt)
					label.Text = " "..tostring(txt)
				end,
			}
		end

		API.Checkbox = function(title)
			local yep = {Toggled = false}
			local state = false
			local Toggle = Instance.new("Frame")
			local Check = Instance.new("ImageLabel")
			local Frame = Instance.new("TextLabel")
			local Title = Instance.new("TextLabel")
			local Button = Instance.new("TextLabel")

			Toggle.Name = "Toggle"
			Toggle.Parent = Children
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.Size = UDim2.new(0, 310, 0, 19)

			Check.Name = "Check"
			Check.Parent = Toggle
			Check.BackgroundColor3 = maincolor
			Check.BackgroundTransparency = 0.500
			Check.Size = UDim2.new(0, 19, 0, 19)
			Check.ZIndex = 2
			Check.Image = "rbxassetid://7436812392"
			Check.Position = Check.Position
			Check.BorderSizePixel = 0

			Frame.Name = "Frame"
			Frame.Parent = Toggle
			Frame.BackgroundColor3 = maincolor
			Frame.Transparency = 0.500
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, 312, 0, 19)
			Frame.Font = Enum.Font.Code
			Frame.Text = " "
			Frame.TextColor3 = Color3.fromRGB(0, 0, 0)
			Frame.TextSize = 14.000
			Frame.TextTransparency = 1.000
			game:GetService("RunService")["RenderStepped"]:Connect(function()
				if img.Rainbow then
					Frame.BackgroundColor3 = rainbowcolor
				else
					Frame.BackgroundColor3 = maincolor
				end
			end)

			Title.Name = "Title"
			Title.Parent = Toggle
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0.0838709697, 0, 0, 0)
			Title.Size = UDim2.new(0, 286, 0, 20)
			Title.Font = Enum.Font.Code
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 14.000
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.Position = Title.Position + UDim2.new(0, 0, 0, -1.5)
			Title.Text = title

			Button.Name = "Button"
			Button.Parent = Toggle
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Button.Size = UDim2.new(0, 312, 0, 20)
			Button.ZIndex = 3
			Button.Font = Enum.Font.Code
			Button.Text = " "
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 1.000
			Button.TextTransparency = 1.000

			yep.OnToggle = {}

			function yep.OnToggle:Connect(f)
				LabelToButton(Button, function()
					state = not state
					yep.Toggled = state
					if state == true then
						Check.Image = "rbxassetid://6972569034"
					elseif state == false then
						Check.Image = "rbxassetid://7436812392"
					end
					f(state)
				end)
			end

			function yep.Toggle(bool)
				assert(type(bool) == "boolean", "Failed to toggle! (Expected #1 argument to be a boolean, got "..typeof(bool)..")")
				state = bool
				yep.Toggled = state
			end

			return yep
		end

		API.Dropdown = function(name, children)
			local dAPI = {}
			local arrowPointingLeftImage = "8877547836"
			local arrowPointingRightImage = "8877568773"
			local Toggle = Instance.new("Frame")
			local LeftArrow = Instance.new("ImageLabel")
			local RightArrow = Instance.new("ImageLabel")
			local Frame = Instance.new("TextLabel")
			local Title = Instance.new("TextLabel")
			local Button = Instance.new("TextLabel")

			Toggle.Name = "Toggle"
			Toggle.Parent = Children
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.Size = UDim2.new(0, 310, 0, 19)

			LeftArrow.Name = "Check"
			LeftArrow.Parent = Toggle
			LeftArrow.BackgroundColor3 = maincolor
			LeftArrow.BackgroundTransparency = 0.500
			LeftArrow.Size = UDim2.new(0, 19, 0, 19)
			LeftArrow.ZIndex = 2
			LeftArrow.Image = "rbxassetid://"..arrowPointingLeftImage
			LeftArrow.Position = UDim2.new(0,0,0,0)
			LeftArrow.BorderSizePixel = 0

			RightArrow.Name = "Check"
			RightArrow.Parent = Toggle
			RightArrow.BackgroundColor3 = maincolor
			RightArrow.BackgroundTransparency = 0.500
			RightArrow.Size = UDim2.new(0, 19, 0, 19)
			RightArrow.ZIndex = 2
			RightArrow.Image = "rbxassetid://"..arrowPointingRightImage
			RightArrow.Position = UDim2.new(0,291,0,0)
			RightArrow.BorderSizePixel = 0

			Frame.Name = "Frame"
			Frame.Parent = Toggle
			Frame.BackgroundColor3 = maincolor
			Frame.Transparency = 0.500
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, 312, 0, 19)
			Frame.Font = Enum.Font.Code
			Frame.Text = " "
			Frame.TextColor3 = Color3.fromRGB(0, 0, 0)
			Frame.TextSize = 14.000
			Frame.TextTransparency = 1.000
			game:GetService("RunService")["RenderStepped"]:Connect(function()
				if img.Rainbow then
					Frame.BackgroundColor3 = rainbowcolor
					RightArrow.BackgroundColor3 = rainbowcolor
					LeftArrow.BackgroundColor3 = rainbowcolor
				else
					Frame.BackgroundColor3 = maincolor
					RightArrow.BackgroundColor3 = maincolor
					LeftArrow.BackgroundColor3 = maincolor
				end
			end)
			
			local f = function() end;
			
			dAPI["Selected"] = {}
			function dAPI.Selected:Connect(func)
				f = func;
			end
			
			local picked = children[1]
			local a = 1
			
			dAPI["Value"] = picked

			Title.Name = "Title"
			Title.Parent = Toggle
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0.0838709697, 0, 0, 0)
			Title.Size = UDim2.new(0, 286, 0, 20)
			Title.Font = Enum.Font.Code
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 14.000
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.Position = Title.Position + UDim2.new(0, 0, 0, -1.5)
			Title.Text = " "..name.." - ["..picked.."]"
			Title.TextTransparency = 0.000

			Button.Name = "Button"
			Button.Parent = Toggle
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Button.Size = UDim2.new(0, 312, 0, 20)
			Button.ZIndex = 3
			Button.Font = Enum.Font.Code
			Button.Text = " "
			
			Title.Text = "      "..name.." - ["..picked.."] "
			
			spawn(function()
				pcall(function()
					f(picked)
				end)
			end)
			
			Title.TextSize = 16.000
			
			LabelToButton(LeftArrow, function()
				a = a - 1
				if children[a] == nil then
					a = a + 1
				end
				picked = children[a]
				Title.Text = "      "..name.." - ["..picked.."] "
				dAPI["Value"] = picked
				f(picked)
			end)
			
			LabelToButton(RightArrow, function()
				a = a + 1
				if children[a] == nil then
					a = a - 1
				end
				picked = children[a]
				Title.Text = "        "..name.." - ["..picked.."] "
				dAPI["Value"] = picked
				f(picked)
			end)
			
			return dAPI
		end

		API.Textbox = function(h)
			local box_api = {Text = ""}
			local TextBox = Instance.new("TextBox")
			TextBox.Parent = Children
			TextBox.BackgroundColor3 = maincolor
			game:GetService("RunService")["RenderStepped"]:Connect(function()
				if img.Rainbow then
					TextBox.BackgroundColor3 = rainbowcolor
				else
					TextBox.BackgroundColor3 = maincolor
				end
			end)
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.Font = Enum.Font.Code
			TextBox.Position = UDim2.new(0, 0, 0.0654205605, 0)
			TextBox.Size = UDim2.new(0, 312, 0, 16)
			TextBox.Text = ""
			TextBox.TextSize = 14.000
			TextBox.PlaceholderText = "Input text here | "..tostring(h) or "Input text here | {...}"
			TextBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
			TextBox.TextXAlignment = Enum.TextXAlignment.Left

			TextBox.Text = tostring(h) or ""

			box_api.TextChanged = {}

			function box_api.TextChanged:Connect(f)
				TextBox.FocusLost:Connect(function(ep, ipfoclost_caused)
					spawn(function()
						f(TextBox.Text)
					end)
					task.wait(.12)
					TextBox.Text = ""
					box_api.Text = ""
				end)
			end

			box_api.setText = function(text)
				TextBox.Text = text
				box_api.Text = text
			end

			TextBox:GetPropertyChangedSignal("Text"):Connect(function()
				task.wait(.12)
				box_api.Text = TextBox.Text
			end)

			return box_api
		end

		return API
	end

	if addoptions then
		local opt = img.Section("Options")
		local white = opt.Checkbox("White Theme")
		white.OnToggle:Connect(function(b)
			lighttheme = b
			if lighttheme then

			end
		end)
		white.Toggle(lighttheme)
	end

	return img
end

getgenv().ImGui = Library
return Library
