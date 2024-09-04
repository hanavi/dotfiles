" Quick mappings
inoremap jk <esc>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>p :set paste!<CR>

nnoremap H :bp<CR>
nnoremap L :bn<CR>

nnoremap <space> za

" run current python script
" nnoremap <leader>x :!python %

" Error console
nmap <silent> <leader>lo :lopen<CR>
nmap <silent> <leader>lc :lclose<CR>
nmap <silent> <leader>ll :ll<CR>
nmap <silent> <leader>ln :lnext<CR>
nmap <silent> <leader>lp :lprev<CR>

" Jump to marker(<++>) delete and switch to insert mode
inoremap \\ <Esc>/<++><Enter>"_c4l
vnoremap \\ <Esc>/<++><Enter>"_c4l
nnoremap \\ <Esc>/<++><Enter>"_c4l

" Search and replace word under cursor
nnoremap <leader>w :%s/\<<C-r><C-w>\>/

" Split window resizing
map <esc>[1;5D <c-Left>
map <esc>[1;5C <c-Right>
map <esc>[1;5A <c-Up>
map <esc>[1;5B <c-Down>

nmap <silent> <c-left> :vert resize -3<cr>
nmap <silent> <c-right> :vert resize +3<cr>
nmap <silent> <c-up> :resize +3<cr>
nmap <silent> <c-down> :resize -3<cr>

noremap <silent> <c-h> <c-w>h
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k

nnoremap <silent> <leader>u :UltiSnipsEdit<CR>
nnoremap <silent> <leader>l :SyntasticCheck<CR>

nnoremap <leader>mk :!make<CR>

nnoremap <leader>ns :r ~/.vim/templates/beamer/slide.txt<CR>

inoremap <C-L> <C-O>$
