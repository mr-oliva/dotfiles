nnoremap <silent> cp :set clipboard=unnamedplus<CR>
nnoremap <silent> <Leader>cp :unset clipboard<CR>
set noswapfile
set title
set number
set tabstop=4
set expandtab
set shiftwidth=4
set mouse=a
set hidden
set updatetime=300
set background=dark
"set cursorline
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set diffopt+=vertical
setlocal nomodeline

syntax enable

tnoremap <C-[> <C-\><C-n>

set termguicolors
let g:python3_host_prog = "/usr/local/bin/python3"
if has("autocmd")
    filetype plugin on

    filetype indent on
    autocmd FileType typescript setlocal et sw=2 sts=2 ts=2
    autocmd FileType typescriptreact setlocal et sw=2 sts=2 ts=2
    autocmd FileType javascript setlocal et sw=2 sts=2 ts=2
    autocmd FileType vue setlocal et sw=2 sts=2 ts=2
    autocmd FileType cpp setlocal et sw=2 sts=2 ts=2
    autocmd FileType yaml setlocal et sw=2 sts=2 ts=2
endif

"autocmd ColorScheme * highlight CocHighlightText guibg=Green ctermbg=11
"autocmd FileType !python highlight CocHighlightText guibg=Green ctermbg=11

call plug#begin('~/.local/share/nvim/plugged')

Plug 'mattn/vim-maketable'

Plug 'cappyzawa/trim.nvim'

Plug 'jparise/vim-graphql'

"Plug 'ntpeters/vim-better-whitespace'
"let g:better_whitespace_enabled=1
"let g:strip_whitespace_on_save=1
Plug 'lambdalisue/gina.vim'
Plug 'junkblocker/patchreview-vim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'romgrk/nvim-treesitter-context'

Plug 'morhetz/gruvbox'
"let g:gruvbox_contrast_dark = 'soft'
"let g:gruvbox_contrast_dark = 'hard'
"
Plug 'ghifarit53/tokyonight-vim'
let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1

Plug 'liuchengxu/vista.vim'
map <silent>tg :Vista coc<CR>
let g:vista#renderer#inable_icon = 1
let g:vista_default_executive = "coc"
let g:vista#renderer#enable_icon = 1



"Plug 'cocopon/iceberg.vim'
"Plug 'patstockwell/vim-monokai-tasty'
"Plug 'jacoborus/tender.vim'
"Plug 'sainnhe/gruvbox-material'
"Plug 'rakr/vim-one'
"Plug 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
"Plug 'iCyMind/NeoSolarized'
"let g:neosolarized_contrast = "high"
"Plug 'romainl/flattened'
"Plug 'srcery-colors/srcery-vim'
"let g:srcery_transparent_background = 1
"let g:srcery_italic = 1
"let g:srcery_inverse_matches = 1
"let g:srcery_inverse_match_paren = 1
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'w0ng/vim-hybrid'
"Plug 'kaicataldo/material.vim'
""let g:material_theme_style = 'palenight'
"let g:material_theme_style = 'default'
"let g:material_terminal_italics = 1
Plug 'sonph/onehalf', {'rtp': 'vim/'}
"Plug 'arcticicestudio/nord-vim'
"Plug 'sainnhe/sonokai'
"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1
"Plug 'crusoexia/vim-monokai'
"Plug 'tomasr/molokai'
Plug 'rhysd/vim-color-spring-night'
let g:spring_night_cterm_italic = 1
"Plug 'junegunn/seoul256.vim'
"let g:seoul256_background = 234
"Plug 'KeitaNakamura/neodark.vim'
"let g:neodark#terminal_transparent = 1
"let g:neodark#use_256color = 1


Plug 'ryanoasis/vim-devicons'
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
"Plug 'adelarsq/vim-devicons-emoji'

"Plug 'pangloss/vim-javascript'
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'maxmellon/vim-jsx-pretty'

"" vim-jsx-typescript depends on typescript-vim
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript', {'for': 'typescriptreact'}

Plug 'mattn/vim-goimports'

Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/deol.nvim'
let g:deol#shell_history_path = '~/.zsh_history'
nnoremap <silent> <Leader>df :<C-u>Deol -split=floating<CR>
nnoremap <silent> <Leader>dv :<C-u>Deol -split=vertical<CR>
nnoremap <silent> <Leader>ds :<C-u>Deol -split=horizontal<CR>
nmap <silent> <Leader>bg <Plug>(deol_bg)

Plug 'chrisbra/csv.vim'
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = 'right:60%'
nnoremap <silent> ,f :Files<CR>
nnoremap <silent> ,gf :GFiles<CR>
nnoremap <silent> ,F :GFiles?<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> ,l :BLines<CR>
nnoremap <silent> ,h :History<CR>
nnoremap <silent> ,m :Mark<CR>
nnoremap <silent> ,r :Rg<CR>
"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'nvim-lua/diagnostic-nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"command! -nargs=0 Format :call CocAction('format')
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> ft <Plug>(coc-format)
nmap <silent> gl <Plug>(coc-codelens-action)
set signcolumn=yes

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gs <Plug>(coc-git-chunkinfo)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
"
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"nnoremap mdf :call coc#config('git', {'diffRevision': 'master'})<CR>


"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"
"setlocal signcolumn=yes
"setlocal omnifunc=lsp#complete
"nmap <buffer> gd <plug>(lsp-definition)
"nmap <buffer> gi <plug>(lsp-implementation)
"nmap <buffer> rn <plug>(lsp-rename)
"nmap <buffer> K <plug>(lsp-hover)
"let g:lsp_highlight_references_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

"let g:airline_theme='onedark'
"let g:airline_theme='one'
"let g:airline_theme='oceanicnext'
"let g:airline_theme='palenight'
"let g:airline_theme='hybrid'
"let g:airline_theme='dracula'
"let g:airline_theme='behelit'
"let g:airline_theme='violet'
"let g:airline_theme='nord'
"let g:airline_theme='gruvbox'
let g:airline_theme='tokyonight'
"let g:airline_theme='solarized'
"let g:airline_theme='srcery'
"let g:airline_theme='onehalfdark'
"let g:airline_theme='sonokai'
"let g:airline_theme='spring_night'
"let g:airline_theme='monokai_tasty'

" coc側でdiagnosticする場合は必要
let g:airline_section_info = '%{airline#util#wrap(airline#extensions#coc#get_info(),0)}'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_section_hint = '%{airline#util#wrap(airline#extensions#coc#get_hint(),0)}'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = '🔥'
let g:airline#extensions#coc#warning_symbol = '🚬'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline#extensions#vista#enabled = 1

"Plug 'itchyny/lightline.vim'
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
"      \ },
"      \ 'component_function': {
"      \   'method': 'NearestMethodOrFunction'
"      \ },
"      \ }
"function! NearestMethodOrFunction() abort
"  return get(b:, 'vista_nearest_method_or_function', '')
"endfunction

Plug 'joshdick/onedark.vim'
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
if (has("termguicolors"))
    set termguicolors
endif


"Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"let g:mkdp_auto_close = 1
let g:mkdp_echo_preview_url = 1
"let g:mkdp_browser = 'firefox'
"let g:mkdp_refresh_slow=1
"let g:mkdp_open_ip = system("ip a show eth0 | grep inet | grep -v inet6 | awk '{print $2}' | awk -F'/' '{print $1}'")
"let g:mkdp_open_ip = $IP
let g:mkdp_open_ip = 'localhost'
let g:mkdp_port = '2851'
let g:mkdp_page_title = '「${name}」'
" 背景色が色でみえない
"let g:mkdp_highlight_css="/home/bookun/highlightjs/dracula.css"
"let g:mkdp_markdown_css="/usr/local/lib/node_modules/github-markdown-css/github-markdown.css"
" autocmd FileType markdown nnoremap <LEADER>p :MarkdownPreview<CR>
"

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"" Trigger configuration. Do not use <tab> if you use
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-l>"
"let g:UltiSnipsJumpBackwardTrigger="<c-h>"
"let g:UltiSnipsSnippetDirectories=['~/.config/nvim/Ultisnips/']

Plug 'tpope/vim-fugitive'

"Plug 'airblade/vim-gitgutter'
"" Use fontawesome icons as signs
"let g:gitgutter_sign_added = '+'
"let g:gitgutter_sign_modified = '>'
"let g:gitgutter_sign_removed = '-'
"let g:gitgutter_sign_removed_first_line = '^'
"let g:gitgutter_sign_modified_removed = '<'
"nmap <silent> gs :GitGutterBufferToggle<CR>


" let g:gitgutter_override_sign_column_highlight = 1

Plug 'mattn/emmet-vim'

" Plug 'buoto/gotests-vim'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

Plug 'andymass/vim-matchup'
let g:loaded_matchit = 1
"autocmd VimEnter,Colorscheme * :hi MatchWord ctermfg=red guifg=blue cterm=underline gui=underline

"Plug 'kana/vim-operator-user'
"Plug 'rhysd/vim-operator-surround'
"map <silent>sa <Plug>(operator-surround-append)
"map <silent>sd <Plug>(operator-surround-delete)
"map <silent>sr <Plug>(operator-surround-replace)

Plug 'rhysd/git-messenger.vim'

let g:git_messenger_include_diff='current'
let g:git_messenger_always_into_popup=v:true

Plug 'rhysd/vim-gfm-syntax'

Plug 'segeljakt/vim-silicon'
let g:silicon = {
      \ 'theme':              'OneHalfDark',
      \ 'background':         '#ffffff',
      \ 'shadow-color':       '#555555',
      \ 'line-pad':                   2,
      \ 'pad-horiz':                  0,
      \ 'pad-vert':                   0,
      \ 'shadow-blur-radius':         0,
      \ 'shadow-offset-x':            0,
      \ 'shadow-offset-y':            0,
      \ 'line-number':           v:true,
      \ 'round-corner':          v:true,
      \ 'window-controls':       v:true,
      \ }

call plug#end()

"luafile $HOME/.config/nvim/lua/lsp.lua

"augroup onedarkGroup
"  autocmd!
"  let s:white = {'gui': '#ABB2BF', 'cterm': '145', 'cterm16': '7'}
"  autocmd ColorScheme * call onedark#set_highlight("Normal", {'fg': s:white})
"  autocmd ColorScheme onedark highlight DiffAdd gui=NONE guibg=#4b6e31 guifg=NONE
"  autocmd ColorScheme onedark highlight DiffDelete gui=NONE guibg=#400d11 guifg=NONE
"  autocmd ColorScheme onedark highlight DiffText ctermfg=NONE ctermbg=NONE guifg=NONE guibg=#825e1a
"augroup END


"color onedark
"color onehalf
"color onehalfdark
"color dracula
"color hybrid
"color one
"color japanesque
"color hybrid_material
"color hybrid_reverse
"colorscheme sonokai
"colorscheme molokai
"color night-owl
"color nord
"color tender
"color gruvbox-material
"colorscheme solarized
"colorscheme NeoSolarized
"colorscheme flattened_dark
"colorscheme spring-night
"colorscheme seoul256
"colorscheme neodark
"colorscheme material
"colorscheme vim-monokai-tasty
"colorscheme iceberg
"colorscheme NeoSolarized
"colorscheme OceanicNext
"colorscheme palenight
"color oreno
"colorscheme gruvbox
colorscheme tokyonight
"colorscheme srcery

lua <<EOF
require('trim').setup({
  -- if you want to ignore markdown file.
  -- you can specify filetypes.
  disable = {"markdown"},
})
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    disable = {},
    keymaps = {},
  },
  refactor = {
    highlight_defintions = {
      enable = true
    },
    smart_rename = {
      enable = false,
    },
    navigation = {
      enable = false,
    }
  },
  textobjects = { -- syntax-aware textobjects
  enable = true,
  disable = {},
  keymaps = {}
  },
  ensure_installed = 'all'
}
local ts_utils = require 'nvim-treesitter.ts_utils'
EOF
