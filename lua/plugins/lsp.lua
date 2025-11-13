-- ~/.config/nvim/lua/plugins/lspconfig.lua
-- This file defines how nvim-lspconfig is set up by LazyVim.
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.setup = opts.setup or {}

      --------------------------------------------------------------------------
      -- 1) Make sure Mason does NOT manage clangd
      --------------------------------------------------------------------------
      -- Some LazyVim versions populate ensure_installed elsewhere; just be sure
      -- we don't request clangd here:
      opts.servers.clangd = nil

      --------------------------------------------------------------------------
      -- 2) Manual clangd setup (uses system clangd from PATH)
      --------------------------------------------------------------------------
      opts.setup.clangd = function(_, _)
        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup({
          cmd = { "clangd" }, -- system clangd
          -- If you want extra features, uncomment and tweak:
          -- cmd = { "clangd", "--background-index", "--clang-tidy", "--semantic-highlighting" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
          root_dir = lspconfig.util.root_pattern("compile_commands.json", ".clangd", ".git"),
          -- NOTE: fallbackFlags are clangd initialization options (not settings)
          init_options = {
            fallbackFlags = {
              "-xc++",
              "-std=c++23",
            },
          },
          -- Preserve LazyVim’s on_attach/capabilities if they exist:
          on_attach = opts.on_attach,
          capabilities = opts.capabilities,
        })
        return true -- tell LazyVim we've handled clangd ourselves
      end

      --------------------------------------------------------------------------
      -- 3) rust-analyzer settings (your Leptos proc-macro ignore)
      --------------------------------------------------------------------------
      -- opts.servers.rust_analyzer = vim.tbl_deep_extend("force", opts.servers.rust_analyzer or {}, {
      --   settings = {
      --     ["rust-analyzer"] = {
      --       cargo = {
      --         allTargets = false, -- don’t build test benches for no_std
      --         allFeatures = true, -- enable features for your crate
      --       },
      --       checkOnSave = {
      --         command = "check", -- faster than clippy for embedded targets
      --         extraArgs = { "--target", "xtensa-esp32-none-elf" },
      --       },
      --       procMacro = {
      --         ignored = {
      --           leptos_macro = { "server" },
      --         },
      --       },
      --     },
      --   },
      -- })
      return opts
    end,
  },
}
