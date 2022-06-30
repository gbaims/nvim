vim.g.nord_contrast=true
vim.g.nord_borders=true

local ok, _ = pcall(vim.cmd, 'colorscheme nord')
if not ok then
  vim.notify 'Colorscheme nord is not installed yet. It will be set next time'
end
