-------------------- LSP -----------------------------------
vim.cmd 'set signcolumn=yes'
vim.cmd 'set shortmess+=c'
vim.cmd 'set completeopt=menuone,noinsert,noselect'

local util = require('util')
local lsp = require('lspconfig')

lsp.tsserver.setup{}
lsp.gopls.setup{}

local home = os.getenv("HOME")
local sumneko_root_path = home .. "/ghq/github.com/sumneko/lua-language-server"
lsp.sumneko_lua.setup{
    cmd = {sumneko_root_path .. "/bin/macOS/lua-language-server", "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            diagnostics = {
                -- vimモジュールを設定
                globals = {'vim'},
            },
            workspace = {
                -- Neovimのランタイムファイルを設定
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    }
}

--https://github.com/iamcco/diagnostic-languageserver
lsp.diagnosticls.setup {
  cmd = {"diagnostic-languageserver"},
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact", "javascript.jsx", "typescript.tsx"},
  init_options = {
    filetypes = {
      javascript = "eslint",
      javascriptreact = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint",
      ["typescript.tsx"] = "eslint",
      ["javascript.jsx"] = "eslint",
      go = "goimports"
    },
    linters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        rootPatterns = {".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    }
  }
}

util.map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
util.map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
util.map('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
util.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
util.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
util.map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
util.map('n', 'fmt', '<cmd>lua vim.lsp.buf.formatting()<CR>')
util.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
util.map('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
util.map('n', '<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
util.map('n', '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
util.map('n', '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
util.map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
util.map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

vim.cmd([[ autocmd BufWritePost *.js,*.ts,*.tsx,*.jsx lua vim.lsp.buf.formatting() ]])
