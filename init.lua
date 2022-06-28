local config_group = vim.api.nvim_create_augroup('Config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile>', group = config_group, pattern = '*/nvim/*.lua' })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'PackerSync', group = config_group, pattern = '*/nvim/lua/plugins.lua' })

require 'options'
require 'mappings'
require 'plugins'
