local util = require('util')

local indent = 4
util.opt('b', 'expandtab', true)
util.opt('b', 'shiftwidth', indent)
util.opt('b', 'tabstop', indent)
util.opt('w', 'number', true)
util.opt('o', 'hidden', true)
util.opt('o', 'ignorecase', true)
util.opt('o', 'title', true)
util.opt('o', 'termguicolors', true)
util.opt('o', 'updatetime', 100)
vim.cmd 'set mouse=a'
vim.cmd 'set noswapfile'

local indent2space = {"typescript", "typescriptreact", "javascript", "markdown", "yaml"}
for _, ft in pairs(indent2space) do
    vim.cmd("autocmd FileType " .. ft .. " setlocal et sw=2 sts=2 ts=2")
end

-- debug level
vim.lsp.set_log_level('debug')

-- load plugins
require('plugins')
