local settings = require('settings')

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local empty_path = fn.empty(fn.glob(install_path)) > 0
if empty_path then
  JUST_INSTALLED = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd 'packadd packer.nvim'
end

-- Initialize and configure packer
local packer = require 'packer'
packer.init { display = { open_fn = function() return require('packer.util').float { border = settings.border } end } }
packer.startup(function(use)
  -- Use plugin and require configuration
  local function reuse(name)
    local file = string.gsub(name, '%p', '-')
    local path = string.format('plugins/%s', file)
    local _, module = pcall(require, path)
    local table = type(module) == 'table' and module or {}
    table[1] = name
    return use(table)
  end

  -- Plugins list
  reuse 'wbthomason/packer.nvim'

  -- Colorscheme
  reuse 'catppuccin/nvim'

  -- Syntax Highlight
  reuse 'nvim-treesitter/nvim-treesitter'

  -- Completion
  reuse 'hrsh7th/nvim-cmp'
  reuse 'hrsh7th/cmp-buffer'
  reuse 'hrsh7th/cmp-path'
  reuse 'hrsh7th/cmp-cmdline'
  reuse 'hrsh7th/cmp-nvim-lua'
  reuse 'hrsh7th/cmp-vsnip'
  reuse 'hrsh7th/vim-vsnip'
  reuse 'rafamadriz/friendly-snippets'
  reuse 'onsails/lspkind.nvim'

  -- Language Server Protocol
  reuse 'williamboman/mason.nvim'
  reuse 'williamboman/mason-lspconfig.nvim'
  reuse 'hrsh7th/cmp-nvim-lsp'
  reuse 'neovim/nvim-lspconfig'
  reuse 'jose-elias-alvarez/null-ls.nvim'

  -- Text Editing and Motion
  reuse 'windwp/nvim-autopairs'
  reuse 'tpope/vim-surround'
  reuse 'tpope/vim-commentary'

  -- Terminal
  reuse 'akinsho/toggleterm.nvim'

  -- File Explorer and UI
  reuse 'nvim-tree/nvim-tree.lua'
  reuse 'nvim-telescope/telescope.nvim'
  reuse 'nvim-lualine/lualine.nvim'
  reuse 'lewis6991/gitsigns.nvim'

  if JUST_INSTALLED then
    packer.sync()
  end
end)
