
local bulb = script.Parent:FindFirstChild("Lights")
local sourceOne = script.Parent:FindFirstChild("downLightPart"):FindFirstChild("SurfaceLight")
local sourceTwo = script.Parent:FindFirstChild("upLightPart"):FindFirstChild("SurfaceLight")


while true do
	bulb.Material = Enum.Material.SmoothPlastic
	sourceOne.Enabled = false
	sourceTwo.Enabled = false
	task.wait(0.2)
	bulb.Material = Enum.Material.Neon
	sourceOne.Enabled = true
	sourceTwo.Enabled = true
	task.wait(0.2)
	bulb.Material = Enum.Material.SmoothPlastic
	sourceOne.Enabled = false
	sourceTwo.Enabled = false
	task.wait(0.7)
	bulb.Material = Enum.Material.Neon
	sourceOne.Enabled = true
	sourceTwo.Enabled = true
	task.wait(15)
end


