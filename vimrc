let mapleader = "\<Space>"
let s:is_nvim = has('nvim')
set t_Co=256

"remmaping different part
inoremap '' <Esc> :noh <CR>
inoremap ,o <C-x><C-l>
nnoremap cn :cnext <CR>

inoremap ùw <Esc> :update<cr>
noremap ww <C-w>w
set splitright
noremap fs :FzfAg <CR>
map ts :vsplit 
nmap tp :tabp <CR>
nmap te :tabedit
nmap tn :tabn <CR>
nnoremap <Esc> :noh<CR>
vmap <C-c> "+y

set showmatch
set relativenumber
set ic "ignore case for the search


" search and replace on dot
function! Search_and_replace()
  let word = expand('<cword>')
  let @/ = word
endfunction
nnoremap rr :call Search_and_replace() <CR> cgn


"disable the scratch preview
set completeopt-=preview

" Nerdcommenter keep spacing 
let g:NERDDefaultAlign = 'start'

"all the plugin
call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'https://github.com/%s.git'

Plug 'aserebryakov/vim-todo-lists'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'npm install',   'for': [
    \ 'javascript',
    \ 'css',
    \ 'jsx',
    \ 'jsx',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'php',
    \ 'html', ] }

"emmet & for jsx
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'jsx', 'html', 'css', 'php'] }
Plug 'maxmellon/vim-jsx-pretty'


"for nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "{{{
  nnoremap <silent> <F4> :NERDTreeToggle %<CR>
"}}}

" Track the engine.
Plug 'SirVer/ultisnips'

"for the linter
Plug 'w0rp/ale'

"fzf only
Plug 'junegunn/fzf.vim', {'commit': '23dda8602f138a9d75dd03803a79733ee783e356'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }

Plug '~/.fzf'
Plug '/usr/local/opt/fzf'


"colorscheme and styel
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

"git blame
Plug 'zivyangll/git-blame.vim'


" Autocomplete " Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlightingcall plug#end()

call plug#end()


" todo 
let g:VimTodoListsDatesEnabled = 1

"this is for prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#config#jsx_bracket_same_line = 'true'

set number "would not show me the line I was on


"let g:ale_sign_column_always = 1
"this one is for the linter
let g:ale_lint_on_save = 1
let g:ale_sign_error = '-!'
let g:ale_sign_warning = '--'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters = {
  \'javascript': ['eslint'],
  \ 'python': ['flake8', 'pylint'],
  \'cpp': ['clang']
  \}
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_python_flake8_options = '--ignore=E701'

"this one is for the fixer
let g:ale_linters_explicit = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'php': ['phpcbf', 'php_cs_fixer'],
      \ 'javascript': ['prettier'],
      \ 'css': ['prettier'],
      \'python': [ 'autopep8', 'isort'],
	  \'cpp': ['clang-format']
      \}
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_fix_on_save = 0
let g:ale_python_pep8_options = '--ignore=E501'
let g:ale_python_pep8_options = '--ignore=E701'
let g:ale_list_window_size = 5

"easy motion shortcut
nmap ss <Plug>(easymotion-overwin-f2)
" prettier
nnoremap <buffer> <leader>p :Prettier <CR>

"all this is for fzf theme and shortcut
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }


let g:fzf_layout = { 'down': '~40%' }

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"let g:fzf_history_dir = '~/.local/share/fzf-history'

"ememt config
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
            \  'php' : {
            \    'extends' : 'html',
            \  },
            \  'javascript' : {
            \      'extends': 'jsx',
            \      'attribute_name': {'for': 'htmlFor', 'class': 'className'},
            \      'quote_char': "'",
            \  },
  \}


"ultisnips
let g:UltiSnipsSnippetDirectories = ['custom-snippets', 'UltiSnips']


"grouping to try if faster

set indentkeys-=0#
filetype off
"filetype on
syntax on 
filetype plugin on
filetype indent on
"set tabstop=2 shiftwidth=2 expandtab
augroup quick_group
  autocmd!
  autocmd FileType html,javascript,php EmmetInstall
  "this is for the style
  autocmd filetype html set ts=2 sts=2 sw=2
  autocmd filetype php set ts=2 sts=2 sw=2
  "
  autocmd filetype scss setlocal ts=2 sts=2 sw=2
  autocmd filetype css setlocal ts=2 sts=2 sw=2 
  "
  "autocmd filetype javascript set ts=2 sts=2 sw=2
  "autocmd filetype javascript.jsx set ts=2 sts=2 sw=2
  autocmd filetype javascript set ts=2 sts=2 sw=2 tabstop=2 shiftwidth=2 expandtab
  autocmd filetype javascript.jsx set ts=2 sts=2 sw=2 tabstop=2 shiftwidth=2 expandtab
  autocmd filetype javascript setlocal omnifunc=tern#complete
  autocmd filetype json setlocal conceallevel=0 
  "
  autocmd filetype python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
  autocmd filetype cpp setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
  "
  autocmd filetype python nnoremap <buffer> <leader>p :ALEFix <CR> 
  autocmd filetype cpp nnoremap <buffer> <leader>p :ALEFix <CR> 
  
  autocmd filetype yaml setlocal omnifunc=tern#complete
  autocmd bufwritepost * execute ':retab'
  autocmd FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR> 
  autocmd FileType json noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>
augroup END

""""""""" ALECOMMENT
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='tender'
let g:indentLine_color_term = 'LightGrey'
"ale and airline
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
" Theme
set bg=dark
colorscheme gruvbox
let g:indentLine_color_term = 'LightGrey'
set statusline=%{LinterStatus()}
set statusline^=%{coc#status()}

"
" Coc settings
" " Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

