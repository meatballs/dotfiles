-- vim.lsp.config("lua_ls", {
--   on_init = function(client)
--     if client.workspace_folders then
--       local path = client.workspace_folders[1].name
--       if
--         path ~= vim.fn.stdpath("config")
--         and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
--       then
--         return
--       end
--     end
--
--     client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
--       runtime = {
--         version = "LuaJIT",
--         path = {
--           "lua/?.lua",
--           "lua/?/init.lua",
--         },
--       },
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         checkThirdParty = false,
--         library = {
--           vim.env.VIMRUNTIME,
--           "${3rd}/luv/library",
--         },
--       },
--       telemetry = {
--         enable = false,
--       },
--       format = {
--         defaultConfig = { indent_style = "space", indent_size = 4 },
--       },
--     })
--   end,
--   settings = {
--     Lua = {},
--   },
-- })
return {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      format = {
        defaultConfig = { indent_style = "space", indent_size = 4 },
      },
    },
  },
}
