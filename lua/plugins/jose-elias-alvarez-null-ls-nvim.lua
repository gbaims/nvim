local ok, null_ls = pcall(require, 'null-ls')
if not ok then return end

local ok_mason, mason_registry = pcall(require, 'mason-registry')
if ok_mason then
  local packages = {
    'php-cs-fixer'
  }
  for _, item in ipairs(packages) do
    local package = mason_registry.get_package(item)
    if not package:is_installed() then
      package:install()
    end
  end
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.phpcsfixer
  }
}

return {
  requires = {
    'nvim-lua/plenary.nvim'
  }
}
