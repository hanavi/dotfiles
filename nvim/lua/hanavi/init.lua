-- Some basics

-- package.path = package.path .. ";~/.config/nvim/lua"
-- print('loading base')

require("hanavi.packages")
require("hanavi.functions")
require("hanavi.keybindings")

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

vim.opt.colorcolumn = "80,100"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Coloring stuff
vim.cmd.highlight({ "MyWarn", "cterm=inverse,bold", "ctermfg=yellow" })
vim.cmd.highlight({ "MyError", "cterm=inverse,bold", "ctermfg=red" })
vim.fn.matchadd('MyWarn', "[^\\s],[^ ]", 100)

-- Buffer setup settings
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.sh",
    callback = SetUpdatedTime,
})

-- command = ":call SetUpdatedTime()",
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = SetUpdatedTime,
})

vim.api.nvim_create_augroup("new_python_file", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_python_file",
    pattern = "*.py",
    command = "0r ~/.vim/templates/skeleton.py",
})

vim.api.nvim_create_augroup("new_tex_file", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_tex_file",
    pattern = "*.tex",
    command = "0r ~/.vim/templates/skeleton.tex",
})
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_tex_file",
    pattern = "*.tex",
    command = "norm 14G",
})

-- vim.api.nvim_create_autocmd("BufNewFile", {
--     group = "new_python_file",
--     pattern = "*.py",
--     command = ":call SetFileName()",
-- })

-- vim.api.nvim_create_autocmd("BufNewFile", {
--     group = "new_python_file",
--     pattern = "*.py",
--     command = ":call SetCreatedTime()",
-- })

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_python_file",
    pattern = "*.py",
    callback = SetUpdatedTime,
})

vim.api.nvim_create_augroup("new_arduino_file", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_arduino_file",
    pattern = "*.ino",
    command = "0r ~/.vim/templates/skeleton.ino",
})

vim.api.nvim_create_augroup("new_cpp_file", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_cpp_file",
    pattern = {"*.c++", "*.cpp"},
    command = "0r ~/.vim/templates/skeleton.cpp",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_cpp_file",
    pattern = "*.h",
    command = "0r ~/.vim/templates/skeleton.h",
})

-- vim.api.nvim_create_autocmd("BufNewFile", {
--     group = "new_cpp_file",
--     pattern = {"*.h","*.c++", "*.cpp"},
--     command = ":call SetFileName()",
-- })

-- vim.api.nvim_create_autocmd("BufNewFile", {
--     group = "new_cpp_file",
--     pattern = {"*.h","*.c++", "*.cpp"},
--     command = ":call SetCreatedTime()",
-- })

vim.api.nvim_create_augroup("new_shell_file", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_shell_file",
    pattern = "*.sh",
    command = "0r ~/.vim/templates/skeleton.sh",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_shell_file",
    pattern = "*.sh",
    command = ":norm 2j",
})

vim.api.nvim_create_augroup("daily_log", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
    group = "daily_log",
    pattern = {"*/Dropbox/Documents/notes/logging/daily/*.tex", },
    command = "0r ~/.vim/templates/daily.tex",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "daily_log",
    pattern = {"*/Dropbox/Documents/notes/logging/daily/*.tex"},
    command = [[ 1s/__DATE__/\=trim(system("date \"+\%B \%_d, \%Y\""))/ ]],
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "daily_log",
    pattern = {"*/Dropbox/Documents/notes/logging/daily/*.tex"},
    command = [[ norm 3G ]],
})

vim.cmd([[
iabbrev bp@ basepath = pathlib.Path(__file__).resolve().parent
]])

--[[
augroup dropbox_logs
  autocmd!
  au BufNewFile Dropbox/logs/*.md 0r ~/.vim/templates/logs.md
  au BufNewFile Dropbox/logs/*.md :norm 3jA
  au BufNewFile Dropbox/logs/*.md :r !date "+\%F"
  au BufNewFile Dropbox/logs/*.md :norm kJG
augroup END


augroup daily_log
  autocmd!
  au BufNewFile ~/Dropbox/Documents/notes/daily/*.tex 0r ~/.vim/templates/daily.tex
  au BufNewFile ~/Dropbox/Documents/notes/daily/*.tex :1s/__DATE__/\=trim(system("date \"+\%B \%_d, \%Y\""))/
  au BufNewFile ~/Dropbox/Documents/notes/daily/*.tex :norm 3G
augroup END

"au FileType *.tex nmap <leader>k :!make<CR>
nnoremap <leader>mk :!make<CR>

au BufNewFile Dropbox/logs/*.md 0r ~/.vim/templates/logs.md
au BufNewFile Dropbox/logs/*.md :norm 3jA
au BufNewFile Dropbox/logs/*.md :r !date "+\%F"
au BufNewFile Dropbox/logs/*.md :norm kJG

au BufRead,BufNewFile *.sh set softtabstop=2
--]]

