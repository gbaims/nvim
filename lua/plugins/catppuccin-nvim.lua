local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-mocha')
if not ok then
  vim.notify 'Colorscheme nord is not installed yet. It will be set next time'
end
