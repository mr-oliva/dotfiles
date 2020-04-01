inoremap <silent> jj <ESC>
nnoremap <silent> cp :set clipboard=unnamedplus<CR>
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

syntax on

tnoremap <C-[> <C-\><C-n>

"set termguicolors
let g:python3_host_prog = "$HOME/.anyenv/envs/pyenv/shims/python"
if has("autocmd")
    filetype plugin on

    filetype indent on
    autocmd FileType javascript setlocal et sw=2 sts=2 ts=2
    autocmd FileType vue setlocal et sw=2 sts=2 ts=2
    autocmd FileType cpp setlocal et sw=2 sts=2 ts=2
    autocmd FileType yaml setlocal et sw=2 sts=2 ts=2
endif

autocmd ColorScheme * highlight CocHighlightText guibg=Green ctermbg=11
"autocmd FileType !python highlight CocHighlightText guibg=Green ctermbg=11

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"let g:firenvim_config = {
"    \ 'localSettings': {
"        \ '.*': {
"            \ 'selector': 'textarea',
"            \ 'priority': 0,
"        \ },
"        \ 'github\.com': {
"            \ 'selector': 'textarea',
"            \ 'priority': 1,
"        \ },
"    \ }
"\ }

"let g:dont_write = v:false
"function! My_Write(timer) abort
"	let g:dont_write = v:false
"	write
"endfunction
"
"function! Delay_My_Write() abort
"	if g:dont_write
"		return
"	end
"	let g:dont_write = v:true
"	call timer_start(10000, 'My_Write')
"endfunction
"
"au TextChanged * ++nested call Delay_My_Write()
"au TextChangedI * ++nested call Delay_My_Write()
"
"augroup Firenvim
"  au BufEnter play.golang.org_*.txt set filetype=go
"  au BufEnter play.rust-lang.org_*.txt set filetype=rust
"  au BufEnter github.com_*.txt set filetype=markdown
"augroup END
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

"Plug 'pangloss/vim-javascript'

Plug 'mattn/vim-goimports'

Plug 'Shougo/deol.nvim'
let g:deol#shell_history_path = '~/.zsh_history'
nnoremap <silent> <Leader>df :<C-u>Deol -split=floating<CR>
nnoremap <silent> <Leader>dv :<C-u>Deol -split=vertical<CR>
nnoremap <silent> <Leader>ds :<C-u>Deol -split=horizontal<CR>
nmap <silent> <Leader>bg <Plug>(deol_bg)

Plug 'chrisbra/csv.vim'
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
command! -nargs=0 Format :call CocAction('format')
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> ft <Plug>(coc-format)
set signcolumn=yes


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
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


"Plug 'itchyny/lightline.vim'
"let g:lightline = {
"    \ 'colorscheme': 'nord',
"    \ }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_theme='onedark'
let g:airline_theme='hybrid'
"let g:airline_theme='behelit'
"let g:airline_theme='violet'
"let g:airline_theme='nord'
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
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

Plug 'w0rp/ale'

nnoremap <silent> <Leader>at :<C-u>ALEToggle<CR>
"let g:ale_completion_enabled = 0
"let g:ale_fix_on_save = 0
""let g:ale_disable_lsp = 1
""let g:ale_lint_on_text_changed = 'never'
""let g:ale_lint_on_enter = 1
""let g:ale_set_quickfix = 1
"let g:ale_echo_msg_warning_str = '🚬'
"let g:ale_echo_msg_error_str = '🔥'
"let g:ale_sign_warning = '🚬'
"let g:ale_sign_error = '🔥'
""let g:ale_sign_style_warning = '🚬'
""let g:ale_sign_style_error = '🔥'
""let g:ale_sign_column_always = 1
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_linters = {
"\   'go': ['golint'],
"\   'ruby': ['rubocop'],
"\   'vim': ['vint'],
"\   'php': ['phpcs'],
"\   'python': ['pylint'],
"\   'cpp': ['cppcheck'],
"\}
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'go': ['gofmt','goimports'],
"\   'ruby': ['rubocop'],
"\   'elm': ['elm-format'],
"\   'javascript': ['eslint'],
"\   'python': ['autopep8', 'yapf'],
"\   'rust': ['rustfmt'],
"\}
let g:ale_linters = {
\   'go': ['golint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
"let g:ale_statusline_format = ['🚬%d', '🔥%d', 'ok']
""let g:ale_php_phpcs_standard = 'PSR2'
""let g:ale_python_pylint_options = '--generate-members'
"""let g:ale_php_phpcs_use_global = 1
""let g:ale_c_cppcheck_executable = 'cppcheck'
""let g:ale_cpp_clang_options = "-std=c++14 -Wall -I/usr/local/eigen/"
""let g:ale_cpp_gcc_options = "-I/usr/local/eigen"
""let g:ale_echo_cursor=1
"
"
" for markdown
augroup ale_custom
  autocmd!
  autocmd FileType markdown let g:ale_fix_on_save = 0
augroup END

Plug 'dracula/vim', { 'as': 'dracula' }
let g:dracula_colorterm = 0

Plug 'sainnhe/sonokai'
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
"
Plug 'w0ng/vim-hybrid'
let g:hybrid_custom_term_colors = 1

Plug 'haishanh/night-owl.vim'

Plug 'arcticicestudio/nord-vim'

"
"Plug 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
"
Plug 'iCyMind/NeoSolarized'
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

"Plug 'aereal/vim-colors-japanesque'

Plug 'kristijanhusak/vim-hybrid-material'

Plug 'joshdick/onedark.vim'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
    set termguicolors
endif


Plug 'othree/yajs.vim', {'for': 'javascript'}

Plug 'majutsushi/tagbar'
nmap <silent>tg :TagbarToggle<CR>

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
"let g:mkdp_markdown_css="/home/bookun/node_modules/github-markdown-css/github-markdown.css"
" autocmd FileType markdown nnoremap <LEADER>p :MarkdownPreview<CR>

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/Ultisnips/']

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
nmap <silent> gs :GitGutterBufferToggle<CR>


" let g:gitgutter_override_sign_column_highlight = 1

Plug 'mattn/emmet-vim'

Plug 'simeji/winresizer'

Plug 'buoto/gotests-vim'

Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 111


Plug 'andymass/vim-matchup'
let g:loaded_matchit = 1
autocmd VimEnter,Colorscheme * :hi MatchWord ctermfg=red guifg=blue cterm=underline gui=underline

"Plug 'leafgarland/typescript-vim', {'for': 'typescript'}


Plug 'rhysd/git-messenger.vim'

let g:git_messenger_include_diff='current'
let g:git_messenger_always_into_popup=v:true

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

"Plug 'Shougo/deoplete.nvim'
"let g:deoplete#enable_at_startup = 1
"Plug 'lighttiger2505/deoplete-vim-lsp'

"Plug 'posva/vim-vue', { 'for': ['vue'] }

"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
""Plug 'mattn/vim-lsp-settings'
"setlocal omnifunc=lsp#complete
"let g:lsp_diagnostics_enabled = 1
"let g:lsp_signs_enabled = 1         " enable signs
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"let g:lsp_highlight_references_enabled = 1
""let g:lsp_log_verbose = 1
"let g:lsp_signs_error = {'text': '🔥'}
"let g:lsp_signs_warning = {'text': '🚬'}
"let g:lsp_virtual_text_enabled = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')
"if executable('gopls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'gopls',
"        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
"        \ 'whitelist': ['go'],
"        \ 'workspace_config': {'gopls': {
"        \       'completeUnimported': v:true,
"        \ }},
"        \ })
"    autocmd FileWritePre *.go "LspDocumentFormatSync<CR>"
"    nnoremap <silent> <Leader>fo :LspDocumentFormatSync<CR>
"endif
""if executable('ccls')
""   au User lsp_setup call lsp#register_server({
""      \ 'name': 'ccls',
""      \ 'cmd': {server_info->['ccls']},
""      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
""      \ 'initialization_options': {},
""      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
""      \ })
""endif
"if executable('clangd')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'clangd',
"        \ 'cmd': {server_info->['clangd', '-background-index']},
"        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"        \ })
"endif
"if executable('intelephense')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'intelephense',
"        \ 'cmd': {server_info->['node', expand('/usr/local/lib/node_modules/intelephense/lib/intelephense.js'), '--stdio']},
"        \ 'initialization_options': {"storagePath": "/tmp/intelephense"},
"        \ 'whitelist': ['php'],
"        \ 'workspace_config': { 'intelephense': {
"        \   'files.associations': ['*.php'],
"        \ }},
"        \ })
"endif
"if executable('rls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'rls',
"        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
"        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
"        \ 'whitelist': ['rust'],
"        \ })
"endif
"if executable('pyls')
" 	"pip install python-language-server
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ 'workspace_config': {'pyls': {
"        \   'plugins': {
"        \       'jedi_definition': {
"        \           'follow_imports': v:true,
"        \           'follow_builtin_imports': v:true
"        \       },
"        \       'pyls_mypy': {
"        \           'enabled': v:true
"        \       },
"        \   }
"        \ }}
"        \ })
"endif
"if executable('typescript-language-server')
"    au User lsp_setup call lsp#register_server({
"      \ 'name': 'javascript support using typescript-language-server',
"      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
"      \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
"      \ })
"endif
"if executable('vls')
"    augroup LspVls
"        au!
"        au User lsp_setup call lsp#register_server({
"            \ 'name': 'vue-language-server',
"            \ 'cmd': {server_info->['vls']},
"            \ 'whitelist': ['vue'],
"            \ 'initialization_options': {
"            \         'config': {
"            \             'html': {},
"            \              'vetur': {
"            \                  'validation': {}
"            \              }
"            \         }
"            \     }
"            \ })
"        au FileType vue setlocal omnifunc=lsp#complete
"    augroup end
"endif
"nmap <silent> gd :LspDefinition<CR>
"nmap <silent> gi :LspImplementation<CR>
"nnoremap <silent> K :LspHover<CR>
"setlocal signcolumn=yes

"Plug 'octol/vim-cpp-enhanced-highlight'
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1

call plug#end()


"color onedark
"color dracula
"color hybrid

"color japanesque
"color hybrid_material
color hybrid_reverse
"colorscheme sonokai
"color night-owl
"color nord
"colorscheme solarized
"colorscheme NeoSolarized



"augroup ondarkGroup
"    autocmd!
"    let s:white = {'gui': '#ABB2BF', 'cterm': '145', 'cterm16': '7'}
"    autocmd ColorScheme * call onedark#set_highlight("Normal", {'fg': s:white})
"augroup END

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


"colorscheme onedark
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
