-- print('loading functions')

function SetUpdatedTime()
  local pos = vim.fn.getpos('.')
  local line = 1
  local date = vim.fn.strftime('%F')
  while line < 7 do
    vim.fn.setline(line, vim.fn.substitute(vim.fn.getline(line), "^# Last Updated:.*", "# Last Updated: " .. date, ""))
    line = line + 1
  end
  vim.fn.histdel('search', -1)
  vim.fn.setpos('.', pos)
end

function StripTrailingWhitespaces()
  local pos = vim.fn.getpos('.')
  vim.cmd([[ %s/\s\+$//e ]])
  vim.fn.setpos('.', pos)
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = StripTrailingWhitespaces,
})


vim.cmd([[
function! FixCommas()
  let save_cursor = getpos(".")
  :silent! %s/,/, /g
  :silent! %s/, */, /g
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfunction
nnoremap <leader>fc :call FixCommas()<CR>
]])


vim.cmd([[
fun! SplitPipes()
   s/ *| */ \\\r    | /g
   noh
endfun
nnoremap <leader>sp :call SplitPipes()<CR>
]])

vim.cmd([[
fun! UnsplitPipes() range
   exe a:firstline . ',' . a:lastline . 's/ \\\n *| \?/ | /'
   noh
endfun
vnoremap <leader>u :call UnsplitPipes()<CR>
]])


vim.api.nvim_create_user_command("AddPythonHeader",
function(opts)

    vim.fn.append(0, "#!/usr/bin/env python")

    local line = vim.fn.getline(2)
    if (vim.fn.match(line, "^# coding") == -1)
    then
        print('append')
        vim.fn.append(1, "# coding: utf-8")
    end
    vim.fn.append(2, "# Author: James Casey <hanavi@gmail.com>")
    vim.fn.append(3, "# Last Updated: __")
end,
{
    nargs = 0
})
