-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local empty_path = fn.empty(fn.glob(install_path)) > 0
if empty_path then
  just_installed = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd 'packadd packer.nvim'
end

-- Regenerate compiled loader file when saving plugin file or configuration
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerSync', group = packer_group, pattern = 'plugins.lua' })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile>', group = packer_group, pattern = '**/plugins/*.lua' })

-- Initialize and configure packer
local packer = require 'packer'
packer.init { display = { open_fn = function() return require('packer.util').float { border = 'rounded' } end }}
packer.startup(function(use)
  -- Use plugin and require configuration
  function reuse(name)
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
  reuse 'folke/tokyonight.nvim'

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

  -- Syntax Highlight
  reuse 'nvim-treesitter/nvim-treesitter'

  if just_installed then
    packer.sync()
  end
end)
