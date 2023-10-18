local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_lspconfig then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local servers = {
	"rust_analyzer",
	"tsserver",
	"csharp_ls",
}

mason_lspconfig.setup({
	ensure_installed = servers,
	sync_install = false,
	ignore_install = { "javascript" },
})

for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = require("mac.lsp.handlers").on_attach,
		capabilities = require("mac.lsp.handlers").capabilities,
	})
end
