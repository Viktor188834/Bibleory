local FunctionsFromBiblary = {}

local function FunctionsFromBiblary:CreateBox(ChoosedChildren, c)
	local Box = Instance.new("BoxHandleAdornment")
	Box.Parent = ChoosedChildren
	Box.Adornee = ChoosedChildren
	Box.Transparency = 0.7
	Box.Color3 = c
	Box.ZIndex = 5
	Box.Visible = true
	Box.AlwaysOnTop = true
	Box.Name = ChoosedChildren.Name
	Box.Size = ChoosedChildren.Size
	ChoosedChildren.Color = Color3.fromRGB(255, 255, 255)
	return Box
end

local function FunctionsFromBiblary:SetWH(parent)
	parent:WaitForChild("Humanoid")
	wait(1.5)
	local Humanoid = parent:FindFirstChildOfClass("Humanoid")
	local parentPlr = nil
	if Ser.Plrs:GetPlayerFromCharacter(parent) then
		parentPlr = game.Players:GetPlayerFromCharacter(parent)
	end
	local v1 = Instance.new("BillboardGui")
	local v2 = Instance.new("Frame")
	local v3 = Instance.new("UICorner")
	local v5 = Instance.new("Frame")
	local v6 = Instance.new("UICorner")
	local v11 = Instance.new("UICorner")
	local v7 = Instance.new("TextLabel")
	local v8 = Instance.new("TextLabel")
	local v9 = Instance.new("ImageLabel")
	local v10 = Instance.new("TextLabel")
	local v4 = Instance.new("Frame")
	v11.CornerRadius = UDim.new(1, 0)
	v11.Parent = v4
	v4.Parent = v1
	v4.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	v4.BackgroundTransparency = 0
	v4.Size = UDim2.new(0.07, 0, 0.95, 0)
	v4.Position = UDim2.new(0.0175, 0, 0.025, 0)
	v4.ZIndex = 0
	v1.Size = UDim2.new(10, 0, 9, 0)
	v1.Parent = parent
	v1.Name = "WallHack"
	v1.AlwaysOnTop = true
	v1.ResetOnSpawn = false
	v1.Adornee = parent:FindFirstChild("HumanoidRootPart")
	v2.Parent = v4
	v2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	v2.BackgroundTransparency = 0
	v2.Size = UDim2.new(0.9, 0, 0.98, 0)
	v2.Position = UDim2.new(0.05, 0, 0.01, 0)
	v3.CornerRadius = UDim.new(1, 0)
	v3.Parent = v2
	v5.Parent = v2
	v5.BackgroundColor3 = Color3.fromRGB(13, 191, 0)
	v5.BackgroundTransparency = 0
	v5.Size = UDim2.new(1, 0, Humanoid.Health/Humanoid.MaxHealth, 0)
	v6.CornerRadius = UDim.new(1, 0)
	v6.Parent = v5
	v7.Parent = v1
	v7.Text = "Name: "..parent.Name
	v7.Size = UDim2.new(0.6, 0, 0.2, 0)
	v7.Position = UDim2.new(0.2, 0, 0, 0)
	v7.BackgroundTransparency = 1
	v7.TextColor3 = Color3.fromRGB(255, 255, 255)
	v7.Font = Enum.Font.SourceSansBold
	v7.TextScaled = true
	v7.TextStrokeTransparency = 0
	v7.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	v8.Parent = v1
	v8.Text = Humanoid.Health.."/"..Humanoid.MaxHealth
	v8.Size = UDim2.new(0.6, 0, 0.2, 0)
	v8.Position = UDim2.new(0.2, 0, 0.8, 0)
	v8.BackgroundTransparency = 1
	v8.TextColor3 = Color3.fromRGB(13, 255, 0)
	v8.Font = Enum.Font.SourceSansBold
	v8.TextScaled = true
	v8.TextStrokeTransparency = 0
	v8.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	v9.Parent = v1
	v9.Size = UDim2.new(0.2, 0, 0.2, 0)
	v9.Position = UDim2.new(0.7, 0, 0.4, 0)
	v9.BackgroundTransparency = 0
	v9.BorderSizePixel = 0
	v10.Parent = v1
	v10.Size = UDim2.new(0.3, 0, 0.2, 0)
	v10.Position = UDim2.new(0.7, 0, 0.6, 0)
	v10.BackgroundTransparency = 1
	v10.TextColor3 = Color3.fromRGB(255, 255, 255)
	v10.Font = Enum.Font.SourceSansBold
	v10.TextScaled = true
	v10.TextStrokeTransparency = 0
	v10.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	if game.Teams:FindFirstChildOfClass("Team") and parentPlr then
		v9.BackgroundColor = parentPlr.TeamColor
	else
		v9.BackgroundColor3 = parent:FindFirstChildOfClass("BodyColors").TorsoColor3
	end
	Humanoid.HealthChanged:Connect(function()
		v5:TweenSize(UDim2.new(1, 0, Humanoid.Health/Humanoid.MaxHealth, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, false, function()
			v8.Text = Humanoid.Health.."/"..Humanoid.MaxHealth
		end)
	end)
	Humanoid.Died:Connect(function()
		v1:Destroy()
		for i=1, #parent:GetChildren() do
			local CP = parent:GetChildren()[i]
			if CP:IsA("MeshPart") then
				for o=1, #CP:GetChildren() do
					if CP:GetChildren()[o]:IsA("BoxHandleAdornment") then
						CP:GetChildren()[o]:Destroy()
					end
				end
			end
			if CP:IsA("Part") then
				for o=1, #CP:GetChildren() do
					if CP:GetChildren()[o]:IsA("BoxHandleAdornment") then
						CP:GetChildren()[o]:Destroy()
					end
				end
			end
		end
	end)
	for i=1, #parent:GetChildren() do
		local ChoosedChildren = parent:GetChildren()[i]
		if ChoosedChildren:IsA("Part") or ChoosedChildren:IsA("MeshPart") then
			local a = CreateBox(ChoosedChildren)
			if game.Teams:FindFirstChildOfClass("Team") and parentPlr then
				a.Color3 = parentPlr.TeamColor.Color
			end
			if ChoosedChildren.Name == "Head" and Humanoid.RigType.Name == "R6" then
				a.Size = Vector3.new(1.2, 1.2, 1.2)
			end
		end
	end
	if game.Players:GetPlayerFromCharacter(parent) then
		local content, IsPlayer = game.Players:GetUserThumbnailAsync(parentPlr.UserId, thumbnailType, thumbnailSize)
		v9.Image = content
	end
	if parent:FindFirstChildOfClass("Tool") then
		v10.Text = parent:FindFirstChildOfClass("Tool").Name
	else
		v10.Text = "ToolName"
	end
	parent.ChildAdded:Connect(function(child)
		if child:IsA("Tool") then
			wait(.05)
			v10.Text = child.Name
		end
	end)
	parent.ChildRemoved:Connect(function(child)
		if child:IsA("Tool") then
			wait(.03)
			v10.Text = "ToolName"
		end
	end)
	-- a function to get the raduis from me and the parent
	local function getRadius()
		local radius = 0
		local character = game.Players.LocalPlayer.Character
		local pos1 = character.HumanoidRootPart.Position
		local pos2 = parent.HumanoidRootPart.Position
		local distance = (pos1-pos2).Magnitude
		return distance
	end
	local function CheckAndChange()
		local raduis = getRadius()
		if raduis > 80 then
			v1.Size = UDim2.new(20, 0, 18, 0)
		elseif raduis > 170 then
			v1.Size = UDim2.new(30, 0, 27, 0)
		elseif raduis > 260 then
			v1.Size = UDim2.new(40, 0, 36, 0)
		elseif raduis > 360 then
			v1.Size = UDim2.new(50, 0, 45, 0)
		elseif raduis > 460 then
			v1.Size = UDim2.new(60, 0, 54, 0)
		elseif raduis > 560 then
			v1.Size = UDim2.new(70, 0, 63, 0)
		elseif raduis > 660 then
			v1.Size = UDim2.new(80, 0, 72, 0)
		elseif raduis > 760 then
			v1.Size = UDim2.new(90, 0, 81, 0)
		elseif raduis > 860 then
			v1.Size = UDim2.new(100, 0, 90, 0)
		elseif raduis > 960 then
			v1.Size = UDim2.new(110, 0, 99, 0)
		elseif raduis > 1060 then
			v1.Size = UDim2.new(120, 0, 108, 0)
		elseif raduis > 1160 then
			v1.Size = UDim2.new(130, 0, 117, 0)
		elseif raduis > 1260 then
			v1.Size = UDim2.new(140, 0, 126, 0)
		elseif raduis > 1360 then
			v1.Size = UDim2.new(150, 0, 135, 0)
		else
			v1.Size = UDim2.new(10, 0, 9, 0)
		end
	end
	Humanoid.Changed:Connect(CheckAndChange)
end
