-- print('loading plugins')

-- Load vim-plug

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Lightweight Markup Languages
Plug 'vimwiki/vimwiki'

-- This helps deal with some syntax stuff
Plug 'dense-analysis/ale'

-- Fancy Bar at the bottom of the screen
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Tab formatting stuff
Plug 'godlygeek/tabular'

Plug 'lukas-reineke/indent-blankline.nvim'

-- Git
Plug 'tpope/vim-fugitive'

-- Generic
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'

-- Do I need this?
Plug 'tpope/vim-dispatch'

-- Add stuff around blocks of text
Plug 'tpope/vim-surround'

-- Fancy colors
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

-- Extra panels to improve productivity (meh?)
Plug 'majutsushi/tagbar'

-- Return to last edit position
Plug 'farmergreg/vim-lastplace'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

-- Searching
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

-- Old...
-- Plug 'takac/vim-hardtime'
-- Plug 'ycm-core/YouCompleteMe'
-- Plug 'octol/vim-cpp-enhanced-highlight'
-- Plug 'kien/ctrlp.vim'
-- Plug 'vim-pandoc/vim-pandoc'
-- Plug 'vim-pandoc/vim-pandoc-syntax'
-- Plug 'mattn/webapi-vim'
-- Plug 'christoomey/vim-quicklink'
-- Plug 'vim-syntastic/syntastic'
-- Plug 'davidhalter/jedi-vim'
-- Plug 'tmhedberg/SimpylFold'
-- Plug 'nvie/vim-flake8'
-- Plug 'hynek/vim-python-pep8-indent'
-- Plug 'LaTeX-Box-Team/LaTeX-Box'
-- Plug 'scrooloose/nerdtree'

vim.call('plug#end')

-- UltiSnips triggering
vim.g.UltiSnipsExpandTrigger = "<c-j>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
