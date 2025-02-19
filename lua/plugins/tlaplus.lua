return {
  {
    "susliko/tla.nvim",
    config = function()
      require("tla").setup({
        java_executable = "/usr/bin/java",
      })
    end,
  },
  {
    "florentc/vim-tla",
    ft = "tla",
  },
}
