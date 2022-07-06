local ok_cmp, cmp = pcall(require, 'cmp')
if not ok_cmp then return end

local ok_lspkind, lspkind = pcall(require, 'lspkind')
if not ok_lspkind then return end

local settings = require('settings')

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'buffer' }
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

local window = {}
if not (settings.border == nil or settings.border == '' or settings.border == 'none') then
  local bordered = cmp.config.window.bordered()
  window = {
    completion = bordered,
    documentation = bordered
  }
end

cmp.setup {
  snippet = { expand = function(args) vim.fn['vsnip#anonymous'](args.body) end },
  formatting = { format = lspkind.cmp_format() },
  window = window,
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'vsnip' },
  })
}
