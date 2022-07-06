local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not ok then return end

local settings = require('settings')

local servers = require 'nvim-lsp-installer.servers'
local server = require 'nvim-lsp-installer.server'
local composer = require 'nvim-lsp-installer.core.managers.composer'

-- Install PHP CS Fixer manually to use with Null LS
local php_cs_fixer_name = 'php-cs-fixer'
local php_cs_fixer_root_dir = servers.get_server_install_path(php_cs_fixer_name)
local php_cs_fixer = server.Server:new {
  name = php_cs_fixer_name,
  root_dir = php_cs_fixer_root_dir,
  installer = composer.packages { 'FriendsOfPHP/PHP-CS-Fixer' },
  default_options = {
    cmd_env = composer.env(php_cs_fixer_root_dir)
  }
}
servers.register(php_cs_fixer)

lsp_installer.setup {
  automatic_installation = true,
  ensure_installed = {
    php_cs_fixer_name
  },
  ui = {
    border = settings.border
  }
}
