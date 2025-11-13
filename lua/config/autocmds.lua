-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ml", "*.mli" },
  callback = function(args)
    require("conform").format({ bufnr = args.buf, lsp_fallback = false })
  end,
})

-- When an .ipynb finishes loading, re-apply markdown so fences pick up settings
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.ipynb",
  callback = function()
    -- make sure globals exist, then refresh syntax/filetype once
    vim.g.markdown_fenced_languages = vim.g.markdown_fenced_languages or { "python", "py=python" }
    vim.cmd("setfiletype markdown") -- retriggers FileType markdown cleanly
  end,
})
