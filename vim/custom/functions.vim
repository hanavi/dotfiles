"------------------------------------------------------------------------------
" General functions

" Strip trailing whitespace (and save cursor position) when saving files
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Stolen from http://vim.wikia.com/wiki/Insert_current_date_or_time
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! SetCreatedTime()
  let save_cursor = getpos(".")
  let n = min([30, line("$")])
  keepjumps exe '1,' . n . 's#^\(.\{,10}Date Created: \).*#\1' .
        \ strftime('%F') . '#e'
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfun

function! FixCommas()
  let save_cursor = getpos(".")
  :silent! %s/,/, /g
  :silent! %s/, */, /g
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfunction

nnoremap <leader>fc :call FixCommas()<CR>

" Might only work in unix
function! StartTimeStamp()
  :normal! 0I**StartTime**
  :r! date
  :normal! kJo
endfunction
nnoremap <leader>S :call StartTimeStamp()<CR>

function! EndTimeStamp()
  :normal! 0I**EndTime**
  :r! date
  :normal! kJo
endfunction
nnoremap <leader>E :call EndTimeStamp()<CR>

function! Lipsum()
  :r! lipsum
endfunction

function! GetArgs()
  ":normal mayiw/def "f(v/)y'ag_p
  :normal maK2jf(v/)y:bdg_p
endfunction

" nnoremap <silent> <leader>ff :call GetArgs()<CR>

function! SplitArgs()
  :normal! yi)
  let c = len(split(@"))
  :normal! F(wi
  let i = 1
  while i < c
    :normal! f,wi
    let i += 1
  endwhile
  :normal! f)i
endfunction

nnoremap <silent> <leader>fs :call SplitArgs()<CR>


function! ListToDictAlt()
  :normal! yi)
  let c = len(split(@"))
  :normal! F(r{wi
  execute ":normal! wyiwea = \"\"\"\<esc>f,a\<CR>"
  let i = 0
  while i < c
    execute ":normal! wyiwea = \"\"\"\<esc>f,a\<CR>"
    let i += 1
  endwhile
  execute ":normal! f)i\<CR>\<esc>"
  :normal <<<<r}
endfunction

function! ListToDict()
  :normal! yi)
  let c = len(split(@"))
  :normal! F(r{wi
  let i = 0
  while i < c
    execute ":normal! wyiwi\"\<esc>ea\": \"\<esc>f,a\<CR>"
    let i += 1
  endwhile
  execute ":normal! f)i\<CR>\<esc>"
  :normal! <<<<r}
endfunction

nnoremap <silent> <leader>fd :call ListToDict()<CR>

function! BlockMove()
  :execute ":normal! Imv \"\<esc>A\"\<esc>0Wv$hy$A \<esc>080lp"
endfunction
vnoremap <leader>mb :call BlockMove()<CR>

function! AddImportFrom()
  let save_cursor = getpos(".")
  let save_cursor[1] = line('.') + 1
  :norm G<CR>
  call search('import', 'b')
  let cmd = input("from ", "")
  execute ':norm ofrom ' . cmd
  call setpos('.', save_cursor )
endfunction
nnoremap <silent> <leader>if :call AddImportFrom()<CR>

function! AddImport()
  let save_cursor = getpos(".")
  let save_cursor[1] = line('.') + 1
  :norm G<CR>
  call search('import', 'b')
  let cmd = input("import ", "")
  execute ':norm oimport ' . cmd
  call setpos('.', save_cursor )
endfunction
nnoremap <silent> <leader>im :call AddImport()<CR>

" Update the filename in the header
function! SetFileName()
  let fn=expand("%:t")
  let save_cursor = getpos(".")
  let n = min([30, line("$")])
  keepjumps exe '1,' . n . 's#^\(.\{,10}Filename: \).*#\1' .
        \ fn . '#e'
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfun
nmap <silent> <leader>f :call SetFileName()<CR>

" Update the Last Updated info in the header
function! SetUpdatedTime()
  let save_cursor = getpos(".")
  let n = min([30, line("$")])
  keepjumps exe '1,' . n . 's#^\(.\{,10}Last Updated: \).*#\1' .
        \ strftime('%F') . '#e'
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfun
" nmap <silent> <leader>u :call SetUpdatedTime()<CR>

" Generate an incrementing string of padded numbers surrounded by text
function! MyList(count, ...)
    let start = get(a:, 1, "")
    let end = get(a:, 2, "")
    let pad = get(a:, 3, 0)

    let c = 0
    while c < a:count
        let cout = c
        while len(cout) < pad
            let cout = 0 . cout
        endwhile
        let output = start . cout . end
        let stat = append(line('.') + c, output)
        let c += 1
    endwhile
endfun
