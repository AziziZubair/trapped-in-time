
----------------------------
----------Services----------
----------------------------

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
RemoteEvent = ReplicatedStorage:WaitForChild("LoadCharacter")
Interactables = workspace:WaitForChild("Interactables")
UiInteractables = PlayerGui:WaitForChild("Interactables")

----------------------------
------------Code------------
----------------------------


RemoteEvent.OnClientEvent:Connect(function()
	print("client fired")
	
	LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	local plrMouse = LocalPlayer:GetMouse()
	plrMouse.Icon = "rbxassetid://11514712616"
	
	
	local prompts = {}
	for i,v in ipairs(Interactables:GetDescendants()) do
		if v:IsA("ProximityPrompt") then
			table.insert(prompts, v)
		end
	end
	
	
	for i,v in ipairs(prompts) do
		
		local promptShown = coroutine.create(function()
			v.PromptShown:Connect(function()
				
				local BillboardGui = v.Parent:FindFirstChild("BillboardGui")
				BillboardGui.Enabled = true
				
			end)
		end)
		
		local promptHidden = coroutine.create(function()
			v.PromptHidden:Connect(function()
				
				local BillboardGui = v.Parent:FindFirstChild("BillboardGui")
				BillboardGui.Enabled = false
				
				for j,k in ipairs(UiInteractables:GetChildren()) do
					if k:IsA("ScreenGui") then
						k:Destroy()
					end
				end
				
			end)
		end)
		
		coroutine.resume(promptShown)
		coroutine.resume(promptHidden)

	end
	
	
end)