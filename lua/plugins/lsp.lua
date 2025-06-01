-- ~/.config/nvim/lua/plugins/lspconfig.lua
-- This file defines how nvim-lspconfig is set up by LazyVim.

return {
  "neovim/nvim-lspconfig",
  -- Ensure dependencies are listed if not already handled by LazyVim's base setup
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    -- This 'servers' table is where mason-lspconfig typically manages installations.
    -- Ensure 'clangd' is *NOT* in this list, as we're managing it manually.
    servers = {
      -- "clangd", -- <--- IMPORTANT: Make sure this line is commented out or removed if it exists
      -- Example:
      -- lua_ls = {},
      -- pyright = {},
      -- jsonls = {},
      -- yamlls = {},
      -- ... other servers you want Mason to manage automatically
    },

    -- This 'setup' table allows you to provide custom setup functions for LSP servers.
    -- We will add our manual clangd configuration here.
    setup = {
      -- Custom setup function for clangd
      clangd = function(_, opts)
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup({
          cmd = { "clangd" }, -- Use the system-wide clangd found in PATH
          settings = {
            clangd = {
              -- Add any specific clangd arguments here.
              -- For example, to enable semantic highlighting (requires Neovim 0.9+ and clangd 15+)
              -- arguments = {
              --     "--clang-tidy",
              --     "--background-index",
              --     "--semantic-highlighting",
              -- },
              fallbackFlags = {
                "-xc++", -- Default to C++ mode if no compile_commands.json
                "-std=c++17", -- Your preferred C++ standard
                -- Example: Add system include paths if clangd can't find them automatically
                -- "-I/usr/include/some_library",
              },
            },
          },
          filetypes = {
            "c",
            "cpp",
            "objc",
            "objcpp",
            "cuda",
            "h",
            "hpp",
          },
          -- You might want to define a root_dir function if your C/C++ projects
          -- don't always have a .git/compile_commands.json/.clangd at the root.
          root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json", ".clangd"),
        })
      end,

      -- You can add custom setup functions for other servers here as well:
      -- lua_ls = function(_, opts)
      --   require("lspconfig").lua_ls.setup(opts)
      -- end,
    },
  },
}
