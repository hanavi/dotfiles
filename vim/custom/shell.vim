augroup new_shell_file
  autocmd!
  au BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  au BufNewFile *.sh :norm 2j
augroup END

au BufRead,BufNewFile *.sh set softtabstop=2
