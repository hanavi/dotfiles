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

Plug 'davidhalter/jedi-vim'

-- Plug 'ray-x/go.nvim'
Plug 'fatih/vim-go'
Plug 'crispgm/nvim-go'
Plug 'rcarriga/nvim-notify'
Plug 'neovim/nvim-lspconfig'

vim.call('plug#end')

vim.g["airline_extensions"] = {
    'ale', 'branch', 'coc', 'ctrlp', 'ctrlspace', 'cursormode', 'fugitiveline',
    'keymap', 'languageclient', 'netrw', 'nvimlsp', 'po', 'quickfix',
    'searchcount', 'tabline', 'tagbar', 'term', 'vimtex', 'virtualenv',
    'whitespace', 'wordcount'
}

-- Airline settings
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
vim.g["airline_theme"] = 'dark'

if os.getenv("DISABLE_POWERLINE_FONTS") == "1" then
    vim.g["airline_powerline_fonts"] = 0
else
    vim.g["airline_powerline_fonts"] = 1
end

-- UltiSnips triggering
vim.g.UltiSnipsExpandTrigger = "<c-j>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
