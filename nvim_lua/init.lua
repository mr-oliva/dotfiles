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
vim.api.nvim_set_var("python3_host_prog", "$HOME/.anyenv/envs/pyenv/shims/python3")
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

-- dignostic
vim.lsp.diagnostic.set_signs()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      spacing = 4,
      prefix = "廓",
    },

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)

---- icons
vim.g.w_sign = ""
vim.g.e_sign = ""
vim.g.h_sign = "ﯦ"

---- hilight
vim.fn.sign_define("LspDiagnosticsSignError", {text = vim.g.e_sign, texthl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = vim.g.w_sign, texthl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = vim.g.h_sign, texthl = "LspDiagnosticsSignHint"})

--- cursor restore
vim.cmd [[augroup CursorRestore]]
vim.cmd [[  au Bufread * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif ]]
vim.cmd [[augroup END]]
