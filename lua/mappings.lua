local map = vim.keymap.set

-- Remap space as leader key
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '

-- Move windows
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')

-- Resize windows
map('n', '<A-.>', ':vertical resize +3<CR>')
map('n', '<A-,>', ':vertical resize -3<CR>')
map('n', '<A-=>', ':resize +3<CR>')
map('n', '<A-->', ':resize -3<CR>')

map('n', '<C-s>', ':write<CR>') -- Save document
map('n', '<C-c>', ':bwipeout<CR>') -- Delete buffer

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
  map('n', 'gi', lsp.implementation, bufopts)
  map('n', 'gr', lsp.references, bufopts)
  map('n', 'K', lsp.hover, bufopts)
  map({ 'n', 'i' }, '<C-k>', lsp.signature_help, bufopts)
  map('n', '<Leader>wa', lsp.add_workspace_folder, bufopts)
  map('n', '<Leader>wr', lsp.remove_workspace_folder, bufopts)
  map('n', '<Leader>wl', function() print(vim.inspect(lsp.list_workspace_folders())) end, bufopts)
  map('n', '<Leader>D', lsp.type_definition, bufopts)
  map('n', '<Leader>rn', lsp.rename, bufopts)
  map('n', '<Leader>ca', lsp.code_action, bufopts)
  map('n', '[d', vim.diagnostic.goto_prev, bufopts)
  map('n', ']d', vim.diagnostic.goto_next, bufopts)
  map('n', '~d', vim.diagnostic.setloclist, bufopts)
end

M.map_telescope = function()
  map('n', '<Leader>f', ':Telescope find_files<CR>')
  map('n', '<Leader>g', ':Telescope live_grep<CR>')
  map('n', '<Leader>k', ':Telescope keymaps<CR>')
end

return M
