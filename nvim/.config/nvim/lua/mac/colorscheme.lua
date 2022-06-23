local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end


vim.cmd("hi normal guibg=000000")
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = false
vim.g.tokyonight_transparent_sidebar = false
vim.o.background = "dark"
