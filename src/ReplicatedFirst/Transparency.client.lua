

PlayerService = game:GetService("Players")
LocalPlayer = PlayerService.LocalPlayer

LocalPlayer.CharacterAdded:Connect(function(model)
	local baseParts = {}
		
	for i,v in ipairs (model:GetDescendants()) do
		if v:IsA("BasePart") then
			table.insert(baseParts, v)
		end
	end
		
	task.wait(2)
		
	for i,v in pairs (baseParts) do
		if v.Name ~= "HumanoidRootPart" then
			v.LocalTransparencyModifier = 0
			print("done")
		end
	end
end)


