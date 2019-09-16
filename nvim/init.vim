inoremap <silent> jj <ESC>
nnoremap <silent> cp :set clipboard=unnamedplus<CR><CR>
set noswapfile
set title
set number
set tabstop=4
set expandtab
set shiftwidth=4
set mouse=a
set termguicolors
"let g:python3_host_prog = expand('~/.pyenv/versions/3.6.8/bin/python')
if has("autocmd")
    filetype plugin on

    filetype indent on
    autocmd FileType javascript setlocal et sw=2 sts=2 ts=2
    autocmd FileType cpp setlocal et sw=2 sts=2 ts=2
    autocmd FileType yaml setlocal et sw=2 sts=2 ts=2
endif


call plug#begin('~/.local/share/nvim/plugged')


Plug 'Shougo/deol.nvim'
let g:deol#shell_history_path = '~/.zsh_history'
nnoremap <silent> <Leader>df :<C-u>Deol -split=floating<CR>
nnoremap <silent> <Leader>dv :<C-u>Deol -split=vertical<CR>
nnoremap <silent> <Leader>dh :<C-u>Deol -split=horizontal<CR>


" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> ft <Plug>(coc-format)

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    if coc#util#has_float()
        pc
    else
        call CocAction('doHover')
    endif
  endif
endfunction

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,go setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='deus'
" ale
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#ale#error_symbol = '🔥'
"let g:airline#extensions#ale#warning_symbol = '🚬'
"
" coc側でdiagnosticする場合は必要
let g:airline_section_info = '%{airline#util#wrap(airline#extensions#coc#get_info(),0)}'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_section_hint = '%{airline#util#wrap(airline#extensions#coc#get_hint(),0)}'

let g:airline#extensions#coc#error_symbol = '🔥'
let g:airline#extensions#coc#warning_symbol = '🚬'
"let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

"Plug 'w0rp/ale'
"
"nnoremap <silent> <Leader>at :<C-u>ALEToggle<CR>
"let g:ale_completion_enabled = 0
"let g:ale_fix_on_save = 1
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"let g:ale_set_quickfix = 1
"let g:ale_echo_msg_warning_str = '🚬'
"let g:ale_echo_msg_error_str = '🔥'
"let g:ale_sign_warning = '🚬'
"let g:ale_sign_error = '🔥'
"let g:ale_sign_style_warning = '🚬'
"let g:ale_sign_style_error = '🔥'
"let g:ale_sign_column_always = 1
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""let g:ale_linters = {
""\   'go': ['golint'],
""\   'ruby': ['rubocop'],
""\   'vim': ['vint'],
""\   'php': ['phpcs'],
""\   'python': ['pylint'],
""\   'cpp': ['cppcheck'],
""\}
""let g:ale_fixers = {
""\   '*': ['remove_trailing_lines', 'trim_whitespace'],
""\   'go': ['gofmt','goimports'],
""\   'ruby': ['rubocop'],
""\   'elm': ['elm-format'],
""\   'javascript': ['eslint'],
""\   'python': ['autopep8', 'yapf'],
""\}
"let g:ale_statusline_format = ['🚬%d', '🔥%d', 'ok']
"let g:ale_php_phpcs_standard = 'PSR2'
"let g:ale_python_pylint_options = '--generate-members'
""let g:ale_php_phpcs_use_global = 1
"let g:ale_c_cppcheck_executable = 'cppcheck'
"let g:ale_cpp_clang_options = "-std=c++14 -Wall -I/usr/local/eigen/"
"let g:ale_cpp_gcc_options = "-I/usr/local/eigen"
"let g:ale_echo_cursor=1


"" for markdown
"augroup ale_custom
"  autocmd!
"  autocmd FileType markdown let g:ale_fix_on_save = 0
"augroup END

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'joshdick/onedark.vim'

Plug 'othree/yajs.vim', {'for': 'javascript'}

Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" let g:mkdp_auto_close = 0
" let g:mkdp_echo_preview_url = 1 
"let g:mkdp_open_ip = system("ip a show eth0 | grep inet | grep -v inet6 | awk '{print $2}' | awk -F'/' '{print $1}'")
" let g:mkdp_open_ip = "172.17.82.182"
" let g:mkdp_port = '8080'
" 背景色が色でみえない
"let g:mkdp_highlight_css="/home/bookun/highlightjs/dracula.css"
"let g:mkdp_markdown_css="/home/bookun/node_modules/github-markdown-css/github-markdown.css"
" autocmd FileType markdown nnoremap <LEADER>p :MarkdownPreview<CR>

Plug 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim'

Plug 'simeji/winresizer'

Plug 'buoto/gotests-vim'

Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 111


Plug 'andymass/vim-matchup'
let g:loaded_matchit = 1
autocmd VimEnter,Colorscheme * :hi MatchWord ctermfg=red guifg=blue cterm=underline gui=underline

Plug 'leafgarland/typescript-vim', {'for': 'typescript'}

"Plug 'posva/vim-vue'

Plug 'rhysd/git-messenger.vim'

let g:git_messenger_include_diff='current'
let g:git_messenger_always_into_popup=v:true

"Plug 'skanehira/translate.vim'
"
" "翻訳元言語
" let g:translate_source = "en"
"
" " 翻訳先言語
" let g:translate_target = "ja"
"
" " 翻訳結果ウィンドウのサイズ
" let g:translate_winsize = 10


Plug 'segeljakt/vim-silicon'
let g:silicon = {
      \ 'theme':              'OneHalfDark',
      \ 'font':                  'Consolas',
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


"color onedark
"color dracula

syntax on

augroup ondarkGroup
    autocmd!
    let s:white = {'gui': '#ABB2BF', 'cterm': '145', 'cterm16': '7'}
    autocmd ColorScheme * call onedark#set_highlight("Normal", {'fg': s:white})
augroup END

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<CR>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>

colorscheme onedark
