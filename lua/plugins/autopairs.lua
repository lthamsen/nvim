return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true, -- use treesitter to avoid pairing inside strings/comments
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
		},
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
		},
	},
}
