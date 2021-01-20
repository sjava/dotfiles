let g:test#strategy = 'floaterm'
let g:float_preview#docked = 0

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" context_filetype
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes._ = '_'

" let g:neocomplete#enable_at_startup = 1
" let g:neosnippet#enable_completed_snippet = 1
" let g:neosnippet#enable_complete_done = 1
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" echodoc
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'floating'

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
" let g:ale_completion_enabled = 0
" let g:ale_sign_column_always = 1
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"
" let g:ale_virtualtext_cursor=1
" nmap  <M-k> <Plug>(ale_previous_wrap)
" nmap  <M-j> <Plug>(ale_next_wrap)
" let g:ale_elixir_elixir_ls_release = '~/.cache/nvim/nvim_lsp/elixirls/elixir-ls/release'
" let g:ale_elixir_elixir_ls_config={
"    \   "elixirLS": {
"    \     "dialyzerEnabled": v:false
"    \   }
"    \ }
" let g:ale_linters = {
"      \   'python': ['flake8','isort'],
"      \   'javascript': ['eslint'],
"      \   'elixir': ['credo','elixir-ls'],
"      \}
" let g:ale_fixers = {
"  \   'scss': ['stylelint'],
"  \   'javascript': ['eslint'],
"  \}

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" vim-which-key
let g:which_key_use_floating_win=1

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

" codelf
let g:codelf_enable_popup_menu = v:true
let g:codelf_proxy_url='socks5://127.0.0.1:1080'

autocmd CursorHold * silent call CocActionAsync('highlight')
" fzf
" let g:fzf_layout = {'down':'~40%'}
