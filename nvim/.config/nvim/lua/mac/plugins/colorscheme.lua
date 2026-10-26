return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		-- Mark the active split with text color only, so backgrounds stay transparent
		custom_highlights = function(colors)
			return {
				WinSeparator = { fg = colors.overlay1 },
				WinBar = { fg = colors.lavender, bold = true },
				WinBarNC = { fg = colors.overlay0 },
				CursorLineNr = { fg = colors.lavender, bold = true },
			}
		end,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			booleans = { "italic" },
		},
		integrations = {
			blink_cmp = true,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
