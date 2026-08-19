-- lua/lang/init.lua
local dir = vim.fn.stdpath("config") .. "/lua/lang"

for name, type in vim.fs.dir(dir) do
	if type == "file" and name:match("%.lua$") and name ~= "init.lua" then
		require("lang." .. name:sub(1, -5))
	end
end
