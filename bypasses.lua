-- zestycodes was here...
local lplr = game.Players.LocalPlayer
local o1,o2;

local hookmetamethod = hookmetamethod or hook_metamethod or hook_meta_method
local blacklistedmethods_lplr = {
	"kick",
	"remove",
	"delete",
	"destroy",
	"saveinstance"
}

function disconnect_events(event) do
		for _,v in pairs(getconnections(event)) do
			spawn(function()
				pcall(function() v:Disconnect() end)
				pcall(function() v:Disable() end)
			end)
		end
	end
end

local blacklisted_services = {
	"ScriptContext",
	"ScriptService",
	"GameAnalyticsClient",
	"GameAnalyticsServer"
}

local blacklisted_remotes = {
	"free money",
	"givecash",
	"givemoney",
	"claimadmin",
	"getadmin"
}

o1 = hookmetamethod(game, "__namecall", newcclosure(function(self,...)
	local method = tostring(getnamecallmethod()):lower()
	if table.find(blacklistedmethods_lplr, method) and (self == lplr) then
		return wait(9e9)
	end
	if table.find(blacklisted_remotes,self.Name) then
		return wait(9e9)
	end
	if table.find(blacklisted_services,self.Name) or table.find(blacklisted_services,self.ClassName) then
		return wait(9e9)
	end
	return o1(self,...)
end))

o2 = hookmetamethod(game, "__index", newcclosure(function(self,prop,val)
	return o2(self,prop,16) -- bitch slap their anticheat :)
end))