-- // Folder system;
local isfolder = isfolder or is_folder or folderexists or folder_exists or getgenv().isfolder
local makefolder = makefolder or make_folder or getgenv().makefolder
local isfile = is_file or isfile or fileexists or file_exists or getgenv().isfile
local writefile = writefile or write_file or getgenv().writefile

-- // Requesting system;
function GET(a)
   return (request or http_request or http and http.request or fluxus and fluxus.request or fluxus_request or syn and syn.request)({Url=a;Method="GET"})["Body"]
end

-- // URL fixes;
local URL = "https://raw.githubusercontent.com/Zestycodes/Zestyhub/main/"
local URL1 = "https://raw.githubusercontent.com/Zestycodes/Zestyhub/main/"

-- // Requesting system v.2;
local function GET1(a)
   return GET(URL..a)
end

-- // Main folder;
if not isfolder("zestyhub") then
   makefolder("zestyhub")
end

--// Function hooks;
do
    local old = isfile;
    isfile = function(a) do
        return old("zestyhub/"..a)
     end 
  end
end

do
    local old = writefile;
    writefile = function(a) do
        if not isfile("zestyhub/"..a) then
           return old("zestyhub/"..a)
        end
     end 
  end
end

do
    local old = isfile;
    isfile = function(a) do
        return old("zestyhub/"..a)
     end 
  end
end

do
   local old = makefolder;
   makefolder = function(a)
      return old("zestyhub/"..a)
   end
end

-- // Starting the fix up;
writefile("loadstring.lua", GET1("loadstring.lua"));
writefile("bypasses.lua", GET1("bypasses.lua"));
writefile("Loader.lua", GET1("Loader.lua"));
writefile("Library.lua", GET1("Library.lua"));
makefolder("Games");
writefile("Games/PleaseDonate.lua", GET1("Games/PleaseDonate.lua"));

-- // Starting up zesty hub;
loadstring(GET1("loadstring.lua"))()
