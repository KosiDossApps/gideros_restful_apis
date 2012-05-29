------------------------------------------------------------------------------------------
-- App key & secret are given to you when you get a Kinvey account and create an app
------------------------------------------------------------------------------------------
appKey       = "kid1497"
appSecret    = "fa953923753745f4a6a02b14dc476eff"

------------------------------------------------------------------------------------------
-- Initialize Kinvey object
------------------------------------------------------------------------------------------
kinvey = Kinvey.new(appKey, appSecret)

-- Ping
kinvey:ping()

------------------------------------------------------------------------------------------
-- Create a user if necessary
------------------------------------------------------------------------------------------
--[[ call w/ app level permissions (i.e., don't login)
kinvey:createUser({
   username="username",
   password="password",
   email="email",
   field1="any fields",
   field2="you want to add",
})
-- OR 
kinvey:createUser({})  -- automatically gives you a username/password
--]]

------------------------------------------------------------------------------------------
-- Login
------------------------------------------------------------------------------------------
kinvey:login("username", "password")

------------------------------------------------------------------------------------------
-- User API examples
------------------------------------------------------------------------------------------

-- Retrieve a user
kinvey:getUser("4fc4750ec9f1ba140b000226")

-- Update a user
kinvey:updateUser("4fc4750ec9f1ba140b000226", {
   extraData = "this is extra info",
   moreInfo  = "even more, the original info goes away",
   field1    = "no",
})

-- Search users
kinvey:queryUsers('{}', { sort='{"username":-1}' }) -- gets all users, sorted by reverse username
kinvey:queryUsers('{"field1": "no"}')               -- gets all users with field1 = no

-- How many users are there
kinvey:sizeUsers()

------------------------------------------------------------------------------------------
-- Collection API examples
------------------------------------------------------------------------------------------
local requests = 3
function handler(r) 
   requests = requests - 1 
   print("REQUESTS: "..requests)
   if requests == 0 then
      kinvey:get("example", "otherdata")
      kinvey:query("example", '{"word1": "hello"}')
   end
end

kinvey:create("example", "mydata",     { name="myname", a=4, b=5, list={ 34, 35, 36 } }, handler)
kinvey:create("example", "otherdata",  { word1="hello", word2="world", name="othername" }, handler)
kinvey:create("example", "otherdata2", { word1="hello", word2="world", name="othername2" }, handler)