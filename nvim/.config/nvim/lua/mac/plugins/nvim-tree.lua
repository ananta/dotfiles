local function open_dir_arg()
	return vim.fn.argc(-1) > 0 and vim.fn.isdirectory(vim.fn.argv(0)) == 1
end

local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "s", "", opts("Disabled"))
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Only load at startup for `nvim <dir>`, otherwise wait for a keymap
	lazy = not open_dir_arg(),
	cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile" },
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File tree" },
		{
			"sf",
			function()
				require("nvim-tree.api").tree.open({ current_window = true })
			end,
			desc = "File tree in current window",
		},
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		if open_dir_arg() then
			vim.cmd.cd(vim.fn.argv(0))
		end
	end,
	opts = {
		on_attach = on_attach,
		hijack_cursor = true,
		sync_root_with_cwd = true,
		update_focused_file = { enable = true, update_root = true },
		diagnostics = {
			enable = true,
			icons = { hint = "\u{f06a}", info = "\u{f05a}", warning = "\u{f071}", error = "\u{f057}" },
		},
		view = { width = 30 },
		renderer = {
			root_folder_label = ":t",
			highlight_git = true,
			icons = {
				git_placement = "before",
				symlink_arrow = " ➛ ",
				glyphs = {
					default = "\u{e612}",
					symlink = "\u{f481}",
					git = {
						unstaged = "\u{f444}",
						staged = "S",
						unmerged = "\u{e727}",
						renamed = "➜",
						deleted = "\u{f458}",
						untracked = "U",
						ignored = "◌",
					},
					folder = {
						default = "\u{e5ff}",
						open = "\u{e5fe}",
						empty = "\u{f114}",
						empty_open = "\u{f115}",
						symlink = "\u{f482}",
					},
				},
			},
		},
	},
}
