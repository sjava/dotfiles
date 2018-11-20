filetype plugin indent on

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set shortmess+=c
set completeopt-=preview
call deoplete#custom#var('buffer', 'require_same_filetype', v:false)
call deoplete#custom#option('ignore_sources', {'_': ['tag']})
call deoplete#custom#source('LanguageClient',
          \ 'min_pattern_length',
          \ 2)

" echodoc
set noshowmode
let g:echodoc#enable_at_startup=1

set background=dark

let g:onedark_terminal_italics=1
colorscheme onedark

" CtrlP
let g:ctrlp_prompt_mappings={'PrtClearCache()':['<Leader><F5>']}
let g:ctrlp_prompt_mappings={'PrtdeleteEnt()':['<Leader><F7>']}
let g:ctrlp_match_window='bottom,order:btt,min:2,max:25'
set wildmenu " enhanced autocomplete
set wildignore+=*/tmp/*,*/dist/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot,*deps*,*public/css/*,*public/js*

" delimitMate options
let delimitMate_expand_cr=1

" vim-sneak settings
hi SneakPluginTarget ctermfg=black ctermbg=181818
let g:sneak#label = 1
nmap f <Plug>SneakLabel_s
nmap F <Plug>SneakLabel_S

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
" let g:neoformat_html_prettydiff = {
"      \ 'exe': 'prettydiff',
"      \ 'args': ['mode:"beautify"',
"      \ 'lang:"html"',
"      \ 'insize:2',
"      \ 'readmethod:"filescreen"',
"      \ 'endquietly:"quiet"',
"      \ 'source:"%:p"'],
"      \ 'no_append': 1
"      \ }
" let g:neoformat_enabled_html = ['prettydiff']

let g:neoformat_wxml_prettydiff = {
      \ 'exe': 'prettydiff2',
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
augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.py,*.ex,*.exs Neoformat
  autocmd BufWritePre *.css,*.less,*scss,*.vue Neoformat
  autocmd BufWritePost *.html,*.wxml Neoformat
augroup END

" ale plugin
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
nmap  <M-k> <Plug>(ale_previous_wrap)
nmap  <M-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
      \   'python': ['flake8','isort'],
      \   'javascript': ['eslint'],
      \   'elixir': ['credo'],
      \}
let g:ale_fixers = {
  \   'scss': ['stylelint'],
  \}

" language client
set hidden
set signcolumn=yes
let g:LanguageClient_diagnosticsEnable=1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hasSnippetSupport=1
let g:LanguageClient_serverCommands = {
    \ 'elixir': ['~/tools/elixir-ls/language_server.sh'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'vue': ['vls']
    \ }


nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F9> :call LanguageClient_textDocument_rename()<CR>


" choosewin{
" invoke with '-'
nmap  -  <Plug>(choosewin)
" if you want to use overlay feature
let g:choosewin_overlay_enable = 1
" choosewin}

let g:neoterm_position='vertical'

let g:UltiSnipsSnippetsDir="~/.dotfiles/nvim/UltiSnips"

let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records',
      \ 't:tests'
      \ ]
      \ }

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" emmet support wxapp
let g:user_emmet_settings = {
      \ 'wxss': {
      \   'extends': 'css',
      \ },
      \ 'wxml': {
      \   'extends': 'html',
      \   'aliases': {
      \     'div': 'view',
      \     'span': 'text',
      \   },
      \  'default_attributes': {
      \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
      \     'navigator': [{'url': '', 'redirect': 'false'}],
      \     'scroll-view': [{'bindscroll': ''}],
      \     'swiper': [{'autoplay': 'false', 'current': '0'}],
      \     'icon': [{'type': 'success', 'size': '23'}],
      \     'progress': [{'precent': '0'}],
      \     'button': [{'size': 'default'}],
      \     'checkbox-group': [{'bindchange': ''}],
      \     'checkbox': [{'value': '', 'checked': ''}],
      \     'form': [{'bindsubmit': ''}],
      \     'input': [{'type': 'text'}],
      \     'label': [{'for': ''}],
      \     'picker': [{'bindchange': ''}],
      \     'radio-group': [{'bindchange': ''}],
      \     'radio': [{'checked': ''}],
      \     'switch': [{'checked': ''}],
      \     'slider': [{'value': ''}],
      \     'action-sheet': [{'bindchange': ''}],
      \     'modal': [{'title': ''}],
      \     'loading': [{'bindchange': ''}],
      \     'toast': [{'duration': '1500'}],
      \     'audio': [{'src': ''}],
      \     'video': [{'src': ''}],
      \     'image': [{'src': '', 'mode': 'scaleToFill'}],
      \   }
      \ },
      \}

function g:Multiple_cursors_before()
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
  call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction
