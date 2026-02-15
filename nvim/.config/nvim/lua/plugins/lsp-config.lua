return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Modern vim.lsp.config syntax (fixes deprecation)
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })
    
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          runtime = { version = "LuaJIT" },
        },
      },
    })
    
    -- Enable servers
    vim.lsp.enable({ "pyright", "lua_ls", "tsserver" })
  end,
}

