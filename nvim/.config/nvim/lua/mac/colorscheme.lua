local colorscheme = "catppuccin"

require("catppuccin").setup({
	transparent_background = true,
	term_colors = false,
	compile = {
		enabled = false,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = { "italic" },
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		-- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		gitsigns = true,
		telescope = true,
		nvimtree = true,
	},

	color_overrides = {},
	highlight_overrides = {},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

--[[ vim.cmd("hi normal guibg=000000") ]]
--[[ vim.o.background = "dark" ]]
--[[ local colorscheme = "tokyonight" ]]
--[[ vim.g.tokyonight_style = "night" ]]
--[[ vim.g.tokyonight_transparent = false ]]
--[[ vim.g.tokyonight_transparent_sidebar = false ]]

vim.g.catppuccin_flavour = "mocha"
vim.cmd("hi CursorLineNr term=bold gui=bold guifg=#bd93f9") -- fix the cursorline bug by overriding
vim.cmd("hi CursorLine guibg=#181828 guifg=NONE")
