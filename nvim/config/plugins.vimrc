:lua << END
require'lspconfig'.elixirls.setup{
cmd = { "/home/zyb/tools/elixir-ls/dest/language_server.sh" };
}
  require'lspconfig'.pyls.setup{}
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.cssls.setup{}
  require'lspconfig'.html.setup{}
  require'lspconfig'.dockerls.setup{}
  require'lspconfig'.jsonls.setup{}
  vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end
END

filetype plugin indent on
let g:test#strategy = 'floaterm'

" deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 0
let g:deoplete#look#words = '~/.config/nvim/10K.txt'
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set shortmess+=c
set completeopt-=preview
set completeopt+=noinsert
set completeopt+=noselect

let g:float_preview#docked = 0
call deoplete#custom#var('buffer', 'require_same_filetype', v:false)
call deoplete#custom#option({
                           \ 'ignore_sources': {'_': ['tag','ale']},
                           \ 'auto_refresh_delay': 100,
                           \ })
call deoplete#custom#source('neosnippet',
         \ 'rank',
         \ 400)
call deoplete#custom#source('tabnine',
         \ 'rank',
         \ 10)
call deoplete#custom#var('tabnine', {
\ 'line_limit': 500,
\ 'max_num_results': 5,
\ })

" context_filetype
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes._ = '_'

let g:neocomplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_complete_done = 1
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

" gen_tags
" let g:gen_tags#ctags_auto_gen = 1
" let g:gen_tags#statusline = 1

" set background=dark
let g:onedark_terminal_italics=1
colorscheme onedark
" let g:gruvbox_italic=1
" colorscheme gruvbox


" vim-sneak settings
hi SneakPluginTarget ctermfg=black ctermbg=181818
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" disable colorizer at startup
let g:colorizer_startup = 0
let g:colorizer_nomap = 1

" neoformat config
let g:neoformat_wxml_prettier ={
           \ 'exe': 'prettier',
           \ 'args': ['--parser html'],
           \ 'stdin': 1,
           \ }
let g:neoformat_enabled_wxml = ['prettier']

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_scss = ['prettier']

" ale plugin
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_virtualtext_cursor=1
nmap  <M-k> <Plug>(ale_previous_wrap)
nmap  <M-j> <Plug>(ale_next_wrap)
let g:ale_elixir_elixir_ls_release = '/home/zyb/tools/elixir-ls/dest'
let g:ale_elixir_elixir_ls_config={
    \   "elixirLS": {
    \     "dialyzerEnabled": v:false
    \   }
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

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" vim-which-key
let g:which_key_use_floating_win=1

func! Multiple_cursors_before()
  if deoplete#is_enabled()
    call deoplete#disable()
    let g:deoplete_is_enable_before_multi_cursors = 1
  else
    let g:deoplete_is_enable_before_multi_cursors = 0
  endif
endfunc
func! Multiple_cursors_after()
  if g:deoplete_is_enable_before_multi_cursors
    call deoplete#enable()
  endif
endfunc

" leaderf ignore dir
let g:Lf_WildIgnore = {
      \ 'dir': ['node_modules'],
      \ 'file': []
      \}
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" fzf
let g:fzf_layout = {'down':'~40%'}
