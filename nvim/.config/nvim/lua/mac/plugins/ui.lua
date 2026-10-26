local function hide_in_width()
	return vim.fn.winwidth(0) > 80
end

local function progress()
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local ratio = vim.fn.line(".") / vim.fn.line("$")
	return chars[math.max(1, math.ceil(ratio * #chars))]
end

local function spaces()
	return "spaces: " .. vim.bo.shiftwidth
end

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto", -- follows the colorscheme (catppuccin)
				component_separators = "",
				section_separators = { left = "\u{e0b4}", right = "\u{e0b6}" },
				disabled_filetypes = { "NvimTree" },
			},
			sections = {
				lualine_a = {
					{ "branch", icon = "\u{e725}" },
					{
						"diagnostics",
						sections = { "error", "warn" },
						symbols = { error = "\u{f057} ", warn = "\u{f071} " },
						colored = false,
						always_visible = true,
					},
				},
				lualine_b = {
					{
						"mode",
						fmt = function(str)
							return "-- " .. str .. " --"
						end,
					},
				},
				lualine_c = {},
				lualine_x = {
					{
						"diff",
						colored = false,
						symbols = { added = "\u{f457} ", modified = "\u{f459} ", removed = "\u{f458} " },
						cond = hide_in_width,
					},
					spaces,
					"encoding",
					{ "filetype", icons_enabled = false },
				},
				lualine_y = { { "location", padding = 0 } },
				lualine_z = { progress },
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",
				indicator = { icon = "▎", style = "icon" },
				max_name_length = 30,
				max_prefix_length = 30,
				tab_size = 21,
				offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
				show_buffer_icons = false,
				show_tab_indicators = false,
				separator_style = "thin",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
			},
		},
	},
	-- Delete buffers without closing the window
	{ "moll/vim-bbye", cmd = { "Bdelete", "Bwipeout" } },
}
