-----------------------------------------------------------------------------------------
-- Kinvey API
-----------------------------------------------------------------------------------------
return {
   base_url = "https://baas.kinvey.com",
   name = "Kinvey API",
   version = 0,
   methods = {

      -- TODO
      --  resource
      --  geo location
      --  query grouping

      -- Ping -- app or user level authentication 
      ping = {
         path = "appdata/:appkey/",
         method = "GET",
      },

      -- Users
      createUser = { -- can only be called if you're logged out
         path = "user/:appkey/",
         method = "POST",
         required_payload = true,
      },

      login = {
         path = "user/:appkey/_me",
         required_params = { "username", "password" },
         method = "GET",
      },

      getUser = {
         path = "user/:appkey/:id",
         required_params = { "id" },
         method = "GET",
      },

      retrieveUser = getUser,

      updateUser = {
         path = "user/:appkey/:id",
         required_params = { "id" },
         method = "PUT",
         required_payload = true,
      },

      queryUsers = {
         path = "user/:appkey/",
         required_params = { "query" },
         optional_params = { "fields", "limit", "skip", "sort" },
         method = "GET",
      },

      sizeUsers = {
         path = "user/:appkey/_count",
         method = "GET",
      },

      -- Collections
      createWithoutId = { 
         path = "appdata/:appkey/:collection",
         required_params = { "collection" },
         required_payload = true,
         method = "POST",
      },

      create = { 
         path = "appdata/:appkey/:collection/:id",
         required_params = { "collection", "id" },
         required_payload = true,
         method = "PUT",
      },

      get = {
         path = "appdata/:appkey/:collection/:id",
         required_params = { "collection", "id" },
         method = "GET",
      },

      retrieve = get,

      update = {
         path = "appdata/:appkey/:collection/:id",
         required_params = { "collection", "id" },
         method = "PUT",
         required_payload = true,
      },

      delete = {
         path = "appdata/:appkey/:collection/:id",
         required_params = { "collection", "id" },
         method = "DELETE",
      },

      query = {
         path = "appdata/:appkey/:collection/",
         required_params = { "collection", "query" },
         optional_params = { "fields", "limit", "skip", "sort" },
         method = "GET",
      },

      size = {
         path = "appdata/:appkey/_count",
         method = "GET",
      },
   },
};

