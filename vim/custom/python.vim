au BufWritePre *.py :call SetUpdatedTime()
augroup new_python_file
  autocmd!
  au BufNewFile *.py 0r ~/.vim/templates/skeleton.py
  au BufNewFile *.py :call SetFileName()
  au BufNewFile *.py :call SetCreatedTime()
  au BufNewFile *.py :call SetUpdatedTime()
augroup END
