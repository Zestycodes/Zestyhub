local request =
    request or
    syn and syn.request or
    fluxus and fluxus.request or
    http_request or
    http and http.request or
    function(body)
         if body.Method == "GET" then
             return {Body = game:HttpGet(body.Url)}
         end
     end or
     nil;

function getFile(file)
   return request({Url = "https://github.com/fa899/Zestyhub/"..file, Method = "GET"}).Body
end
