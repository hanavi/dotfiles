" Comment settings
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

au BufWritePre *.c++ :call SetUpdatedTime()
au BufWritePre *.cpp :call SetUpdatedTime()
augroup new_c++_file
  autocmd!
  au BufNewfile *.h 0r ~/.vim/templates/skeleton.h
  au BufNewfile *.c++ 0r ~/.vim/templates/skeleton.cpp
  au BufNewfile *.cpp 0r ~/.vim/templates/skeleton.cpp

  au BufNewFile *.h :call SetFileName()
  au BufNewFile *.c++ :call SetFileName()
  au BufNewFile *.cpp :call SetFileName()

  au BufNewFile *.h :call SetCreatedTime()
  au BufNewFile *.c++ :call SetCreatedTime()
  au BufNewFile *.cpp :call SetCreatedTime()
augroup END
