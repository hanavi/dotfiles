vim.api.nvim_create_augroup("new_shell_file", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_shell_file",
    pattern = "*.sh",
    command = "0r ~/.config/nvim/templates/skeleton.sh",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_shell_file",
    pattern = "*.sh",
    command = ":norm 2j",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_shell_file",
    pattern = "*.sh",
    callback = SetUpdatedTime,
})

-- Buffer setup settings
vim.api.nvim_create_augroup("shell_file", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = "shell_file",
    pattern = "*.sh",
    callback = SetUpdatedTime,
})
