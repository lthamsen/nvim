--
-- in your plugins config (e.g. lua/plugins/treesitter.lua)

return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}

-- return {
--   "nvim-treesitter/nvim-treesitter",
--   opts = {
--     ensure_installed = {
--       "markdown",
--       "markdown_inline",
--       "lua",
--       "python",
--       "javascript",
--       "typescript",
--       "html",
--       "css",
--       "cpp",
--       -- add more as you need
--     },
--     highlight = {
--       enable = true,
--       additional_vim_regex_highlighting = { "markdown" }, -- keep regex highlighting for markdown
--     },
--   },
-- }
