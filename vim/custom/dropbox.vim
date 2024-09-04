augroup dropbox_logs
  autocmd!
  au BufNewFile Dropbox/logs/*.md 0r ~/.vim/templates/logs.md
  au BufNewFile Dropbox/logs/*.md :norm 3jA
  au BufNewFile Dropbox/logs/*.md :r !date "+\%F"
  au BufNewFile Dropbox/logs/*.md :norm kJG
augroup END

au BufNewFile Dropbox/logs/*.md 0r ~/.vim/templates/logs.md
au BufNewFile Dropbox/logs/*.md :norm 3jA
au BufNewFile Dropbox/logs/*.md :r !date "+\%F"
au BufNewFile Dropbox/logs/*.md :norm kJG
