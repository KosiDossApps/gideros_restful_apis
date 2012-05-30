-----------------------------------------------------------------------------------------
-- Firebase Class
-----------------------------------------------------------------------------------------
Firebase = Core.class(EventDispatcher)

-----------------------------------------------------------------------------------------
function Firebase:init(base_url)

   -- Create header for app-level access
   self.headers = { 
      ["Content-Type"]  = "application/json",
   }

   -- Extra arg list
   self.extraArgList = {}

   -- Initialize class
   self.rest = Rest.new(self, "firebase.txt")

   -- Add url
   self.rest.api.base_url = base_url

end

-----------------------------------------------------------------------------------------
function Firebase:callMethod(name, t, ...)
   -- Make the rest call
   self.rest:call(name, t, self.headers, self.extraArgList, nil, ...)
end
