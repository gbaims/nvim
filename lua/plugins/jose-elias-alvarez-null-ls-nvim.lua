local ok, null_ls = pcall(require, 'null-ls')
if not ok then return end

local servers = require('nvim-lsp-installer.servers')

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.phpcsfixer.with({
      command = servers.get_server_install_path('php-cs-fixer') .. '/vendor/bin/php-cs-fixer'
    })
  }
}

return {
  requires = {
    'nvim-lua/plenary.nvim'
  }
}
