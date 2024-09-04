vim.api.nvim_create_augroup("new_python_file", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_python_file",
    pattern = "*.py",
    command = "0r ~/.config/nvim/templates/skeleton.py",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_python_file",
    pattern = "*.py",
    callback = SetUpdatedTime,
})

-- command = ":call SetUpdatedTime()",
vim.api.nvim_create_augroup("python_file", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = "python_file",
    pattern = "*.py",
    callback = SetUpdatedTime,
})

vim.api.nvim_create_autocmd("BufRead", {
    group = "python_file",
    pattern = "*.py",
    command = "set makeprg=python\\ %:p",
})

-- "au FileType *.tex nmap <leader>k :!make<CR>


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
