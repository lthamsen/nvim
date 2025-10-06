-- For `plugins/markview.lua` users.

return {
  "OXY2DEV/markview.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("markview").setup({
      experimental = {
        check_rtp_message = false, -- hides the warning
        -- OR set check_rtp = false if you don’t want it to touch runtimepath
      },
    })
  end,
}
