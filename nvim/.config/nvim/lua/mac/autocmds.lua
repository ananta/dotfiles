local group = vim.api.nvim_create_augroup("mac", { clear = true })

-- Don't continue comments on new lines. Has to be an autocmd because
-- ftplugins reset formatoptions after options.lua runs.
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Only show the cursorline in the active window
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = group,
	callback = function()
		vim.wo.cursorline = true
	end,
})
vim.api.nvim_create_autocmd("WinLeave", {
	group = group,
	callback = function()
		vim.wo.cursorline = false
	end,
})

-- File name at the top of each split; WinBar / WinBarNC color it for active vs inactive.
-- Set per window so the file tree, terminals and floats don't get one.
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "TermOpen" }, {
	group = group,
	callback = function()
		local is_file = vim.bo.buftype == "" and vim.api.nvim_win_get_config(0).relative == ""
		vim.wo.winbar = is_file and " %f %m" or ""
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.hl.on_yank()
	end,
})
