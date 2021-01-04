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

call plug#begin('~/.local/share/nvim/plugged')

Plug 'norcalli/nvim-colorizer.lua'

Plug 'matsub/rtcweb-sdp.vim'

Plug 'mattn/vim-maketable'

Plug 'cappyzawa/trim.nvim'

Plug 'jparise/vim-graphql'

"Plug 'ntpeters/vim-better-whitespace'
"let g:better_whitespace_enabled=1
"let g:strip_whitespace_on_save=1
Plug 'lambdalisue/gina.vim'
Plug 'junkblocker/patchreview-vim'

Plug 'morhetz/gruvbox'
"let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_dark = 'hard'
"
Plug 'ghifarit53/tokyonight-vim'
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

Plug 'liuchengxu/vista.vim'
map <silent>tg :Vista coc<CR>
let g:vista#renderer#inable_icon = 1
let g:vista_default_executive = "coc"
let g:vista#renderer#enable_icon = 1


Plug 'kyazdani42/nvim-web-devicons'

Plug 'romgrk/barbar.nvim'

Plug 'mattn/vim-goimports'

Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/deol.nvim'
let g:deol#shell_history_path = '~/.zsh_history'
nnoremap <silent> <Leader>df :<C-u>Deol -split=floating<CR>
nnoremap <silent> <Leader>dv :<C-u>Deol -split=vertical<CR>
nnoremap <silent> <Leader>ds :<C-u>Deol -split=horizontal<CR>
nmap <silent> <Leader>bg <Plug>(deol_bg)

Plug 'chrisbra/csv.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rafcamlet/coc-nvim-lua'
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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

let g:airline_theme='tokyonight'
"let g:airline_theme='tokyonight'

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


Plug 'beikome/cosme.vim'

Plug 'joshdick/onedark.vim'
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
if (has("termguicolors"))
    set termguicolors
endif


Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"let g:mkdp_auto_close = 1
let g:mkdp_echo_preview_url = 1
let g:mkdp_open_ip = 'localhost'
let g:mkdp_port = '2851'
let g:mkdp_page_title = '「${name}」'
" 背景色が色でみえない
"let g:mkdp_highlight_css="/home/bookun/highlightjs/dracula.css"
"let g:mkdp_markdown_css="/usr/local/lib/node_modules/github-markdown-css/github-markdown.css"
" autocmd FileType markdown nnoremap <LEADER>p :MarkdownPreview<CR>


Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim'


Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1


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

" lua
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'preservim/nerdtree'
Plug 'ElPiloto/sidekick.nvim'
" To actually use sidekick!
nmap sr :call SideKickNoReload()<CR>

let g:sidekick_update_on_buf_write = 1
" List of which definition types to display:
" Example: 'function' tells sidekick to display any node found in a ts 'locals' query
" that is captured in `queries/$LANG/locals.scm` as '@definition.function'.
let g:sidekick_printable_def_types = ['function', 'class', 'type', 'module', 'parameter', 'method', 'field']
" Mapping from definition type to the icon displayed for that type in the outline window.
let g:sidekick_def_type_icons = {
\    'class': "\uf0e8",
\    'type': "\uf0e8",
\    'function': "\uf794",
\    'module': "\uf7fe",
\    'arc_component': "\uf6fe",
\    'sweep': "\uf7fd",
\    'parameter': "•",
\    'var': "v",
\    'method': "\uf794",
\    'field': "\uf6de",
\ }

" Indicates which definition types should have their line number displayed in the outline window.
let g:sidekick_line_num_def_types = {
\    'class': 1,
\    'type': 1,
\    'function': 1,
\    'module': 1,
\    'method': 1,
\ }

" What to display between definition and line number
let g:sidekick_line_num_separator = " "
" What to display to the left and right of the line number
let g:sidekick_line_num_left = "\ue0b2"
let g:sidekick_line_num_right = "\ue0b0"
" What to display before outer vs inner definitions
let g:sidekick_inner_node_icon = "\u251c\u2500\u25B8"
let g:sidekick_outer_node_icon = "\u2570\u2500\u25B8"
" What to display to left and right of def_type_icon
let g:sidekick_left_bracket = "\u27ea"
let g:sidekick_right_bracket = "\u27eb"

call plug#end()

colorscheme tokyonight
autocmd ColorScheme tokyonight highlight DiffAdd gui=NONE guibg=#618041 guifg=NONE
autocmd ColorScheme tokyonight highlight DiffDelete gui=NONE guibg=#803d49 guifg=NONE
autocmd ColorScheme tokyonight highlight DiffText ctermfg=NONE ctermbg=NONE guifg=NONE guibg=#3e5380

lua require('treesitter')
lua require('telescope')
lua require('nvim-trim')
lua require'colorizer'.setup()
