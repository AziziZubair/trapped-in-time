
TweenService = game:GetService("TweenService")
endPos = workspace:FindFirstChild("endPart").Position

Handle = script.Parent
Device = script.Parent:FindFirstChild("Device")
Sound = script.Parent:FindFirstChild("Sound")
SFx = Sound:FindFirstChild("TremoloSoundEffect")

GL = Device:FindFirstChild("GreenBall")
YL = Device:FindFirstChild("YellowBall")
OL = Device:FindFirstChild("OrangeBall")
RL = Device:FindFirstChild("RedBall")

Antenna = Device:FindFirstChild("Antenna")
Orb = game.Workspace:FindFirstChild("Orb")

minDistance = 12
maxDistance = 100

factor = maxDistance/4
firstSegment = factor
secondSegment = factor*2
thirdSegment = factor*3
fourthSegment = factor*4

equipped = coroutine.create(function()
	Handle.Equipped:Connect(function()
		Sound.Playing = true
	end)
end)

unequipped = coroutine.create(function()
	Handle.Unequipped:Connect(function()
		Sound.Playing = false
	end)
end)

coroutine.resume(equipped)
coroutine.resume(unequipped)

tweenInfo = TweenInfo.new(30, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut)
orbTween = TweenService:Create(Orb, tweenInfo, {Position = endPos})
tweening = false


game:GetService("RunService").Heartbeat:Connect(function()
	local magnitude = (Antenna.Position - Orb.Position).Magnitude
	
	if magnitude <= fourthSegment then
		GL.Material = Enum.Material.Neon
		SFx.Frequency = 1
		if not tweening then
			tweening = true
			orbTween:Play()
		end
	else
		GL.Material = Enum.Material.SmoothPlastic
	end
	
	if magnitude <= thirdSegment then
		YL.Material = Enum.Material.Neon
		SFx.Frequency = 2
	else
		YL.Material = Enum.Material.SmoothPlastic
	end
	
	if magnitude <= secondSegment then
		OL.Material = Enum.Material.Neon
		SFx.Frequency = 3
	else
		OL.Material = Enum.Material.SmoothPlastic
	end
	
	if magnitude <= firstSegment then
		RL.Material = Enum.Material.Neon
		SFx.Frequency = 4.5
	else
		RL.Material = Enum.Material.SmoothPlastic
	end
	
end)