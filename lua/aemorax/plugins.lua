-- Bootstrap Packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') ..
			'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1',
			'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Packer Popup
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
})

-- Packer Init
return packer.startup(function(use)
	-- Base
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'lukas-reineke/lsp-format.nvim'

	-- CMP
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'

	-- File Explorer
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- Lualine
	use 'nvim-lualine/lualine.nvim'

	-- Show Indentations
	use 'lukas-reineke/indent-blankline.nvim'

	-- Todo Highlighter
	use 'folke/todo-comments.nvim'

	-- Themes
	use { "catppuccin/nvim", a = "catppuccin" }

	-- Tab Bar
	use {
		'romgrk/barbar.nvim',
		requires = {
			'lewis6991/gitsigns.nvim',
			'nvim-tree/nvim-web-devicons',
		},
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- Hop
	use 'phaazon/hop.nvim'


	-- Gitgutter
	use 'airblade/vim-gitgutter'

	-- Zenmode
	use 'folke/zen-mode.nvim'

	if packer_bootstrap then
		packer.sync()
	end
end)
