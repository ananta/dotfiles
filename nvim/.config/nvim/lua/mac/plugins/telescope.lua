return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<C-t>", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	},
	opts = function()
		local actions = require("telescope.actions")
		-- Everything else you had mapped is already a telescope default
		return {
			defaults = {
				prompt_prefix = "\u{f46b} ",
				selection_caret = "\u{f064} ",
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
		}
	end,
}
