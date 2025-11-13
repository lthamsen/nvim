-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Molten: evaluate the current visual selection
-- Molten: evaluate the current visual selection
vim.keymap.set(
  "x",
  "<leader>me",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { desc = "execute visual selection", silent = true }
)
vim.keymap.set("n", "<leader>me", "<cmd>normal!vio<CR>", { desc = "execute next fenced block", silent = true })

vim.keymap.set("n", "<leader>ch", function()
  local current = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not current)
  print("Inlay hints " .. (current and "disabled" or "enabled"))
end, { desc = "Toggle inlay hints (global)" })
