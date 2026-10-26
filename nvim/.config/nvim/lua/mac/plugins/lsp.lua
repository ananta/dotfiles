local servers = {
	"lua_ls",
	"rust_analyzer",
	"ts_ls",
	"gopls",
	"pyright",
	"ruff",
}

local function on_attach(args)
	local bufnr = args.buf
	local client = vim.lsp.get_client_by_id(args.data.client_id)
	local function map(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc, nowait = true, silent = true })
	end

	-- K (hover), grn (rename), gra (code action) and gO (symbols) are Neovim defaults
	map("gD", vim.lsp.buf.declaration, "Go to declaration")
	map("gd", vim.lsp.buf.definition, "Go to definition")
	map("gi", vim.lsp.buf.implementation, "Go to implementation")
	map("gr", vim.lsp.buf.references, "References")
	map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
	map("<leader>ca", vim.lsp.buf.code_action, "Code action")
	map("gl", vim.diagnostic.open_float, "Line diagnostics")
	map("[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, "Previous diagnostic")
	map("]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, "Next diagnostic")
	map("<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")

	if not client then
		return
	end

	-- Let pyright handle hover in Python files
	if client.name == "ruff" then
		client.server_capabilities.hoverProvider = false
	end

	if client:supports_method("textDocument/documentHighlight") then
		local group = vim.api.nvim_create_augroup("mac_lsp_highlight_" .. bufnr, { clear = true })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = group,
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = group,
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "mason-org/mason.nvim", cmd = { "Mason", "MasonInstall", "MasonUpdate" }, opts = {} },
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "\u{f057}",
						[vim.diagnostic.severity.WARN] = "\u{f071}",
						[vim.diagnostic.severity.HINT] = "\u{f05a}",
						[vim.diagnostic.severity.INFO] = "\u{f059}",
					},
				},
				float = { source = true, header = "", prefix = "" },
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("mac_lsp", { clear = true }),
				callback = on_attach,
			})

			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})
			vim.lsp.config("pyright", {
				settings = {
					pyright = { disableOrganizeImports = true }, -- ruff does this
					python = { analysis = { typeCheckingMode = "off" } },
				},
			})

			-- Installs the servers and calls vim.lsp.enable() for each of them
			require("mason-lspconfig").setup({ ensure_installed = servers })
		end,
	},
	{
		-- Neovim API completion/types when editing this config
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
