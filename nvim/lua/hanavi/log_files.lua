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

