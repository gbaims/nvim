local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
if not ok_lspconfig then return end

local mappings = require('mappings')
local function on_attach(client, bufnr)
  mappings.map_lsp(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    local group = vim.api.nvim_create_augroup('AutoFormattingGroup', { clear = false })
    vim.api.nvim_clear_autocmds { group = group, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre',
      { command = 'lua vim.lsp.buf.formatting_sync()', group = group, buffer = bufnr })
  end
end

-- nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok_cmp_nvim_lsp then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

-- Lua LSP
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false }
    }
  }
}

-- Psalm PHP
lspconfig.psalm.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
