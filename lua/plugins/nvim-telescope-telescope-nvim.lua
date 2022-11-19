local ok, telescope = pcall(require, 'telescope')
if not ok then return end

local mappings = require('mappings')
mappings.map_telescope()

telescope.setup {}

return {
  requires = {
    'nvim-lua/plenary.nvim'
  }
}
