return {
  "rmagatti/auto-session",
  lazy = false,
  cond = function()
    return vim.env.NVIM_NO_SESSION == nil
  end,
  keys = {
    { "<leader>qs", "<cmd>AutoSession restore<cr>", desc = "Restore Session (cwd)" },
    { "<leader>qS", "<cmd>AutoSession search<cr>", desc = "Search Sessions" },
    { "<leader>qd", "<cmd>AutoSession disable<cr>", desc = "Don't Save Current Session" },
  },
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    -- Sessions are restored on demand (<leader>qs). Auto-save starts off and is
    -- switched on once a session is restored, so a fresh nvim never overwrites
    -- the saved session. Use :AutoSession enable to start tracking a new one.
    auto_restore = false,
    auto_save = false,
    suppressed_dirs = { "~/", "~/Downloads", "/" },
    bypass_save_filetypes = { "netrw", "DiffviewFiles" },
    post_restore_cmds = {
      function()
        require("auto-session.config").auto_save = true
      end,
      -- Sessions save window-local options (localoptions); old sessions
      -- restore foldmethod=manual, so re-apply treesitter folding.
      function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          vim.wo[win].foldmethod = "expr"
          vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[win].foldtext = ""
          vim.wo[win].foldcolumn = "1"
        end
      end,
    },
  },
}
