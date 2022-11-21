local ok, lualine = pcall(require, 'lualine')
if not ok then return end

lualine.setup {}

return {
  requires = {
    'nvim-tree/nvim-web-devicons'
  }
}
