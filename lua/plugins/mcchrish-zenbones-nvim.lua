vim.o.termguicolors=true
vim.o.background='dark'
vim.g.zenwritten_darkness = 'warm'

local ok, _ = pcall(vim.cmd, 'colorscheme zenwritten')
if not ok then
  vim.notify 'Colorscheme zenwritten is not installed yet. It will be set next time'
end

return {
  requires = 'rktjmp/lush.nvim'
}
