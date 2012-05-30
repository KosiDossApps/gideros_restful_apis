------------------------------------------------------------------------------------------
-- Current beta version of Firebase doesn't have authentication
-- Anything you write can be read/written/erased by anyone
------------------------------------------------------------------------------------------

-- Create a firebase object
firebase = Firebase.new("http://gamma.firebase.com/ndoss")


-- Write a lua table and then get a subtable
firebase:write("new/data", { gideros = "Gideros Mobile", thisIs = { anExample = { ofANested = "table" } } }, function(r)
   if r.error then
      print("ERROR")
      print(r.url)
   else
      firebase:get("new/data")
      firebase:get("new/data/thisIs/anExample")
   end
end)


-- Write another lua table, then delete part of it
firebase:write("anotherExample", { 1,2,3,4,5,6,6,8, anotherTable={444,444,44,44,44} }, function(r)
   if r.error then
      print("ERROR")
      print(r.url)
   else
      firebase:remove("anotherExample/anotherTable")
   end
end)


-- Append elements to a collection
firebase:append("gideros/chatroom", { name="ND", msg="amessage" }, function(r)
   if r.error then
      print("ERROR")
      print(r.url)
   else
      firebase:get("gideros/chatroom", function(r)
         if not r.error then
            print("---> CHAT MESSAGES <---")
            for i,v in pairs(r.data) do
               print(v.name .. " said: " .. v.msg)
            end
         end
      end)
   end
end)

