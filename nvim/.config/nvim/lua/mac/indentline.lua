local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	return
end

indent_blankline.setup({
	indent = {
		smart_indent_cap = true,
		priority = 2,
	},
	exclude = {
		filetypes = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
		},
		buftypes = { "terminal", "nofile" },
	},
	scope = {
		show_start = false,
		show_end = false,
	},
})
