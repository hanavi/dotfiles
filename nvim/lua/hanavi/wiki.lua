vim.api.nvim_create_augroup("new_wiki_file", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_wiki_file",
    pattern = "*.wiki",
    command = "0r ~/.config/nvim/templates/skeleton.wiki",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_wiki_file",
    pattern = "*.wiki",
    command = ":norm 2j",
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = "new_wiki_file",
    pattern = "*.wiki",
    callback = SetWikiDate,
})

