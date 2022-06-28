-- Detect, then load plugin and indent files in 'runtimepath'
vim.cmd 'filetype on'
vim.cmd 'filetype plugin on'
vim.cmd 'filetype indent on'
vim.cmd 'syntax on'

local o = vim.opt

o.number = true
o.relativenumber = true

-- Tabs and whitespaces
o.tabstop = 2                   -- Specifies the width of tab character
o.shiftwidth = 0                -- amount of whitesaces to be inserted or removed using the intentation commands in normal mode (0 same as tabstop)
o.softtabstop = -1              -- Fine tune the amount of whitespaces to be inserted (-1 Same as shiftwidth)
o.expandtab = true              -- Spaces used in place of tab characters
o.shiftround = true             -- Shift indentation to nearest multiple of shiftwidth
o.autoindent = true             -- New lines inherit indentation of previous lines
o.list = true                   -- Show invisible chars
o.listchars = 'tab:»·,trail:·'  -- Set listchars for tabs and trailing spaces
o.wrap = false                  -- Don't wrap lines
