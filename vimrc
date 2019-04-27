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

set relativenumber
set ic "ignore case for the search

"disable the scratch preview 
set completeopt-=preview

"all the plugin
call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'https://github.com/%s.git'

Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

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


"for the linter
Plug 'w0rp/ale'

"fzf only
Plug 'junegunn/fzf.vim'
Plug '~/.fzf'
Plug '/usr/local/opt/fzf'


Plug 'sainnhe/vim-color-forest-night'

call plug#end()

"this is for prettier
let g:prettier#exec_cmd_async = 1

"this one is for the linter
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '>e'
let g:ale_sign_warning = '>w'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
"let g:ale_fixers = { 
	"\'javascript': ['eslint'],
	"\'python': ['autopep8'],
	"\}

let g:ale_linters = { 
	\'javascript': ['eslint'],
	\'python': ['flake8'],
	\}


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
noremap <expr><TAB>  !pumvisible() ? emmet#expandAbbrIntelligent("\<tab>") : "\<TAB>"
let g:user_emmet_mode='n' 
let g:user_emmet_settings = {
            \  'php' : {
            \    'extends' : 'html',
            \  },
            \  'javascript' : {
            \      'extends': 'jsx',
            \      'quote_char': "'",
            \  },
  \}

autocmd FileType html,javascript.jsx,php EmmetInstall

"ultisnips 
let g:UltiSnipsSnippetDirectories = ['custom-snippets', 'UltiSnips']


"this is for the style
autocmd FileType html set ts=2 sts=2 sw=2
autocmd FileType php set ts=2 sts=2 sw=2
autocmd FileType javascript set ts=2 sts=2 sw=2
autocmd FileType javascript.jsx set ts=2 sts=2 sw=2
autocmd FileType python set ts=4 sts=4 sw=4
autocmd FileType scss setlocal ts=2 sts=2 sw=2 omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal ts=2 sts=2 sw=2 omnifunc=csscomplete#CompleteCSS
inoremap <C-b> <C-x><C-o>
" tabs are evil and space should rule the world
set tabstop=2 shiftwidth=2 expandtab

"this is one is to  learn the real command


colorscheme forest-night
