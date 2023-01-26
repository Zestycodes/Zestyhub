local zesty = shared["zesty"];
local lplr = game.Players.LocalPlayer
local repstorage = game.ReplicatedStorage
local repstrname = "ReplicatedStorage"
local rainbowcolor;
local rainbowhexa;

local plsdonate, getfuncs;

local function code(f)
	f()
end

local function getremote(...)
	return require(repstorage:WaitForChild("Remotes",9e9))["Event"](...)
end

code(function()
	getfuncs = (function()
		local GayLibrary = game.ReplicatedStorage.Packages.HashLib
		plsdonate = {
			["changeBoothText"] = getremote("SetBoothText");
		}
	end)
end)

code(function()
	(function()
		spawn(function()
			return (function()
				return {(function()
					return task.spawn(function()
						while game:GetService("RunService").Heartbeat:wait() do
							for i = 0, 1, 0.001*5 do
								rainbowcolor = Color3.fromHSV(i,1,1)
								rainbowhexa = rainbowcolor:ToHex()
								wait()
							end
						end
					end)
				end)()}
			end)()
		end)
	end)()
end)

getfuncs();

local zestyconfig = {
	["RainbowText"] = {
		Enabled = false;
		Text = "..."
	}
}

zesty["ghost"]["Label"]("Rainbows")

zesty["ghost"]["Textbox"]("Rainbow Text Input",Vector2.new(100,50)).TextChanged:Connect(function(cb)
	zestyconfig["RainbowText"]["Text"] = cb
end)

zesty["ghost"]["Checkbox"]("Rainbow Text Stand",Vector2.new(100,50)).OnToggle:Connect(function(cb)
	zestyconfig["RainbowText"].Enabled = cb;
	if cb then
		while zestyconfig["RainbowText"].Enabled == true do
			plsdonate["changeBoothText"]:FireServer('<font color="#'..rainbowhexa..'">'..zestyconfig["RainbowText"]["Text"]..'</font>',"booth")
			task.wait()
		end
	end
end)