" Set up a better encoding
set encoding=utf-8

" Plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Lightweight Markup Languages
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'christoomey/vim-quicklink'
Plug 'mattn/webapi-vim'
" Plug 'christoomey/vim-quicklink'

" This helps deal with some syntax stuff
Plug 'vim-syntastic/syntastic'

" Fancy Bar at the bottom of the screen
Plug 'vim-airline/vim-airline'

" Python
Plug 'davidhalter/jedi-vim'
" Plug 'tmhedberg/SimpylFold'
" Plug 'nvie/vim-flake8'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'hynek/vim-python-pep8-indent'

" Javascript
Plug 'jelera/vim-javascript-syntax'

" Puppet (Why do I have puppet?)
Plug 'rodjek/vim-puppet'

" Tab formatting stuff
Plug 'godlygeek/tabular'

" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box'

" Git I think
Plug 'tpope/vim-fugitive'

" Searching
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

" Generic
Plug 'ervandew/supertab'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" Add stuff around blocks of text
Plug 'tpope/vim-surround'

" Fancy colors
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

" I don't know what this does but some kind of highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Extra panels to improve productivity
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

" Harmode... just for the fun of it...
Plug 'wikitopian/hardmode'


" Return to last edit position
Plug 'farmergreg/vim-lastplace'

call plug#end()
"------------------------------------------------------------------------------
let mapleader = "\<Space>"

let g:syntastic_python_checkers = ['pylama']
" systastic settings
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": [] }

nnoremap <silent> <leader>l :SyntasticCheck<CR>

"--Color Scheme----------------------------------------------------------------
let g:solarized_diffmode="high"
let g:solarized_termcolors=256
"let g:solarized_degraded=0
if has('gui_running')
    set lines=50 columns=100
    colorscheme solarized
    set background=dark
else
    "colorscheme zenburn
    colorscheme gruvbox
    "colorscheme solarized
    set background=dark
endif

" Set that fancy color lign at the end of 80 char
"set colorcolumn=+1
set colorcolumn=80
hi ColorColumn guibg=darkred ctermbg=darkred
"------------------------------------------------------------------------------

" I don't remember what this does...
set hidden

" Enable the mouse
" set mouse=a

" Set up the line numbering
"set number
set nu rnu

" Cursor placement
set scrolloff=5

set backspace=indent,eol,start
set fillchars=vert:│
set list listchars=tab:→\ ,trail:·,precedes:«,extends:»
set wildmenu wildmode=longest,list,full
set completeopt=menuone,longest


" Strip trailing whitespace (and save cursor position) when saving files
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

augroup new_python_file
  autocmd!
  au BufNewFile *.py 0r ~/.vim/templates/skeleton.py
augroup END

augroup new_shell_file
  autocmd!
  au BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  au BufNewFile *.sh :norm 2j
augroup END


augroup dropbox_logs
  autocmd!
  au BufNewFile Dropbox/logs/*.md 0r ~/.vim/templates/logs.md
  au BufNewFile Dropbox/logs/*.md :norm 3jA
  au BufNewFile Dropbox/logs/*.md :r !date "+\%F"
  au BufNewFile Dropbox/logs/*.md :norm kJG
augroup END


"au FileType *.tex nmap <leader>k :!make<CR>
nnoremap <leader>mk :!make<CR>


" Original
" set textwidth=79
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cursorline
set fileformat=unix
set autoindent
set hlsearch

syntax on

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"set tags=./tags;/

"airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"let g:netrw_browsex_viewer = 'firefox'

" Enable folding
"set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

call togglebg#map("<F5>")
" NERDTree Settings
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" This is much faster than the default on OSX (and better?)
let g:syntastic_python_checkers = ['pylama']


let python_highlight_all=1

function! BlockMove()
  :execute ":normal! Imv \"\<esc>A\"\<esc>0Wv$hy$A \<esc>080lp"
endfunction
vnoremap <leader>mb :call BlockMove()<CR>

function! FixCommas()
  :silent! %s/,/, /g
  :silent! %s/, */, /g
endfunction

nnoremap <leader>fc :call FixCommas()<CR>

function! StartTimeStamp()
  :normal! 0I**StartTime**
  :r! date
  :normal! kJo
endfunction

function! EndTimeStamp()
  :normal! 0I**EndTime**
  :r! date
  :normal! kJo
endfunction

nnoremap <leader>s :call StartTimeStamp()<CR>
nnoremap <leader>e :call EndTimeStamp()<CR>

function! Lipsum()
  :r! lipsum
endfunction

nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
nnoremap <leader>ns :r ~/.vim/templates/beamer/slide.txt<CR>

inoremap jk <esc>


function! GetArgs()
  ":normal mayiw/def "f(v/)y'ag_p
  :normal maK2jf(v/)y:bdg_p
endfunction

nnoremap <silent> <leader>ff :call GetArgs()<CR>


function! SplitArgs()
  :normal! yi)
  let c = len(split(@"))
  :normal! F(wi
  let i = 1
  while i < c
    :normal! f,wi
    let i += 1
  endwhile
  :normal! f)i
endfunction

nnoremap <silent> <leader>fs :call SplitArgs()<CR>


function! ListToDictAlt()
  :normal! yi)
  let c = len(split(@"))
  :normal! F(r{wi
  execute ":normal! wyiwea = \"\"\"\<esc>f,a\<CR>"
  let i = 0
  while i < c
    execute ":normal! wyiwea = \"\"\"\<esc>f,a\<CR>"
    let i += 1
  endwhile
  execute ":normal! f)i\<CR>\<esc>"
  :normal <<<<r}
endfunction

function! ListToDict()
  :normal! yi)
  let c = len(split(@"))
  :normal! F(r{wi
  let i = 0
  while i < c
    execute ":normal! wyiwi\"\<esc>ea\": \"\<esc>f,a\<CR>"
    let i += 1
  endwhile
  execute ":normal! f)i\<CR>\<esc>"
  :normal! <<<<r}
endfunction

nnoremap <silent> <leader>fd :call ListToDict()<CR>


" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
