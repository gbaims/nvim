local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local mappings = require('mappings')
mappings.map_nvim_tree()

nvim_tree.setup {}

return {
  requires = {
    'nvim-tree/nvim-web-devicons'
  }
}
