if(_G.toggle == nil or _G.toggle == true) then _G.toggle = false wait(0.1) end
_G.toggle = true
if(_G.gui == true or _G.gui == nil) then
  local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mystikfluu/uilib/master/uilib.lua"))()
  local w = library:CreateWindow("Sword Effect Simulator")
  local main = w:CreateFolder("Main")
  main:Toggle("godmode", function(value)
    _G.godmode = value
  end)
  main:Toggle("Grind Power", function(value)
    _G.grind = value
  end)
  main:Box("Power Thingy", "int", function(value)
    _G.count = value or 8
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
_G.toggle = false
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
  if(_G.godmode) then
  game.ReplicatedStorage.Heal:FireServer()
  end
end)


spawn(function()
while wait() and _G.toggle do
spawn(function()
_G.count = _G.count or 8

if(_G.grind) then
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
    until a >= _G.count
  end
end
end
end
end)
end
end)
