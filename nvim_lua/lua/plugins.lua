vim.cmd 'packadd packer.nvim'
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
return require('packer').startup(function()
    local use = require('packer').use
    -- Packer can manage itself as an optional plugin
    use {
        'wbthomason/packer.nvim',
        opt = true
    }
    use {
        "npxbr/gruvbox.nvim",
        requires = {"tjdevries/colorbuddy.vim"},
        config = function()
            vim.g['gruvbox_contrast_dark'] = "medium"
            vim.o.bg = 'dark'
            require("colorbuddy").colorscheme("gruvbox")
        end
    }
    use {
        "norcalli/nvim-colorizer.lua",
        config = 'require"colorizer".setup()'
    }
    use {'andymass/vim-matchup', event = 'VimEnter *'}
    -- apply workaround https://github.com/wbthomason/packer.nvim/issues/30#issuecomment-672841442
    use {'iamcco/markdown-preview.nvim', config = {'vim.cmd[[doautocmd BufEnter]]', 'vim.cmd[[MarkdownPreview]]'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    use {
        'Shougo/deol.nvim',
        config = function()
            local util = require('util')
            vim.g['deol#shell_history_path'] = '~/.zsh_history'
            util.map('n', '<leader>df', ':<C-u>Deol -split=floating<CR>')
            util.map('n', '<leader>dv', ':<C-u>Deol -split=vertical<CR>')
            util.map('n', '<leader>ds', ':<C-u>Deol -split=horizontal<CR>')
        end
    }
    use {
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            vim.g.bufferline = {
                icons = 'both'
            }
        end
    }
    use {'neovim/nvim-lspconfig', config='require"lsp"'}
    use {'nvim-lua/lsp-status.nvim', after='nvim-lspconfig'}
    use {
        'RishabhRD/nvim-lsputils',
        disable = true,
        requires = {
            {'RishabhRD/popfix'},
            {'neovim/nvim-lspconfig'}
        },
        config = function()
            vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
            vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
            vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
            vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
            vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
            vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
            vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
            vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
        end
    }
    use {'nvim-treesitter/nvim-treesitter', after='nvim-ts-rainbow', config='require"treesitter"'}
    use {
        'nvim-lua/completion-nvim',
        after='nvim-lspconfig',
        config=function()
            vim.g.completion_chain_copmplete_list = [[
            {
                'javascript' : [
                    {'complete_items': ['ts']}
                ],
            }
            ]]
            vim.cmd "autocmd BufEnter * lua require'completion'.on_attach()"
        end,
        requires = {{'nvim-treesitter/nvim-treesitter'},{'nvim-treesitter/completion-treesitter'}}
    }
    use {
        'p00f/nvim-ts-rainbow',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use {'romgrk/nvim-treesitter-context',requires = 'nvim-treesitter/nvim-treesitter'}
    use {
        'ElPiloto/sidekick.nvim',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            local util = require('util')
            util.map('n', 'sr', ':call SideKickNoReload()<CR>')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        config = 'require"telescope"',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-symbols.nvim', requires='nvim-telescope/telescope.nvim'}
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
          'nvim-lua/plenary.nvim'
        },
        config = function()
            require"gitsigns".setup()
        end
    }

    use {
        'glepnir/galaxyline.nvim',
        after = 'gitsigns.nvim',
        branch = 'main',
        -- your statusline
        config = function()
            require('config.galaxyline.eviline')
        end,
        -- some optional icons
        requires = {
            {'kyazdani42/nvim-web-devicons'},
            {'tpope/vim-fugitive'},
            {'lewis6991/gitsigns.nvim'},
        },
    }
    use {
        'rhysd/git-messenger.vim',
        config = function ()
            vim.g['git_messenger_include_diff']='current'
            vim.g['git_messenger_always_into_popup']=true
        end
    }
    use 'rhysd/vim-gfm-syntax'
    use {'glepnir/indent-guides.nvim', config='require"indent_guides".setup({})'}
    use 'f-person/git-blame.nvim'
    use 'mattn/vim-goimports'
    use 'ghifarit53/tokyonight-vim'
    use {'cappyzawa/trim.nvim', config='require"nvim-trim"'}
    use 'editorconfig/editorconfig-vim'
    use {'npxbr/glow.nvim', run=':GlowInstall'}
    use {
        'akinsho/nvim-toggleterm.lua',
        config=function()
            require"toggleterm".setup{
                size = 20,
                open_mapping = [[<c-t>]],
                direction = 'horizontal'
            }
        end
    }
end)
