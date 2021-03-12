vim.cmd 'packadd packer.nvim'
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
return require('packer').startup(function()
    local use = require('packer').use
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim',
        opt = true
    }
    -- 気分で使いたいcolorschemeたち
    --use {
    --    "npxbr/gruvbox.nvim",
    --    requires = {"tjdevries/colorbuddy.vim"}, config = function()
    --        vim.g['gruvbox_contrast_dark'] = "medium"
    --        vim.o.bg = 'dark' require("colorbuddy").colorscheme("gruvbox")
    --    end
    --}
    --use {
    --    'sainnhe/sonokai',
    --    config = function()
    --        vim.g.sonokai_style = 'atlantis'
    --        vim.g.sonokai_enable_italic = 1
    --        vim.cmd[[colorscheme sonokai]]
    --    end
    --}
    --use {
    --    "tjdevries/gruvbuddy.nvim",
    --    requires = {"tjdevries/colorbuddy.vim"},
    --    config = function()
    --        vim.cmd [[ autocmd ColorScheme gruvbuddy highlight DiffDelete gui=NONE guibg=#2D171C guifg=NONE ]]
    --        require('colorbuddy').colorscheme('gruvbuddy')
    --        --vim.cmd [[ highlight DiffDelete gui=NONE guibg=#2D171C guifg=NONE ]]
    --    end
    --}
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
    }
    use {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup()
        end
    }
    use {'neovim/nvim-lspconfig', config='require"lsp"'}
    use {
        'glepnir/lspsaga.nvim',
        requires = {
            'neovim/nvim-lspconfig'
        },
        config = function()
            local util = require('util')
            -- lsp provider to find the currsor word definition and reference
            util.map('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")
            util.map('n', 'ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
            util.map('v', 'ca', "<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>")
            util.map('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>")
            -- show hover doc
            util.map('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
            util.map('n', '<silent> <C-f>', "<cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>")
            util.map('n', '<silent> <C-b>', "<cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>")
            util.map('n', 'gp', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>")
            -- show signature help
            util.map('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
            -- rename
            util.map('n', 'rn', "<cmd>lua require('lspsaga.rename').rename()<CR>")
            -- show
            util.map('n', 'gds', ":Lspsaga show_line_diagnostics<CR>")
            -- jump diagnostic
            util.map('n', '[g', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
            util.map('n', ']g', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")
            util.map('n', '<Leader>lg', "<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<CR>")
            util.map('t', '<Leader>lg', [[<C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>]])
        end
    }
    use {'nvim-treesitter/nvim-treesitter', config='require"treesitter"'}
    use {
        "glepnir/zephyr-nvim",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('zephyr').get_zephyr_color()
            vim.g.colors_name = 'zephyr'
            vim.cmd [[ highlight DiffDelete gui=NONE guibg=#2D171C guifg=NONE ]]
            vim.cmd [[ highlight DiffAdd gui=NONE guibg=#13231D guifg=NONE ]]
            vim.cmd [[ highlight DiffChange gui=NONE guibg=#575403 guifg=NONE ]]
            vim.cmd [[ highlight DiffText gui=NONE guibg=#575403 guifg=NONE ]]
        end
    }
    --use {
    --    "lewis6991/github_dark.nvim",
    --    requires = "nvim-treesitter/nvim-treesitter",
    --    config = "require'github_dark'.apply()"
    --}
    --use {
    --    'nvim-lua/completion-nvim',
    --    after='nvim-lspconfig',
    --    config=function()
    --       -- vim.g.completion_chain_copmplete_list = [[
    --       -- {
    --       --     'javascript' : [
    --       --         {'complete_items': ['ts']}
    --       --     ],
    --       -- }
    --       -- ]]
    --        vim.o.shortmess="c"
    --        vim.o.completeopt="menuone,noinsert,noselect"
    --        vim.cmd "autocmd BufEnter * lua require'completion'.on_attach()"
    --    end,
    --    requires = {{'nvim-treesitter/nvim-treesitter'},{'nvim-treesitter/completion-treesitter'}, {'tjdevries/nlua.nvim'}}
    --}
    use {
        'hrsh7th/nvim-compe',
        config=function()
            vim.o.completeopt = "menu,menuone,noselect"
            require'compe'.setup{
              enabled = true;
              autocomplete = true;
              debug = false;
              min_length = 1;
              preselect = 'enable';
              throttle_time = 80;
              source_timeout = 200;
              incomplete_delay = 400;
              max_abbr_width = 100;
              max_kind_width = 100;
              max_menu_width = 100;
              documentation = true;

              source = {
                path = true;
                buffer = true;
                calc = true;
                vsnip = true;
                nvim_lsp = true;
                nvim_lua = true;
                spell = true;
                tags = true;
                snippets_nvim = true;
                treesitter = true;
              };
            }
        end
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
            vim.g.sidekick_line_num_def_types = [[{
                'class': 1,
                'type': 1,
                'function': 1,
                'module': 1,
                'method': 1,
            }]]
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        config = 'require"config.telescope"',
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
        requires = {
          {'kyazdani42/nvim-web-devicons'},
          {'lewis6991/gitsigns.nvim'},
          {'tpope/vim-fugitive'},
        },
        config = function()
          local eviline = vim.fn.stdpath('data') .. '/site/pack/packer/start/galaxyline.nvim/example/eviline.lua'
          vim.cmd('luafile ' .. eviline)
        end
    }
    use {
        'rhysd/git-messenger.vim',
        config = function ()
            vim.g['git_messenger_include_diff']='current'
            vim.g['git_messenger_always_into_popup']=true
        end
    }
    use 'rhysd/vim-gfm-syntax'
    use {
        'glepnir/indent-guides.nvim',
        config=function()
            require"indent_guides".setup({
                indent_levels = 10;
                exclude_filetypes = {'help','dashboard','dashpreview','LuaTree','vista','sagahover', 'sidekick', 'packer'}
            })
        end
    }
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
    use {
        'nvim-telescope/telescope-packer.nvim',
        requires = {
            {'wbthomason/packer.nvim'},
            {'nvim-telescope/telescope.nvim'},
        },
        config = function()
            local opts = {noremap = true, silent = true}
            vim.api.nvim_set_keymap("n", ",p", "<cmd>lua require'telescope'.extensions.packer.plugins()<CR>", opts)
        end
    }
    use {
        'nvim-telescope/telescope-github.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope.nvim'},
            {'nvim-telescope/telescope-github.nvim'},
        },
        config = "require('telescope').load_extension('gh')"
    }
    use {'windwp/nvim-autopairs', config='require"config.autopairs"'}
    use 'tjdevries/vlog.nvim'
    use "matsub/rtcweb-sdp.vim"
    use "mattn/emmet-vim"
end)
