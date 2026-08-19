return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		compile = false,
		transparent = false,
		dimInactive = false,
		terminalColors = true,
		background = {
			dark = "wave",
			light = "lotus",
		},
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd.colorscheme("kanagawa")
	end,
}
