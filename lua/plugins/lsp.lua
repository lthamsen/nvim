return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    "folke/snacks.nvim",
  },
  opts = {
    ensure_installed = { "lua_ls", "pyright", "clangd", "rust_analyzer" },
  },
  config = function(_, opts)
    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--query-driver=" .. vim.env.HOME .. "/ncs/toolchains/**/bin/arm-zephyr-eabi-*,"
          .. vim.env.HOME .. "/code/**/.espressif/tools/**/bin/xtensa-esp32-elf-*",
        "--background-index",
        "--header-insertion=never",
      },
    })

    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          check = { command = "clippy" },
        },
      },
    })

    require("mason-lspconfig").setup(opts)

    Snacks.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
      lsp = { method = "textDocument/rename" },
      desc = "Rename",
    })
    Snacks.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
      lsp = { method = "textDocument/codeAction" },
      desc = "Code Action",
    })
    Snacks.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {
      desc = "Line Diagnostics",
    })
  end,
}
