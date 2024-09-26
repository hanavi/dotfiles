-- vim.cmd.colorscheme('gruvbox')
vim.cmd([[
try
    colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme ron
endtry
]])
