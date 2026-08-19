-- General keymaps
local map = vim.keymap.set

-- navigate
map("n", "<leader>wh", "<C-w>h", { desc = "Left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Upper window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Right window" })
map("n", "<leader>ww", "<C-w>w", { desc = "Next window" })
map("n", "<leader>wp", "<C-w>p", { desc = "Previous window" })

-- split
map("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>wn", "<C-w>n", { desc = "New empty window" })

-- close
map("n", "<leader>wq", "<C-w>q", { desc = "Close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close others" })

-- move / rearrange
map("n", "<leader>wH", "<C-w>H", { desc = "Move far left" })
map("n", "<leader>wJ", "<C-w>J", { desc = "Move to bottom" })
map("n", "<leader>wK", "<C-w>K", { desc = "Move to top" })
map("n", "<leader>wL", "<C-w>L", { desc = "Move far right" })
map("n", "<leader>wx", "<C-w>x", { desc = "Swap with next" })
map("n", "<leader>wT", "<C-w>T", { desc = "Move to new tab" })

-- resize
map("n", "<leader>w=", "<C-w>=", { desc = "Equalize sizes" })
map("n", "<leader>w+", "<C-w>+", { desc = "Increase height" })
map("n", "<leader>w-", "<C-w>-", { desc = "Decrease height" })
map("n", "<leader>w>", "<C-w>>", { desc = "Increase width" })
map("n", "<leader>w<", "<C-w><", { desc = "Decrease width" })
map("n", "<leader>w_", "<C-w>_", { desc = "Max height" })

-- Buffers
-- navigate
map("n", "<leader>bb", function()
	Snacks.picker.buffers()
end, { desc = "Find buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>b<Tab>", "<cmd>b#<cr>", { desc = "Last used buffer" })

-- close
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete other buffers" })
map("n", "<leader>ba", function()
	Snacks.bufdelete.all()
end, { desc = "Delete all buffers" })

-- misc
map("n", "<leader>bl", "<cmd>ls<cr>", { desc = "List buffers" })
map("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save buffer" })
local map = vim.keymap.set

-- navigate
map("n", "<leader>bb", function()
	Snacks.picker.buffers()
end, { desc = "Find buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>b<Tab>", "<cmd>b#<cr>", { desc = "Last used buffer" })

-- close
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete other buffers" })
map("n", "<leader>ba", function()
	Snacks.bufdelete.all()
end, { desc = "Delete all buffers" })

-- misc
map("n", "<leader>bl", "<cmd>ls<cr>", { desc = "List buffers" })
map("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save buffer" })
