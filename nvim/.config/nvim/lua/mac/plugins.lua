local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Packer didn't work")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single", style = "minimal" })
		end,
	},
})

return packer.startup({
	function(use)
		-- Basics
		use("wbthomason/packer.nvim") -- Have packer manage itself
		use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
		use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

		-- Colorscheme
		use("folke/tokyonight.nvim")
		use({
			"catppuccin/nvim",
			as = "catppuccin",
		})

		-- Completion Plugins
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-nvim-lua")

		-- Snippets
		use("L3MON4D3/LuaSnip") -- snippet engine
		use("rafamadriz/friendly-snippets") -- useful snippets
		use("SirVer/ultisnips")

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		})

		-- Comment
		use("numToStr/Comment.nvim")
		use("JoosepAlviste/nvim-ts-context-commentstring")

		-- Autopair
		use("windwp/nvim-autopairs")

		-- Telescope
		use("nvim-telescope/telescope.nvim")
		use("nvim-telescope/telescope-media-files.nvim")

		-- Treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("p00f/nvim-ts-rainbow")

		-- Gitsigns
		use("lewis6991/gitsigns.nvim")

		-- Nvim Tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
		})
		-- Bufferline
		use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
		use("moll/vim-bbye")
		-- Null ls || Formatter || Diatnostics
		use("jose-elias-alvarez/null-ls.nvim")
		-- Lualine
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		-- Toggleterm
		use({ "akinsho/toggleterm.nvim", tag = "*" })

		-- Indentline
		use({ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} })

		-- Alpha
		use("goolord/alpha-nvim")
		use("antoinemadec/FixCursorHold.nvim")

		-- Impatient
		use("lewis6991/impatient.nvim")

		-- Markdown preview
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
		})

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,

	config = {
		max_jobs = 10,
	},
})
