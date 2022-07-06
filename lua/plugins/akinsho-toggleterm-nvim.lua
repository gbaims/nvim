local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then return end

local settings = require('settings')

toggleterm.setup {
  open_mapping = [[<C-\>]],
  direction = 'float',
  float_opts = {
    border = settings.border
  }
}
