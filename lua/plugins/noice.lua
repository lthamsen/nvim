return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		views = {
			cmdline_popup = {
				border = { style = "single" },
			},
			popupmenu = {
				border = { style = "single" },
			},
			confirm = {
				border = { style = "single" },
			},
			hover = {
				border = { style = "single" },
			},
		},
	},

	dependencies = { "MunifTanjim/nui.nvim" },
}
