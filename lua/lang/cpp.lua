local function cpp_run(release)
	local root = vim.fs.root(0, "CMakeLists.txt")
	if not root then
		return vim.notify("No CMakeLists.txt found", vim.log.levels.WARN)
	end

	local target = vim.fn.fnamemodify(root, ":t")
	local build_type = release and "Release" or "Debug"

	vim.cmd("silent! wall")

	Snacks.terminal(
		("cmake -B build -DCMAKE_BUILD_TYPE=%s && cmake --build build --target %s -j && ./build/%s"):format(
			build_type,
			target,
			target
		),
		{
			cwd = root,
			interactive = false,
			win = { position = "bottom", height = 0.4 },
		}
	)
end

Snacks.keymap.set("n", "<leader>rr", function()
	cpp_run(false)
end, {
	ft = { "cpp", "c", "cmake" },
	enabled = function(buf)
		return vim.fs.root(buf, "CMakeLists.txt") ~= nil
	end,
	desc = "Build & run",
})
