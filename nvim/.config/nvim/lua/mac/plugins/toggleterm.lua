local lazygit

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ [[<C-\>]], desc = "Toggle terminal" },
		{
			"<leader>gg",
			function()
				lazygit = lazygit or require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true })
				lazygit:toggle()
			end,
			desc = "Lazygit",
		},
	},
	opts = {
		size = 20,
		open_mapping = [[<C-\>]],
		direction = "float",
		float_opts = { border = "curved" },
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		vim.api.nvim_create_autocmd("TermOpen", {
			group = vim.api.nvim_create_augroup("mac_toggleterm", { clear = true }),
			pattern = "term://*toggleterm#*",
			callback = function(args)
				-- lazygit needs <esc> for itself
				if args.file:find("lazygit") then
					return
				end
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = args.buf })
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = args.buf })
			end,
		})
	end,
}
