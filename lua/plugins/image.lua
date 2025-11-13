return {
  {
    "3rd/image.nvim",
    build = false, -- skip luarocks build
    opts = {
      -- from your first snippet
      processor = "magick_cli",

      -- from your second snippet
      backend = "kitty", -- best UX if your terminal is Kitty
      integrations = {}, -- add integrations if needed
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
}
