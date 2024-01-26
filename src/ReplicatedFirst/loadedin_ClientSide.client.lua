
----------------------------
----------Services----------
----------------------------

TeleportService = game:GetService("TeleportService")
Players = game:GetService("Players")
Lighting = game:GetService("Lighting")
ReplicatedStorage = game:GetService("ReplicatedStorage")
TweenService = game:GetService("TweenService")
StarterGui = game:GetService("StarterGui")

----------------------------
----------Instances---------
----------------------------

LocalPlayer = Players.LocalPlayer
PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
loadedUI = ReplicatedStorage:WaitForChild("menuScreen"):Clone()
loadedUI.Parent = PlayerGui
UIHeader = loadedUI:WaitForChild("Frame"):WaitForChild("Header")
UIText = UIHeader:WaitForChild("TextLabel")
Blur = Lighting:WaitForChild("Blur")
CamPart = ReplicatedStorage:WaitForChild("CamPart")
RemoteEvent = ReplicatedStorage:WaitForChild("LoadCharacter")

----------------------------
------------Code------------
----------------------------

Blur.Enabled = true
camLoading = true

while camLoading do
	if workspace.CurrentCamera then
		cam = workspace.CurrentCamera
		cam.CameraType = Enum.CameraType.Scriptable
		cam.CFrame = CamPart.CFrame
		cam.Focus = CamPart.CFrame
		camLoading = false
	else
		task.wait()
	end
end

task.wait(3)

gameLoading = true
while gameLoading do
	if game:IsLoaded() then
		StarterGui:SetCore("ResetButtonCallback", false)
		local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
		local blurTween = TweenService:Create(Blur, tweenInfo, {Size = 56})
		local blurReverse = TweenService:Create(Blur, tweenInfo, {Size = 0})
		local headerTween = TweenService:Create(UIHeader, tweenInfo, {Transparency = 1})
		local textTween = TweenService:Create(UIText, tweenInfo, {Transparency = 1})

		blurTween:Play()
		blurTween.Completed:Wait()
		blurReverse:Play()
		textTween:Play()
		headerTween:Play()
		
		RemoteEvent:FireServer()
		gameLoading = false
	else
		task.wait()
	end
end








