vim.g.tokyonight_style = 'night'

local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight')
if not ok then
  vim.notify 'Colorscheme tokyonight is not installed yet. It will be set next time'
end
