-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local status_api_ok, api = pcall(require, "nvim-tree.api")
if not status_ok then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_augroup("nvim_tree_augroup", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
	group = "nvim_tree_augroup",
	callback = function(data)
		-- buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
		-- buffer is a directory
		local directory = vim.fn.isdirectory(data.file) == 1
		if not no_name and not directory then
			return
		end

		-- change to the directory
		if directory then
			vim.cmd.cd(data.file)
		end
		-- open the tree
		api.tree.open()
	end,
})

local function my_on_attach(bufnr)
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- apply default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "s", "", opts("Open"))
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	--[[ ignore_ft_on_setup = { ]]
	--[[ 	"startify", ]]
	--[[ 	"dashboard", ]]
	--[[ 	"alpha", ]]
	--[[ }, ]]
	on_attach = my_on_attach,
	renderer = {
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
		highlight_git = true,
		root_folder_modifier = ":t",
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	--[[ auto_close = true, ]]
	--[[ open_on_tab = false, ]]
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		side = "left",
		number = false,
		relativenumber = false,
	},
})
