local ok, configs = pcall(require, 'nvim-treesitter.configs')
if ok then
  configs.setup {
    indent = {
      enable = true
    }
  }
end

return {
  run = ':TSUpdate'
}
