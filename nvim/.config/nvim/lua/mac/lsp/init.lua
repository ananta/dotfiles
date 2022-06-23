local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mac.lsp.lsp-installer")
require("mac.lsp.null-ls")
require("mac.lsp.handlers").setup()
