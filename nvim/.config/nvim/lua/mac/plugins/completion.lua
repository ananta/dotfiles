return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		keymap = {
			preset = "none",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			ghost_text = { enabled = true },
		},
		signature = { enabled = true },
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
	},
}
