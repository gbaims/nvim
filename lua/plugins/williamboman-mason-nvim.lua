local ok, mason = pcall(require, 'mason')
if not ok then return end

local settings = require('settings')

mason.setup {
  ui = {
    border = settings.border
  }
}
