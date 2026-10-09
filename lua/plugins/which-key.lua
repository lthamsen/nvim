return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>f", group = "Files" },
			{ "<leader>s", group = "Search" },
			{ "<leader>g", group = "Git", icon = { icon = "󰊢 ", color = "orange" } },
			{ "<leader>gh", group = "Hunks" },
			{ "<leader>q", group = "Session" },
			{ "<leader>u", group = "UI", icon = { icon = "󰙵 ", color = "cyan" } },
			{ "<leader>w", group = "Window", icon = { icon = "󰖯", color = "green" } },
			{ "<leader>b", group = "Buffer", icon = { icon = "󰓩 ", color = "azure" } },
		},
	},
}
