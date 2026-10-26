local prettier = { "prettier" }

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo", "Format" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			javascript = prettier,
			javascriptreact = prettier,
			typescript = prettier,
			typescriptreact = prettier,
			json = prettier,
			jsonc = prettier,
			css = prettier,
			scss = prettier,
			html = prettier,
			yaml = prettier,
			markdown = prettier,
			-- go (gopls) and rust (rust-analyzer) fall back to their LSP formatter
		},
		default_format_opts = { lsp_format = "fallback" },
		format_on_save = { timeout_ms = 1000 },
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.api.nvim_create_user_command("Format", function()
			require("conform").format()
		end, {})
	end,
}
