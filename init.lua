local nvim_group = vim.api.nvim_create_augroup('NvimConfig', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile>', group = nvim_group, pattern = '*/nvim/*.lua' })

require 'options'
require 'mappings'
require 'plugins'
