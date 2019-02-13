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

inoremap <silent> <expr> <CR> (pumvisible() ? "\<C-y>" : "\<CR>")

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
xmap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
