-- For `plugins/markview.lua` users.

-- return {
--   "OXY2DEV/markview.nvim",
--   dependencies = { "nvim-treesitter/nvim-treesitter" },
--   config = function()
--     require("markview").setup({
--       experimental = {
--         check_rtp_message = false, -- hides the warning
--         -- OR set check_rtp = false if you don’t want it to touch runtimepath
--       },
--     })
--   end,
-- }

-- in your plugins config (e.g. lua/plugins/treesitter.lua)
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "lua",
      "python",
      "javascript",
      "typescript",
      "html",
      "css",
      "cpp",
      -- add more as you need
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" }, -- keep regex highlighting for markdown
    },
  },
}
