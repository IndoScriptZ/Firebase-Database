local Secret = "YOUR_FIREBASE_SECRET_HERE"
local URL = "YOUR_FIREBASE_URL_HERE"
local Folder = "Parent/Name" --You can change the parent or the location of the data
 
local database = URL..Folder..".json?auth="..Secret
local request = request or syn.request
local Table = {}
 
if game.HttpService:JSONDecode(game:HttpGetAsync(database)) ~= nil then
   for key, value in pairs(game.HttpService:JSONDecode(game:HttpGetAsync(database))) do
     if key then
        Table[key] = value
     end
   end
end
 
Table["Key"] = "Value" --Use this to write data and send to your firebase database
 
local send = request({
   Url = database,
   Method = "PUT",
   Headers = {["Content-Type"] = "application/json"},
   Body = game.HttpService:JSONEncode(Table)
})
