local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
if not ok_lspconfig then return end

local on_attach_lsp = require('mappings').on_attach_lsp

-- nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok_cmp_nvim_lsp then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

-- Lua LSP
lspconfig.sumneko_lua.setup {
  on_attach = on_attach_lsp,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false }
    }
  }
}
