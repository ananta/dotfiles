local parsers = {
	"bash",
	"css",
	"fish",
	"go",
	"gomod",
	"gosum",
	"html",
	"javascript",
	"jsdoc",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"rust",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- doesn't support lazy-loading
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("mac_treesitter", { clear = true }),
				callback = function(args)
					if not pcall(vim.treesitter.start, args.buf) then
						return
					end
					if vim.bo[args.buf].filetype ~= "yaml" then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		-- Correct commentstring for embedded languages (JSX/TSX) with the built-in `gc` commenting
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = { enable_autocmd = false },
		init = function()
			local get_option = vim.filetype.get_option
			---@diagnostic disable-next-line: duplicate-set-field
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
						and require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end
		end,
	},
}
