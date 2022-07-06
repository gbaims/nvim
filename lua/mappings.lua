local map = vim.keymap.set

-- Remap space as leader key
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '

-- Remove search highlight
map('n', '<C-N>', ':noh<CR>', { silent = true })

local M = {}

M.map_lsp = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local lsp = vim.lsp.buf
  map('n', 'gD', lsp.declaration, bufopts)
  map('n', 'gd', lsp.definition, bufopts)
  map('n', 'K', lsp.hover, bufopts)
  map('n', 'gi', lsp.implementation, bufopts)
  map('n', '<C-k>', lsp.signature_help, bufopts)
  map('n', '<Leader>wa', lsp.add_workspace_folder, bufopts)
  map('n', '<Leader>wr', lsp.remove_workspace_folder, bufopts)
  map('n', '<Leader>wl', function() print(vim.inspect(lsp.list_workspace_folders())) end, bufopts)
  map('n', '<Leader>D', lsp.type_definition, bufopts)
  map('n', '<Leader>rn', lsp.rename, bufopts)
  map('n', '<Leader>ca', lsp.code_action, bufopts)
  map('n', 'gr', lsp.references, bufopts)
  map('n', '<Leader>f', lsp.formatting, bufopts)
  map('n', '[d', vim.diagnostic.goto_prev, bufopts)
  map('n', ']d', vim.diagnostic.goto_next, bufopts)
  map('n', '~d', vim.diagnostic.setloclist, bufopts)
end

return M
