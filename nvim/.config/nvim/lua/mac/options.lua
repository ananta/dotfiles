-- :help options
local opt = vim.opt

opt.backup = false -- creates a backup file
opt.writebackup = false -- don't write a backup before overwriting a file
opt.swapfile = false -- creates a swapfile
opt.undofile = true -- enable persistent undo
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- height of the command line
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.bomb = false
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = false -- mode is shown in lualine
opt.showtabline = 2 -- always show tabs
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300 -- faster CursorHold (4000ms default)
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.relativenumber = false -- set relative numbered lines
opt.numberwidth = 4 -- set number column width
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.winborder = "rounded" -- border for all floating windows (hover, signature help, diagnostics)opt.guicursor = "i:block"

-- No plugins use the remote-plugin providers; skip loading them
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")
opt.iskeyword:append("-")
