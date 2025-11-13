-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- in lua/config/options.lua or similar
vim.g.markdown_fenced_languages = {
  "html",
  "js=javascript",
  "ts=typescript",
  "py=python",
  "c",
  "cpp",
  "sh=bash",
}

-- Molten option suggestions
-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again

vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/3.13.2/envs/dsp/bin/python")

vim.g.molten_cell_delimiters = { "```", "```" }
-- vim.g.molten_auto_open_output = false

-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
vim.g.molten_image_provider = "image.nvim"

-- optional, I like wrapping. works for virt text and the output window
vim.g.molten_wrap_output = true

-- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- be buggy with longer images
vim.g.molten_virt_text_output = true

-- this will make it so the output shows up below the \`\`\` cell delimiter
vim.g.molten_virt_lines_off_by_1 = true
