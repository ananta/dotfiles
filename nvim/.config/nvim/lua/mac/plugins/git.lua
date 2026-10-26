return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			changedelete = { text = "▎" },
		},
		attach_to_untracked = true,
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
			end

			map("]g", function()
				gs.nav_hunk("next")
			end, "Next hunk")
			map("[g", function()
				gs.nav_hunk("prev")
			end, "Previous hunk")
			map("<leader>gp", gs.preview_hunk, "Preview hunk")
			map("<leader>gs", gs.stage_hunk, "Stage / unstage hunk")
			map("<leader>gr", gs.reset_hunk, "Reset hunk")
		end,
	},
}
