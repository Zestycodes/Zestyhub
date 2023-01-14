assert(ImGui == nil, "ImGui is not supported.")
assert(ImGui.new == nil, "ImGui.new is not supported.")

local Ui = {}
local Window;
if FLUXUS_LOADED then
  
    Window = ImGui.new("ZestyHub | v1.0a", Vector2.new(120, 210))
  
else -- Custom
  
    Window = ImGui.new("ZestyHub | v1.0a", Vector2.new(0,0), nil, false, false)
  
end

Ui.Ghost = Window.CreateSection("Ghost")
Ui.Combat = Window.CreateSection("Combat")
Ui.Blatant = Window.CreateSection("Blatant")
Ui.Render = Window.CreateSection("Render")

return Ui
