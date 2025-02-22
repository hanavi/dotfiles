-- print('loading functions')


vim.cmd([[
function! SplitArgs()
    let pos = line('.') + 1
    s#\v^(\s*)(.*\()(.*)(\).*)$#\1\2\r\1    \3\r\1\4#
    call cursor(pos, 1)
    let cline = getline('.')
    let padding = substitute(cline, '^\(\s*\).*', '\=submatch(1)    ', '')
    exec 's/, \?/,\r' . padding . '/g'
    s/\(.*\),\?/\1,/
endfunction
]])


function SetWikiDate()
  local pos = vim.fn.getpos('.')
  local line = 1
  local date = vim.fn.strftime('%F')
  while line < 7 do
    vim.fn.setline(line, vim.fn.substitute(vim.fn.getline(line), "__DATE__",  date, ""))
    line = line + 1
  end
  vim.fn.histdel('search', -1)
  vim.fn.setpos('.', pos)
end

function SetUpdatedTime()
  local pos = vim.fn.getpos('.')
  local line = 1
  local date = vim.fn.strftime('%F')
  while line < 7 do
    vim.fn.setline(line, vim.fn.substitute(vim.fn.getline(line), "^# Last Updated:.*", "# Last Updated: " .. date, ""))
    line = line + 1
  end
  -- vim.fn.histdel('search', -1)
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

vim.api.nvim_create_user_command("InsertDate",
function(opts)
  local cur = vim.fn.line('.')
  local date = vim.fn.strftime("%F")
  -- date = " " .. date
  vim.cmd("normal a" .. date)
end,
{
    nargs = 0
})
