-----------------------------------------------------------------------------------------
-- GameMinion Class
-----------------------------------------------------------------------------------------
GameMinion = Core.class(EventDispatcher)

-----------------------------------------------------------------------------------------
function GameMinion:init(accessKey, secretKey)
   
   -- Create authentication header
   self.headers = { Authorization = "Basic " .. b64enc(accessKey..":"..secretKey) }

   -- Other things we need to remember ...
   self.authToken = nil
   
   -- Initialize class
   self.rest = Rest.new(self, "gameminion.json")

end

-----------------------------------------------------------------------------------------
function GameMinion:callMethod(name, t, ...)

   -- Add authentication key if required
   local extraArgList = {}
   if t.authentication then
      assert(self.authToken)
      extraArgList.auth_token = self.authToken
   end
   
   -- Handle login function 
   local preCallback = nil
   if name == "login" then
      preCallback = function(response)
         if not response.error then
            self.authToken = response.data.auth_token
         end
      end
   end

   -- Make the rest call
   self.rest:call(name, t, self.headers, extraArgList, callback, preCallback, ...)
   
end
