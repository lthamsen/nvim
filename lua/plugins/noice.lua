return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			format = {
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash", title = " Shell " },
			},
		},
		routes = {
			-- noice drops :!cmd output by default; send it to notifications
			{
				filter = { event = "msg_show", kind = "shell_out" },
				view = "notify",
				opts = { title = "Shell" },
			},
			{
				filter = { event = "msg_show", kind = "shell_err" },
				view = "notify",
				opts = { title = "Shell", level = "error" },
			},
		},
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
