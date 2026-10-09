-- General

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mousescroll = "ver:1,hor:2"
vim.opt.termguicolors = true
vim.o.showcmd = true
vim.o.showcmdloc = "statusline"
-- Looks
vim.o.winborder = "single"

-- Session
-- Don't show the E325 swapfile prompt, it breaks auto-session restores
vim.opt.shortmess:append("A")
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.conceallevel = 1

-- Folding via treesitter (functions, structs, blocks)
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99 -- open files with everything unfolded
vim.o.foldlevelstart = 99
vim.o.foldtext = "" -- first line of the fold, syntax highlighted
vim.opt.fillchars = {
	foldopen = "\u{f078}", -- nf chevron down
	foldclose = "\u{f054}", -- nf chevron right
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
-- Gutter with fold chevrons, git signs and diagnostics (snacks.statuscolumn)
vim.o.signcolumn = "yes"
vim.o.foldcolumn = "1" -- snacks only draws fold icons when this is non-zero
vim.o.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
