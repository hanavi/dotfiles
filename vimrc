" Set up a better encoding
set encoding=utf-8
set fileencoding=utf-8
syntax on
let mapleader = "\<Space>"

"------------------------------------------------------------------------------
" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" Lightweight Markup Languages
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'christoomey/vim-quicklink'
" Plug 'mattn/webapi-vim'
" Plug 'christoomey/vim-quicklink'

" This helps deal with some syntax stuff
Plug 'vim-syntastic/syntastic'

" Fancy Bar at the bottom of the screen
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Python
" Plug 'davidhalter/jedi-vim'
Plug 'tmhedberg/SimpylFold'
" Plug 'nvie/vim-flake8'
" Plug 'hynek/vim-python-pep8-indent'

" Tab formatting stuff
Plug 'godlygeek/tabular'

" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

" Searching
" Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

" Generic
Plug 'ervandew/supertab'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'

" Add stuff around blocks of text
Plug 'tpope/vim-surround'

" Fancy colors
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

" I don't know what this does but some kind of highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Extra panels to improve productivity
" Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-vinegar'

" Harmode... just for the fun of it...
" Plug 'takac/vim-hardtime'


" Return to last edit position
Plug 'farmergreg/vim-lastplace'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plug 'ycm-core/YouCompleteMe'
call plug#end()

"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Vim jedi settings
let g:jedi#smart_auto_mappings = 1
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Ctrl-p settings
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Syntastic settings
let g:syntastic_python_checkers = ['pylama']
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": [] }

let g:syntastic_always_populate_loc_list = 1
let python_highlight_all=1

" Run linter
nnoremap <silent> <leader>l :SyntasticCheck<CR>
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Hartime settings
" Turn on by default
let g:hardtime_default_on = 0

" allow +/-
let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:hardtime_allow_different_key = 1

" Toggle Hardmode
nnoremap <leader>h <Esc>:call HardTimeToggle()<CR>
" nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" SuperTab settings
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" UltiSnips settings
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips'
" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nnoremap <silent> <leader>u :UltiSnipsEdit<CR>
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Airline settings
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Set the airline theme
let g:airline_theme='dark'
" let g:airline_theme='jet'
let g:airline_powerline_fonts = 0

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.dirty='⚡'

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'


"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Netrw settings
"let g:netrw_browsex_viewer = 'firefox'
let g:netrw_liststyle=3
let g:netrw_http_cmd="firefox"
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" SimpylFold settings
let g:SimpylFold_docstring_preview=1
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" NERDTree Settings
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Toggle NERDTree
nnoremap <leader>N :NERDTreeToggle<CR>
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" General Settings

inoremap jk <esc>

" Comment settings
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

" Color Scheme
" let g:solarized_diffmode="high"
let g:solarized_termcolors=256
let g:solarized_degraded=2
let g:solarized_termtrans=1
"
if has('gui_running')
    set lines=50 columns=100
    colorscheme gruvbox
    "colorscheme ron
    "colorscheme solarized
    set background=dark
else
    "colorscheme zenburn
    colorscheme gruvbox
    "colorscheme ron
    "colorscheme solarized
    set background=dark
endif

" Coloring stuff
hi MyWarn cterm=inverse,bold ctermfg=yellow
hi MyError cterm=inverse,bold ctermfg=red

" Allow moving around buffers w/o saving
set hidden

" Set up the line numbering
set nu rnu

" Cursor placement
set scrolloff=5

set matchpairs+=<:>
set indentkeys-=:

set backspace=indent,eol,start
set fillchars=vert:│
set list listchars=tab:→\ ,trail:·,precedes:«,extends:»
set wildmenu wildmode=longest,list,full
" set completeopt=menuone,longest
set complete=.,w,b,u,t,i,kspell

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
set splitright splitbelow
set completeopt-=preview
set path+=**

au FileType tex set spell


" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
" inoremap ( ()<ESC>i
" inoremap { {}<ESC>i
" inoremap [ []<ESC>i

" Quick mappings
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>p :set paste!<CR>

" Enable folding
"set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" call togglebg#map("<F5>")

" run current python script
" nnoremap <leader>x :!python %

" Set that fancy color lign at the end of 80 char
set colorcolumn=+1
set colorcolumn=80,100
" hi ColorColumn guibg=darkred ctermbg=darkred
" call matchadd('MyWarn', '\%80v', 100)
" call matchadd('MyError', '\%100v', 100)
" call matchadd('MyWarn', '[^\s],[^ ]', 100)


" Error console
nmap <silent> <leader>lo :lopen<CR>
nmap <silent> <leader>lc :lclose<CR>
nmap <silent> <leader>ll :ll<CR>
nmap <silent> <leader>ln :lnext<CR>
nmap <silent> <leader>lp :lprev<CR>

" Jump to marker(<++>) delete and switch to insert mode
inoremap \\ <Esc>/<++><Enter>"_c4l
vnoremap \\ <Esc>/<++><Enter>"_c4l
nnoremap \\ <Esc>/<++><Enter>"_c4l

" Search and replace word under cursor
nnoremap <leader>w :%s/\<<C-r><C-w>\>/

