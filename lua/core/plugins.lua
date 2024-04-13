
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	--"tpope/vim-commentary",
	--"mattn/emmet-vim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"ellisonleao/gruvbox.nvim",
	--"dracula/vim",
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
	--"vim-test/vim-test",
	--"lewis6991/gitsigns.nvim",
	--"preservim/vimux",
	--"christoomey/vim-tmux-navigator",
	--"tpope/vim-fugitive",
	--"tpope/vim-surround",
	--"stevearc/oil.nvim",
	-- completion
	--"hrsh7th/nvim-cmp",
	--"hrsh7th/cmp-nvim-lsp",
	--"L3MON4D3/LuaSnip",
	--"saadparwaiz1/cmp_luasnip",
	--"rafamadriz/friendly-snippets",
	--"github/copilot.vim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"mfussenegger/nvim-dap",

		"leoluz/nvim-dap-go",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
	},
	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },



--[[{
	"vinnymeller/swagger-preview.nvim",
	run = "npm install -g swagger-ui-watcher",
},
{
	"iamcco/markdown-preview.nvim",
	run = "cd app && npm install",
},]]
{
	"nvim-telescope/telescope.nvim", tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" }
},
})
