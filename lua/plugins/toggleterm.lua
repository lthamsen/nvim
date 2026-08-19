return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		"<C-n>",
		{ "<C-n>", mode = "t" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical" },
		{ "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", desc = "Tab" },
		{ "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle all" },
		{ "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select terminal" },
		{ "<leader>tn", '<cmd>execute v:count1 . "ToggleTerm"<cr>', desc = "Terminal N (with count)" },
		{
			"<leader>tg",
			function()
				_G.term_lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>tp",
			function()
				_G.term_python()
			end,
			desc = "Python REPL",
		},
		{ "<leader>tx", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send line" },
		{ "<leader>tx", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "v", desc = "Send selection" },
	},
	opts = {
		open_mapping = "<C-n>",
		insert_mappings = false,
		direction = "float",
		float_opts = { border = "curved" },
		shade_terminals = true,
		start_in_insert = true,
		persist_size = true,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
		function _G.term_lazygit()
			lazygit:toggle()
		end

		local python = Terminal:new({ cmd = "python3", direction = "horizontal", hidden = true })
		function _G.term_python()
			python:toggle()
		end

		-- terminal-mode window navigation
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "term://*toggleterm#*",
			callback = function()
				local o = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], o)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<cr>]], o)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<cr>]], o)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<cr>]], o)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<cr>]], o)
			end,
		})
	end,
}
