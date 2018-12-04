" map Leader
" let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" vim-which-key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" buffer keys
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bf :bf<CR>
nnoremap <Leader>bl :bl<CR>
nnoremap <Leader>bw :w<CR>:bd<CR>
nnoremap <Leader>bd :Bwipeout<CR>
" new buffer/tab
nnoremap <Leader>e :enew<CR>

" window keys
nnoremap <Leader>w< <C-w><
nnoremap <Leader>w> <C-w>>
nnoremap <Leader>w- <C-w>-
nnoremap <Leader>w+ <C-w>+
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wx :close<CR>

" command mode maps
" better command-line window scrolling with <C-P> & <C-N>
" cnoremap <C-p> <Up>
" cnoremap <C-n> <Down>

" %% to expand active buffer location on cmdline
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" Function keys
nnoremap <silent> <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F5> :source $HOME/.config/nvim/init.vim<CR>
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :UndotreeToggle<CR>


" relative line numbers
nnoremap <Leader>3 :NumbersToggle<CR>


" remap number increment to C-s (C-a is already in use by tmux)
nmap <C-s> <C-a>

" vim paste mode toggle (for fixing indentation issues when pasting text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" override read-only permissions
cmap w!! %!sudo tee > /dev/null %

" allow ,, for vimsneak
nmap <Leader>, <Plug>SneakPrevious


" start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" 0:up, 1:down, 2:pgup, 3:pgdown, 4:top, 5:bottom
function! Tools_PreviousCursor(mode)
  if winnr('$') <= 1
    return
  endif
  noautocmd silent! wincmd p
  if a:mode == 0
    exec "normal! \<c-y>"
  elseif a:mode == 1
    exec "normal! \<c-e>"
  elseif a:mode == 2
    exec "normal! ".winheight('.')."\<c-y>"
  elseif a:mode == 3
    exec "normal! ".winheight('.')."\<c-e>"
  elseif a:mode == 4
    normal! gg
  elseif a:mode == 5
    normal! G
  elseif a:mode == 6
    exec "normal! \<c-u>"
  elseif a:mode == 7
    exec "normal! \<c-d>"
  elseif a:mode == 8
    exec "normal! k"
  elseif a:mode == 9
    exec "normal! j"
  endif
  noautocmd silent! wincmd p
endfunc

noremap <silent><M-u> :call Tools_PreviousCursor(6)<cr>
noremap <silent><M-d> :call Tools_PreviousCursor(7)<cr>
inoremap <silent><M-u> <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
inoremap <silent><M-d> <c-\><c-o>:call Tools_PreviousCursor(7)<cr>

" terminal return normal mode
:tnoremap <Esc> <C-\><C-n>

inoremap <C-l> <Esc>A
inoremap <C-a> <Esc>I
imap jj <Esc>
nmap <Leader>p "+p
vmap <Leader>y "+y
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" nvim-send-to-term key bind
let g:send_disable_mapping=1
nmap <Leader>sl <Plug>SendLine
nmap <Leader>ss <Plug>Send
vmap <Leader>ss <Plug>Send
nmap <leader>se s$

" Basic stuff
let g:UltiSnipiSnippetDirectories=[$HOME.'/.vim/UltiSnips/']
let g:UltiSnipsEditSplit="vertical"

" For sake of nanual expanding
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"


let g:ulti_expand_res = 0 "default value, just set once
function! CompleteSnippet()
  if empty(v:completed_item)
    return
  endif

  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res > 0
    return
  endif

  let l:complete = type(v:completed_item) == v:t_dict ? v:completed_item.word : v:completed_item
  let l:comp_len = len(l:complete)

  let l:cur_col = mode() == 'i' ? col('.') - 2 : col('.') - 1
  let l:cur_line = getline('.')

  let l:start = l:comp_len <= l:cur_col ? l:cur_line[:l:cur_col - l:comp_len] : ''
  let l:end = l:cur_col < len(l:cur_line) ? l:cur_line[l:cur_col + 1 :] : ''

  call setline('.', l:start . l:end)
  call cursor('.', l:cur_col - l:comp_len + 2)

  call UltiSnips#Anon(l:complete)
endfunction

autocmd CompleteDone * call CompleteSnippet()
