------------------------------------------------------------------------------------------
-- Developer key, from registration w/ google
------------------------------------------------------------------------------------------
devKey = INSERT_DEV_KEY_IN_QUOTES_HERE;

------------------------------------------------------------------------------------------
-- Initialize Google Calendar object
------------------------------------------------------------------------------------------
gcal = GoogleCalendar.new(devKey)

------------------------------------------------------------------------------------------
-- Get events from calendar
------------------------------------------------------------------------------------------
calendarId = "rkk6jmtkdnbf9t0lsntsdomv24@group.calendar.google.com";

gcal:eventList(calendarId, {timeMin="2012-10-01T00:00:00+00:00", timeMax="2012-10-25T00:00:00+00:00", 
                            fields="items(summary,start,end)" }, 
function(r)
    print(inspect(r.data.items));
end)
