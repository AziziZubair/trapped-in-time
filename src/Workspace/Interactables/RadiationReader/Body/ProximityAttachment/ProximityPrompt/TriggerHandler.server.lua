

----------------------------
----------Instances---------
----------------------------

ProximityPrompt = script.Parent
ReplicatedStorage = game:GetService("ReplicatedStorage")
ServerStorage = game:GetService("ServerStorage")
reader = ServerStorage:FindFirstChild("Handheld Device")

----------------------------
------------Code------------
----------------------------

ProximityPrompt.Triggered:Connect(function(plr)
	local LocalPlayer = plr
	local playerBackup = LocalPlayer:FindFirstChild("Backpack")
	
	if reader.Parent == ServerStorage then
		reader.Parent = plr.Backpack
	end
end)
