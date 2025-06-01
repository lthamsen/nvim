-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("toggleterm").setup({
  open_mapping = [[<C-n>]],
})
