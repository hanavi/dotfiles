" Plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

" Lightweight Markup Languages
Plug 'vimwiki/vimwiki'

" This helps deal with some syntax stuff
Plug 'vim-syntastic/syntastic'

" Fancy Bar at the bottom of the screen
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tab formatting stuff
Plug 'godlygeek/tabular'

" Git
Plug 'tpope/vim-fugitive'

" Generic
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'

" Do I need this?
Plug 'tpope/vim-dispatch'

" Add stuff around blocks of text
Plug 'tpope/vim-surround'

" Fancy colors
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

" Extra panels to improve productivity
Plug 'majutsushi/tagbar'

" Return to last edit position
Plug 'farmergreg/vim-lastplace'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Searching
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

" Python
Plug 'davidhalter/jedi-vim'

call plug#end()

" Fix airline bug
let g:airline_extensions = [
    \'branch',
    \'coc',
    \'ctrlp',
    \'ctrlspace',
    \'cursormode',
    \'fugitiveline',
    \'keymap',
    \'languageclient',
    \'netrw',
    \'po',
    \'quickfix',
    \'searchcount',
    \'tabline',
    \'tagbar',
    \'term',
    \'vimtex',
    \'virtualenv',
    \'whitespace',
    \'wordcount' ]

" UltiSnips settings
" For some reason these have to be loaded earlier rather than later (ie in
" after)
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips'

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
