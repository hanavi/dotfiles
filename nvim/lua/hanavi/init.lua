-- Some basics

-- package.path = package.path .. ";~/.config/nvim/lua"
-- print('loading base')
vim.g.python3_host_prog = '~/.local/python/nvim/bin/python'

require("hanavi.packages")
require("hanavi.functions")
require("hanavi.keybindings")
require("hanavi.python_files")
require("hanavi.shell_files")
require("hanavi.log_files")
require("hanavi.wiki")

-- Allow moving around buffers w/o saving
vim.opt.hidden = true

-- Set up the line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor placement
vim.opt.scrolloff = 5

-- Some indentation stuff?
vim.opt.matchpairs = vim.bo.matchpairs .. ",<:>"

vim.opt.indentkeys = string.gsub(vim.bo.indentkeys, "<:>", "")
-- vim.opt.cinkeys = string.gsub(vim.bo.cinkeys, "<:>", "")

vim.opt.backspace = "indent,eol,start"
vim.opt.fillchars = "vert:│"
vim.opt.list = true
vim.opt.listchars = "tab:→ ,trail:·,precedes:«,extends:»"
vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list,full"
vim.opt.completeopt = "menuone,longest"
vim.opt.complete = ".,w,b,u,t,i,kspell"

-- Original
-- set textwidth=79
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = true
vim.opt.fileformat = "unix"
vim.opt.autoindent = false
vim.opt.hlsearch = true
-- vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.path = vim.o.path .. ",**"
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "80,100"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Coloring stuff
vim.cmd.highlight({ "MyWarn", "cterm=inverse,bold", "ctermfg=yellow" })
vim.cmd.highlight({ "MyError", "cterm=inverse,bold", "ctermfg=red" })
vim.fn.matchadd('MyWarn', "[^\\s],[^ ]", 100)


vim.api.nvim_create_augroup("new_tex_file", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_tex_file",
    pattern = "*.tex",
    command = "0r ~/.config/nvim/templates/skeleton.tex",
})
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_tex_file",
    pattern = "*.tex",
    command = "norm 14G",
})

vim.api.nvim_create_augroup("new_arduino_file", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_arduino_file",
    pattern = "*.ino",
    command = "0r ~/.config/nvim/templates/skeleton.ino",
})

vim.cmd([[
iabbrev bp@ basepath = pathlib.Path(__file__).resolve().parent
]])

--[[
"au FileType *.tex nmap <leader>k :!make<CR>
nnoremap <leader>mk :!make<CR>
au BufRead,BufNewFile *.sh set softtabstop=2
--]]

