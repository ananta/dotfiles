local keymap = vim.keymap.set
local opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<esc>", "<cmd>nohlsearch<cr>", opts)

-- Split window
keymap("n", "ss", "<cmd>split<cr>", opts)
keymap("n", "sv", "<cmd>vsplit<cr>", opts)

-- Navigate between window
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)

-- Visual --
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)
keymap("x", "p", '"_dP', opts)

-- Move text up and down (∆ / ˚ are Option-j / Option-k on macOS)
keymap("x", "J", ":move '>+1<cr>gv=gv", opts)
keymap("x", "K", ":move '<-2<cr>gv=gv", opts)
keymap("x", "∆", ":move '>+1<cr>gv=gv", opts)
keymap("x", "˚", ":move '<-2<cr>gv=gv", opts)

-- Terminal --
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- Plugin keymaps live next to their plugin spec in lua/mac/plugins/
