-- Access and secret keys are given to you when you get a GameMinion account
accessKey = "a3a5b448dee3e205aad54690c108082fb56913ac"
secretKey = "97cd0773bdf29e554d125b5a0c9e85a278e9589a"

-- Initialize GameMinion object
gm = GameMinion.new(accessKey, secretKey)

--[[ Used to create the test user
gm:registerUser("TestUser", "Gideros", "gideros", "gideros@mtlaurel.us", "password", nil, {
   success = function(r)
      print("SUCCESSFULLY CREATED A NEW USER")
   end,
   error = function(r)
      print("ERROR: We failed creating a new user")
   end,
})
--]]

-- Login 
gm:login("gideros@mtlaurel.us", "password", {
   success = function(r)
      print("SUCCESS: Logged in!")

      -- Get my profile
      gm:getMyProfile()

      -- Get another users profile
      gm:getUserProfile("4fbc84410b6c20000100000e")

      -- Get leaderboards, submit a high score, then print the high scores
      gm:getLeaderboards(function(r)
         for i,t in ipairs(r.data) do
            gm:submitHighScore(t._id, 7500, function(r)
                gm:getHighScores(t._id, function(r)
                   print("--------------- LEADERBOARD: " .. t.name.."("..t._id..")")
                   for j,s in ipairs(r.data) do
                      print("  userid("..s.user_id..") = "..s.value)
                   end
                end)
            end)
         end
      end)

      -- Get the news
      gm:getNews(function(r)
         print("--------------- The news!")
         for i,v in ipairs(r.data) do
            print("TITLE: "..v.title)
            print("   "..v.text)
         end
      end)

      -- Add a friend, verify he was added, then delete him
      gm:addFriend("4fbc84410b6c20000100000e", function(r)
         print("--------------- addFriend")
         if r.error then 
            print("ERROR") 
         else 
            print(inspect(r.data)) 
            gm:getFriends(function(r)
               print("--------------- getFriends")
               if r.error then 
                  print("ERROR") 
               else 
                  -- It was a short friendship
                  print(inspect(r.data)) 
                  gm:removeFriend("4fbc84410b6c20000100000e")
               end
            end)
         end
      end)

      -- Get achievements
      gm:getAchievements(function(r)
         print("--------------- ACHIEVEMENTS")
         for i,a in ipairs(r.data) do
            print(" * "..a.name.." ("..a.description.."), "..a.points.." points")
         end
      end)

      -- Get the list of chat rooms
      gm:getChatRooms(function(r)
         for i,room in ipairs(r.data) do
            gm:sendChatMessage(room._id, "hello "..room.name)
            gm:getChatHistory(room._id, function(s)
               print("--------------- CHAT ROOM: "..room.name)
               print("  Current chatters:")
               for j,chatter in ipairs(room.chatters) do
                  print("     user="..chatter.username)
               end                       
               print("  Chat history:")
               for k,message in ipairs(s.data) do
                  print("     sender("..message.sender_id..") said: "..message.content)
               end
            end)
         end
      end)

      -- Record the fact that we ran a test
      gm:submitEvent("counter", "test", "test code run")

   end,
})