-- Bootstrap Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Intall Plugins
return packer.startup(function(use)
	use 'wbthomason/packer.nvim' -- Package Manager
	use 'neovim/nvim-lspconfig'  -- Neovim LSP configurations

	-- CMP
	use 'hrsh7th/cmp-nvim-lsp'   -- CMP for language server
  use 'hrsh7th/cmp-buffer'     -- CMP for buffer
	use 'hrsh7th/cmp-path'       -- CMP for paths
  use 'hrsh7th/cmp-cmdline'    -- CMP for commandline
	use 'hrsh7th/nvim-cmp'       -- Neovim Completion

	-- Snippet
	use 'L3MON4D3/LuaSnip'       -- LuaSnip

	-- Colorschemes
	use 'morhetz/gruvbox'        -- Gruvbox colorscheme

	-- Treesitter
	use {
		'p00f/nvim-ts-rainbow',            -- Rainbow coloring
		requires = {
			'nvim-treesitter/nvim-treesitter',   -- Treesitter plugin
		},
	}

	-- UI
	use 'lukas-reineke/indent-blankline.nvim' -- Shows indentations
	use 'andymass/vim-matchup'                -- Auto Matchup Start Ends
	use 'nacro90/numb.nvim'                   -- Number peeking
	use 'rcarriga/nvim-notify'                -- Nice Notifier

	-- File Explorer
	use {
		'kyazdani42/nvim-tree.lua',             -- File Browser
		requires = {
			'kyazdani42/nvim-web-devicons',       -- Icons for browser
		},
	}

	-- Hop
	use 'phaazon/hop.nvim'                    -- Hop for fast jumping

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',         -- Lualine
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Diffview
	use {
		'sindrets/diffview.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	-- Gitgutter
	use 'airblade/vim-gitgutter'

	-- Diagnostics (Trouble):
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}

	if packer_bootstrap then
		require("packer").sync()
	end
end)
