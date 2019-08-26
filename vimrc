let mapleader = "\<Space>"
let s:is_nvim = has('nvim')
set t_Co=256


"remmaping different part
inoremap ùù <Esc>
map <F10> :tabp <CR>
map <F11> :tabedit
map <F12> :tabn <CR>
map <F6> :set paste <CR>
map <F5> :set nopaste <CR>
map <F1> :source ~/.vimrc <CR>
nnoremap <esc> :noh<CR>
nnoremap <esc> :noh<CR>
vmap <C-c> "+y

set showmatch
set relativenumber
set ic "ignore case for the search

"disable the scratch preview
set completeopt-=preview

"all the plugin
call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'https://github.com/%s.git'

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

"for nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "{{{
  nnoremap <silent> <F4> :NERDTreeToggle<CR>
"}}}

"deoplete core
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif


"autocomplete python
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'


"adding other file to the completion
Plug 'Shougo/context_filetype.vim'

" Track the engine.
Plug 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
"tentative of wp integration





"for the linter
Plug 'w0rp/ale'

"fzf only
Plug 'junegunn/fzf.vim'
Plug '~/.fzf'
Plug '/usr/local/opt/fzf'


"colorscheme and styel
Plug 'sainnhe/vim-color-forest-night'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

call plug#end()

"this is for prettier
"let g:prettier#exec_cmd_async = 1
"let g:prettier#config#jsx_bracket_same_line = 'true'

"set indentkeys-=0#
"filetype indent on
set number "would not show me the line I was on


"let g:ale_sign_column_always = 1
"this one is for the linter
let g:ale_lint_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters = {
	\'javascript': ['eslint'],
	\'python': ['flake8'],
	\}





"this one is for the fixer
let g:ale_linters_explicit = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier'],
      \ 'css': ['prettier'],
      \'python': ['black'],
      \}
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_fix_on_save = 1
autocmd FileType python nnoremap <buffer> <leader>p :ALEFix <ENTER>


"this is for the autocomplet
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete=1
" adding other filetype
if !exists('g:context_filetype#same_filetypes')
	let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes.scss = 'html,javascript.jsx,php'
let g:context_filetype#same_filetypes.css = 'html,javascript.jsx,php'

"adding ultisnips to deoplete
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])


"easy motion shortcut
nmap s <Plug>(easymotion-overwin-f2)

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

let g:fzf_history_dir = '~/.local/share/fzf-history'

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
augroup quick_group
  autocmd FileType html,javascript,php EmmetInstall
  "this is for the style
  autocmd FileType html set ts=2 sts=2 sw=2
  autocmd FileType php set ts=2 sts=2 sw=2
  autocmd FileType javascript set ts=2 sts=2 sw=2
  autocmd FileType javascript.jsx set ts=2 sts=2 sw=2
  autocmd FileType python set ts=4 sts=4 sw=4
  autocmd FileType scss setlocal ts=2 sts=2 sw=2 omnifunc=csscomplete#CompleteCSS
  autocmd FileType css setlocal ts=2 sts=2 sw=2 omnifunc=csscomplete#CompleteCSS
augroup END

inoremap <C-b> <C-x><C-o>
" tabs are evil and space should rule the world
set tabstop=2 shiftwidth=2 expandtab

"this is one is to  learn the real command


colorscheme forest-night
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='deus'
let g:indentLine_color_term = 'LightGrey'
autocmd FileType javascript IndentLinesReset
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

set statusline=%{LinterStatus()}

"changing indent color
