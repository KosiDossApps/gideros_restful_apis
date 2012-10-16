-----------------------------------------------------------------------------------------
-- GoogleCalendar Class
-----------------------------------------------------------------------------------------
GoogleCalendar = Core.class(EventDispatcher)

-----------------------------------------------------------------------------------------
function GoogleCalendar:init(devKey)
   
   -- Create header for app-level access
   self.headers = { 
      ["Content-Type"]  = "application/json",
   }

   -- Extra arg list
   self.extraArgList = {
      key = devKey
   }

   -- Initialize class
   self.rest = Rest.new(self, "google_calendar.txt")

end

-----------------------------------------------------------------------------------------
function GoogleCalendar:logout()
end

-----------------------------------------------------------------------------------------
function GoogleCalendar:callMethod(name, t, ...)
   local arg = {n=select('#', ...), ...}
   local preCallback = nil

   -- Make the rest call
   self.rest:call(name, t, self.headers, self.extraArgList, preCallback, ...)
end
