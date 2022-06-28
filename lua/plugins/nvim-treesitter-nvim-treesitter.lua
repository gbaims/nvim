local ok, configs = pcall(require, 'nvim-treesitter.configs')
if ok then
  configs.setup { }
end

return {
  run = ':TSUpdate'
}
