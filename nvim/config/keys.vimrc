" map Leader
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
set timeoutlen=500

" buffer keys
" nnoremap <Leader>bb :b#<CR>
" nnoremap <Leader>bn :bn<CR>
" nnoremap <Leader>bp :bp<CR>
" nnoremap <Leader>bf :bf<CR>
" nnoremap <Leader>bl :bl<CR>
" nnoremap <Leader>bw :w<CR>:bd<CR>
" nnoremap <Leader>bd :Bwipeout<CR>
" nnoremap <Leader>e :enew<CR>

" window keys
" nnoremap <Leader>w< <C-w><
" nnoremap <Leader>w> <C-w>>
" nnoremap <Leader>w- <C-w>-
" nnoremap <Leader>w+ <C-w>+
" nnoremap <Leader>ws :split<CR>
" nnoremap <Leader>wv :vsplit<CR>
" nnoremap <Leader>wx :close<CR>
" nnoremap <Leader>wh <C-w>h
" nnoremap <Leader>wl <C-w>l
" nnoremap <Leader>wj <C-w>j
" nnoremap <Leader>wk <C-w>k
" nnoremap <Leader>ww :w<CR>

" command mode maps
" better command-line window scrolling with <C-P> & <C-N>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" %% to expand active buffer location on cmdline
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" Function keys
nnoremap <silent> <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F5> :source $HOME/.config/nvim/init.vim<CR>
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :UndotreeToggle<CR>
nnoremap <Leader>\ :Neoformat<CR>

nnoremap <silent><leader>lgd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>lgi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><leader>lgr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>lgc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent><leader>lgs <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><leader>lgw <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent><leader>lh  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>ls  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><leader>lt  <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <Leader>o :Leaderf function<CR>
" noremap <leader>lb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

" Leaderf keys
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShortcutB = "<leader>fb"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader>fs :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader>fa :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" vim paste mode toggle (for fixing indentation issues when pasting text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" override read-only permissions
cmap w!! %!sudo tee > /dev/null %


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
inoremap <C-f> <Esc>I
imap jj <Esc>
inoremap <C-S-v> <Esc>"+pA
nmap <Leader>p "+p
vmap <Leader>y "+y
nmap j gj
nmap k gk
vmap j gj
vmap k gk

inoremap <silent> <expr> <CR> (pumvisible() ? "\<C-y>" : "\<CR>")

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
" imap <C-j>     <C-e><Plug>(neosnippet_expand_or_jump)
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

" key map for vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
