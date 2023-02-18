if not isfolder("zestyhub") then
	-- If not found zestyhub, fix!
	rconsolename("ZESTY HUB")
	rconsoleprint("Zesty hub was not installed properly, reinstalling...\n")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Zestycodes/Zestyhub/main/zestyhub-fix%20(RUN%20BEFORE%20USING).lua"))()
	task.wait(2);
	rconsoleprint("Complete! Running zestyhub in 1 second.")
	wait(1)
	rconsoleclose()
end
local zestyhub = {
	getfile = function(path)
		if isfile("zestyhub/"..path) then
			return readfile("zestyhub/"..path)
		else
			return "return nil"
		end
	end,
	getconfig = function(conf)
		return (function(path)
			if isfile("zestyhub/"..path) then
				return readfile("zestyhub/"..path)
			else
				return "return {}"
			end
		end)("Configuration/"..conf..".json")
	end
}
loadstring(zestyhub["getfile"]("bypasses.lua"))("Zestycodes on top")
local library = loadstring(readfile("zestyhub/Library.lua"))()
window = library("ZestyHub | v1.0a", Vector2.new(100, 150))
if window and window.Rainbow ~= nil then
	window.Rainbow = true;
end
zestyhub.ghost = window.Section("Ghost")
zestyhub.combat = window.Section("Combat")
zestyhub.blatant = window.Section("Blatant")
zestyhub.utility = window.Section("Utility")
zestyhub.render = window.Section("Render")
shared["zesty"] = zestyhub
local games = {
	["PleaseDonate"] = {8737602449}
}

local old = game.PlaceId;
for gamename, game in pairs(games) do
	for index, gameid in pairs(game) do
		if tostring(gameid):match(old) then
			return loadstring(zestyhub["getfile"]("Games/"..gamename..".lua"))(), warn("An supported game has been detected, loading zestyhub for "..gamename..".")
		end
	end
end
loadstring(zestyhub["getfile"]("Games/Universal.lua"))()
warn("[ZestyHub]: Game is not supported, picked Universal!")
