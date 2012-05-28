-----------------------------------------------------------------------------------------
-- Redmine Class
-----------------------------------------------------------------------------------------
Redmine = Core.class(EventDispatcher)

-----------------------------------------------------------------------------------------
function Redmine:init(url, username, password)
   
   -- Create authentication header
   self.headers = { Authorization = "Basic " .. b64enc(username..":"..password) }

   -- Other things we need to remember ...
   self.authToken = nil
   
   -- Initialize class
   self.rest = Rest.new(self, "redmine.json")

   -- Add url
   self.rest.api.base_url = url
end

-----------------------------------------------------------------------------------------
function Redmine:callMethod(name, t, ...)

   -- Make the rest call
   self.rest:call(name, t, self.headers, extraArgList, callback, preCallback, ...)
   
end
