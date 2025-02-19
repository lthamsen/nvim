return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true

      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true

      -- this will make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_virt_lines_off_by_1 = true
      -- Keymaps
      vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>")
      vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>")
      vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>")
      vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
      vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>")
      vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>")
      vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>")
    end,
  },
}
