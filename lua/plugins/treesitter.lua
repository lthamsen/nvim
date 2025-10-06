return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- always keep parsers updated
    opts = function(_, opts)
      -- Merge with existing opts
      opts.ensure_installed = vim.tbl_deep_extend("force", opts.ensure_installed or {}, {
        "ocaml",
        "ocaml_interface",
        "menhir", -- for .mly parser files
      })

      -- Highlight group for qtest-style comments
      vim.api.nvim_set_hl(0, "qtest", { link = "SpecialComment" })
    end,
  },
}
