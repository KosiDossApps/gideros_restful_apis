-- Login info
username = ""
password = ""
url      = "http://bugs.giderosmobile.com"

-- Initialize Redmine object
redmine = Redmine.new(url, username, password)

-- Get the list of issues
redmine:list_issues({ limit=10, status_id="open" }, function(r)
   if r.error then
      print("ERROR GETTING ISSUES")
   else
      print("----------------- ISSUES")
      print("  First 10 open issues of total issues: "..r.data.total_count)
      for i,issue in ipairs(r.data.issues) do
         print("  ----------------")
         print("  Author: "..issue.author.name.."  Priority: "..issue.priority.name)
         print("  Percent completed: "..issue.done_ratio)
         print("  Subject: "..issue.subject)
      end
   end
end)

-- Get projects
redmine:list_projects()
