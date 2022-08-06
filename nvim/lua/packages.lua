-- Load vim-plug

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Lightweight Markup Languages
-- Plug 'vim-pandoc/vim-pandoc'
-- Plug 'vim-pandoc/vim-pandoc-syntax'
-- Plug 'mattn/webapi-vim'
-- Plug 'christoomey/vim-quicklink'
Plug 'vimwiki/vimwiki'

-- This helps deal with some syntax stuff
Plug 'vim-syntastic/syntastic'

-- Fancy Bar at the bottom of the screen
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Python
-- Plug 'davidhalter/jedi-vim'
-- Plug 'tmhedberg/SimpylFold'
-- Plug 'nvie/vim-flake8'
-- Plug 'hynek/vim-python-pep8-indent'

-- Tab formatting stuff
-- Plug 'godlygeek/tabular'

-- LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box'

-- Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

-- Searching
-- Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

-- Generic
Plug 'ervandew/supertab'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'

-- Add stuff around blocks of text
Plug 'tpope/vim-surround'

-- Fancy colors
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

-- I don't know what this does but some kind of highlighting
-- Plug 'octol/vim-cpp-enhanced-highlight'

-- Extra panels to improve productivity
-- Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-vinegar'

-- Harmode... just for the fun of it...
-- Plug 'takac/vim-hardtime'

-- Return to last edit position
Plug 'farmergreg/vim-lastplace'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

-- Plug 'ycm-core/YouCompleteMe'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

vim.call('plug#end')


local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = {"c", "python", "lua", "bash", "latex" },
    -- ensure_installed = {"maintained"},
    highlight = { -- enable highlighting
        enable = true,
    },
    indent = {
        enable = true, -- default is disabled anyways
    }
}

-- Ctrl-p settings
vim.cmd([[ let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' ]])

-- UltiSnips settings
vim.cmd([[ let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips' ]])
-- UltiSnips triggering
vim.cmd([[ let g:UltiSnipsExpandTrigger = '<C-j>' ]])
vim.cmd([[ let g:UltiSnipsJumpForwardTrigger="<c-j>" ]])
vim.cmd([[ let g:UltiSnipsJumpBackwardTrigger="<c-k>" ]] )

-- Airline settings
-- Enable the list of buffers
vim.cmd([[ let g:airline#extensions#tabline#enabled = 1 ]])
-- Show just the filename
vim.cmd([[ let g:airline#extensions#tabline#fnamemod = ':t' ]])
-- Set the airline theme
vim.cmd([[ let g:airline_theme='dark' ]])
-- let g:airline_theme='jet'
vim.cmd([[ let g:airline_powerline_fonts = 1 ]])

-- Netrw settings
--let g:netrw_browsex_viewer = 'firefox'
vim.cmd([[ let g:netrw_liststyle=3 ]])
vim.cmd([[ let g:netrw_http_cmd="firefox" ]])
