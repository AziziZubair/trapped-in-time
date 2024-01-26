

----------------------------
----------Instances---------
----------------------------

ProximityPrompt = script.Parent
ReplicatedStorage = game:GetService("ReplicatedStorage")
NoteGui = ReplicatedStorage:FindFirstChild("note")

----------------------------
------------Code------------
----------------------------

ProximityPrompt.Triggered:Connect(function(plr)
	local LocalPlayer = plr
	local PlayerGui = plr:FindFirstChild("PlayerGui")
	local UiInteractables = PlayerGui:FindFirstChild("Interactables")
	
	if not UiInteractables:FindFirstChild("note") then
		NoteGui:Clone().Parent = UiInteractables
	else
		UiInteractables:FindFirstChild("note"):Destroy()
	end
	
end)
