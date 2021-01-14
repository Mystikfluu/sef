if(getfenv().toggle == nil or getfenv().toggle == true) then getfenv().toggle = false wait(0.1) end
getfenv().toggle = true
if(getfenv().gui == true or getfenv().gui == nil) then
  local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mystikfluu/uilib/master/uilib.lua"))()
  local w = library:CreateWindow("Sword Effect Simulator")
  local main = w:CreateFolder("Main")
  main:Toggle("godmode", function(value)
    getfenv().godmode = value
  end)
  main:Toggle("Grind Power", function(value)
    getfenv().grind = value
  end)
  main:Box("Power Thingy", "int", function(value)
    getfenv().count = value or 8
  end)

  main:Box("Effect name", "string", function(value)
    for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
    if(v:IsA("RemoteEvent")) then
      v:FireServer(value)
    end
  end
end)
main:Box("Speed", "Number", function(value)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value or 16
end)
main:Box("JumpPower", "Number", function(value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = value or 52
end)
main:Button("Kill ALL you can kill(not yet:tm:)", function()
print("never :tm:")
end)
main:Button("Kill GUI", function()
getfenv().toggle = false
spawn(function()
if(game.CoreGui:FindFirstChild("uiui") ~= nil) then game.CoreGui.uiui:Destroy() end
if(game.CoreGui:FindFirstChild("uilibrary") ~= nil) then game.CoreGui.uilibrary:Destroy() end
if(game.CoreGui:FindFirstChild("uiwindow") ~= nil) then game.CoreGui.uiwindow:Destroy() end
for i, v in pairs(game.CoreGui:GetChildren()) do
if(v:FindFirstChild("HiI'mSexyDon'tTouchMePls")) then v:Destroy() end
end
end)
end)

end
if(getfenv().godmodecon) then
  getfenv().godmodecon:Disconnect()
end
getfenv().godmodecon = game:GetService("RunService").RenderStepped:Connect(function()
  if(getfenv().godmode) then
  game.ReplicatedStorage.Heal:FireServer()
  end
end)
if(getfenv().charcon) then
  getfenv().charcon:Disconnect()
end
if(getfenv().humcon) then
  getfenv().humcon:Disconnect()
end
getfenv().humcon = game.Players.LocalPlayer.Character.Humanoid.Changed:Connect(function()
  if(getfenv().godmode) then
  game.ReplicatedStorage.Heal:FireServer()
  end
end)
getfenv().charcon = game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
getfenv().humcon = char.Humanoid.Changed:Connect(function()
  if(getfenv().godmode) then
  game.ReplicatedStorage.Heal:FireServer()
  end
end)
end)


spawn(function()
while wait() and getfenv().toggle do
spawn(function()
getfenv().count = getfenv().count or 8

if(getfenv().grind) then
local lp = game:GetService("Players").LocalPlayer
local chars = lp.Character
local tool = chars:FindFirstChild("sword") or lp.Backpack:FindFirstChild("sword")
if(tool and tool:FindFirstChild("Handle")) then
if(tool.Handle:FindFirstChild("up")) then
  if(tool.Handle.up:FindFirstChild("RemoteEvent")) then
    local RE = tool.Handle.up.RemoteEvent
    local a = 0
    repeat
      RE:FireServer()
      a = a + 1
    until a >= getfenv().count
  end
end
end
end
end)
end
end)
