
----------------------------
----------Services----------
----------------------------

TeleportService = game:GetService("TeleportService")
PlayerService = game:GetService("Players")
ReplicatedStorage = game:GetService("ReplicatedStorage")
StarterGui = game:GetService("StarterGui")

----------------------------
----------Instances---------
----------------------------

RemoteEvent = ReplicatedStorage:FindFirstChild("LoadCharacter")

----------------------------
------------Code------------
----------------------------

RemoteEvent.OnServerEvent:Connect(function(plr)
	plr:LoadCharacter()
	RemoteEvent:FireClient(plr)
end)













