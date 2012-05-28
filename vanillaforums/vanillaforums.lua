-----------------------------------------------------------------------------------------
-- Vanilla Class
-----------------------------------------------------------------------------------------
Vanilla = Core.class(EventDispatcher)

-----------------------------------------------------------------------------------------
function Vanilla:init(url)

   -- Headers
   self.headers = {
      ["Content-type"] = "application/json",
   }

   -- Initialize class
   self.rest = Rest.new(self, "vanillaforums.json")

   -- Add url
   self.rest.api.base_url = url
end

-----------------------------------------------------------------------------------------
function Vanilla:callMethod(name, t, ...)

   -- Make the rest call
   self.rest:call(name, t, self.headers, extraArgList, callback, preCallback, ...)
   
end
