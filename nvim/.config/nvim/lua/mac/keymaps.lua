local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<esc>", ":noh<cr>", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>j", opts)
keymap("n", "sv", ":vsplit<Return><C-w>l", opts)

-- Navigate between window
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)

-- Netrw navigation
keymap("n", "sf", ":e .<Return>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize-2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "∆", ":m .+1<CR>==", opts)
keymap("v", "˚", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "∆", ":move '>+1<CR>gv-gv", opts)
keymap("x", "˚", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- GitSigns --
keymap("n", "]g", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<Leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts)
keymap("n", "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
keymap("n", "<Leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)

keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes'))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-- Run Code --
keymap("n", "<leader>r", "<cmd>RustRun<cr>", opts)