" Split window resizing
map <esc>[1;5D <c-Left>
map <esc>[1;5C <c-Right>
map <esc>[1;5A <c-Up>
map <esc>[1;5B <c-Down>

nmap <silent> <c-left> :vert resize -3<cr>
nmap <silent> <c-right> :vert resize +3<cr>
nmap <silent> <c-up> :resize +3<cr>
nmap <silent> <c-down> :resize -3<cr>

noremap <silent> <c-h> <c-w>h
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" General functions

" Strip trailing whitespace (and save cursor position) when saving files
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Stolen from http://vim.wikia.com/wiki/Insert_current_date_or_time
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! SetCreatedTime()
  let save_cursor = getpos(".")
  let n = min([30, line("$")])
  keepjumps exe '1,' . n . 's#^\(.\{,10}Date Created: \).*#\1' .
        \ strftime('%F') . '#e'
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfun

function! FixCommas()
  let save_cursor = getpos(".")
  :silent! %s/,/, /g
  :silent! %s/, */, /g
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfunction

nnoremap <leader>fc :call FixCommas()<CR>

" Might only work in unix
function! StartTimeStamp()
  :normal! 0I**StartTime**
  :r! date
  :normal! kJo
endfunction
nnoremap <leader>S :call StartTimeStamp()<CR>

function! EndTimeStamp()
  :normal! 0I**EndTime**
  :r! date
  :normal! kJo
endfunction
nnoremap <leader>E :call EndTimeStamp()<CR>

function! Lipsum()
  :r! lipsum
endfunction

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

function! BlockMove()
  :execute ":normal! Imv \"\<esc>A\"\<esc>0Wv$hy$A \<esc>080lp"
endfunction
vnoremap <leader>mb :call BlockMove()<CR>

function! AddImportFrom()
  let save_cursor = getpos(".")
  let save_cursor[1] = line('.') + 1
  :norm G<CR>
  call search('import', 'b')
  let cmd = input("from ", "")
  execute ':norm ofrom ' . cmd
  call setpos('.', save_cursor )
endfunction
nnoremap <silent> <leader>if :call AddImportFrom()<CR>

function! AddImport()
  let save_cursor = getpos(".")
  let save_cursor[1] = line('.') + 1
  :norm G<CR>
  call search('import', 'b')
  let cmd = input("import ", "")
  execute ':norm oimport ' . cmd
  call setpos('.', save_cursor )
endfunction
nnoremap <silent> <leader>im :call AddImport()<CR>

" Update the filename in the header
function! SetFileName()
  let fn=expand("%:t")
  let save_cursor = getpos(".")
  let n = min([30, line("$")])
  keepjumps exe '1,' . n . 's#^\(.\{,10}Filename: \).*#\1' .
        \ fn . '#e'
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfun
nmap <silent> <leader>f :call SetFileName()<CR>

" Update the Last Updated info in the header
function! SetUpdatedTime()
  let save_cursor = getpos(".")
  let n = min([30, line("$")])
  keepjumps exe '1,' . n . 's#^\(.\{,10}Last Updated: \).*#\1' .
        \ strftime('%F') . '#e'
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfun
" nmap <silent> <leader>u :call SetUpdatedTime()<CR>

" Generate an incrementing string of padded numbers surrounded by text
function! MyList(count, ...)
    let start = get(a:, 1, "")
    let end = get(a:, 2, "")
    let pad = get(a:, 3, 0)

    let c = 0
    while c < a:count
        let cout = c
        while len(cout) < pad
            let cout = 0 . cout
        endwhile
        let output = start . cout . end
        let stat = append(line('.') + c, output)
        let c += 1
    endwhile
endfun

"------------------------------------------------------------------------------
" Buffer setup settings
au BufWritePre *.py :call SetUpdatedTime()
au BufWritePre *.c++ :call SetUpdatedTime()
au BufWritePre *.cpp :call SetUpdatedTime()

augroup new_python_file
  autocmd!
  au BufNewFile *.py 0r ~/.vim/templates/skeleton.py
  au BufNewFile *.py :call SetFileName()
  au BufNewFile *.py :call SetCreatedTime()
  au BufNewFile *.py :call SetUpdatedTime()
augroup END

augroup new_arduino_file
  autocmd!
  au BufNewfile *.ino 0r ~/.vim/templates/skeleton.ino
augroup END

augroup new_c++_file
  autocmd!
  au BufNewfile *.h 0r ~/.vim/templates/skeleton.h
  au BufNewfile *.c++ 0r ~/.vim/templates/skeleton.cpp
  au BufNewfile *.cpp 0r ~/.vim/templates/skeleton.cpp

  au BufNewFile *.h :call SetFileName()
  au BufNewFile *.c++ :call SetFileName()
  au BufNewFile *.cpp :call SetFileName()

  au BufNewFile *.h :call SetCreatedTime()
  au BufNewFile *.c++ :call SetCreatedTime()
  au BufNewFile *.cpp :call SetCreatedTime()
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

au BufNewFile Dropbox/logs/*.md 0r ~/.vim/templates/logs.md
au BufNewFile Dropbox/logs/*.md :norm 3jA
au BufNewFile Dropbox/logs/*.md :r !date "+\%F"
au BufNewFile Dropbox/logs/*.md :norm kJG

au BufRead,BufNewFile *.sh set softtabstop=2

nnoremap <leader>ns :r ~/.vim/templates/beamer/slide.txt<CR>

"------------------------------------------------------------------------------
" random (?)
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif



