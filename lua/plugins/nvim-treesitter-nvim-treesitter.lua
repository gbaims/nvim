local ok, configs = pcall(require, 'nvim-treesitter.configs')
if ok then
  configs.setup {
    auto_install = true;
    highlight = {
      enable = true;
    }
  }
end

return {
  run = ':TSUpdate'
}
