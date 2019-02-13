filetype plugin indent on

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set shortmess+=c
set completeopt-=preview
call deoplete#custom#var('buffer', 'require_same_filetype', v:false)
call deoplete#custom#option('ignore_sources', {'_': ['tag']})
call deoplete#custom#source('LanguageClient',
          \ 'min_pattern_length',
          \ 2)
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#enable_complete_done = 1

" echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
set signcolumn=yes

set background=dark

let g:onedark_terminal_italics=1
colorscheme onedark


" vim-sneak settings
hi SneakPluginTarget ctermfg=black ctermbg=181818
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" disable colorizer at startup
let g:colorizer_startup = 0
let g:colorizer_nomap = 1

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
      \   'guifgs': [ 'darkorange3', 'seagreen3', 'royalblue3','firebrick'],
      \   'ctermfgs': [ 'lightyellow', 'lightcyan', 'lightmagenta','lightblue'],
      \   'operators': '_,_',
      \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \   'separately': {
      \       '*': {},
      \       'tex': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \       },
      \       'lisp': {
      \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \       },
      \       'vim': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \       },
      \       'html': {
      \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \       },
      \       'jinja': {
      \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \       },
      \       'css': 0,
      \   }
      \}

let g:neoformat_wxml_prettydiff = {
     \ 'exe': 'prettydiff',
     \ 'args': ['mode:"beautify"',
     \ 'lang:"html"',
     \ 'insize:2',
     \ 'readmethod:"filescreen"',
     \ 'endquietly:"quiet"',
     \ 'source:"%:p"'],
     \ 'no_append': 1
     \ }
let g:neoformat_enabled_wxml = ['prettydiff']

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_scss = ['prettier']

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" ale plugin
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
nmap  <M-k> <Plug>(ale_previous_wrap)
nmap  <M-j> <Plug>(ale_next_wrap)
let g:ale_elixir_elixir_ls_release = '/home/zyb/elixir_tools/elixir-ls/language_server.sh'
let g:ale_elixir_elixir_ls_config={
      \   'elixirLS': {
      \     'dialyzerEnabled': v:false,
      \   },
      \ }
let g:ale_linters = {
      \   'python': ['flake8','isort'],
      \   'javascript': ['eslint'],
      \   'elixir': ['credo','elixir-ls'],
      \}
let g:ale_fixers = {
  \   'scss': ['stylelint'],
  \   'javascript': ['eslint'],
  \}

" language client
set hidden
set signcolumn=yes
let g:LanguageClient_diagnosticsEnable=0
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hasSnippetSupport=1
let g:LanguageClient_serverCommands = {
    \ 'elixir': ['~/elixir_tools/elixir-ls/language_server.sh'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'vue': ['vls']
    \ }
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F9> :call LanguageClient_textDocument_rename()<CR>

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()



" choosewin{
" invoke with '-'
nmap  -  <Plug>(choosewin)
" if you want to use overlay feature
let g:choosewin_overlay_enable = 1
" choosewin}

let g:neoterm_position='vertical'

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1


function g:Multiple_cursors_before()
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
  call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction
