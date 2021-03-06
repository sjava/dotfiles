" lua <<EOF
" require'nvim-treesitter.configs'.setup {
  " ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  " highlight = {
    " enable = true,              -- false will disable the whole extension
    " disable = { "c", "rust" },  -- list of language that will be disabled
  " },
" }
" require'nvim-treesitter.configs'.setup {
  " rainbow = {
    " enable = true,
    " disable = {'bash'} -- please disable bash until I figure #1 out
  " }
" }
" local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
" parser_config.elixir = {
  " install_info = {
    " url = "/home/zyb/elixir_tools/tree-sitter-elixir",
    " files = {"src/parser.c"}
  " },
  " filetype = "elixir", -- if filetype does not agrees with parser name
  " used_by = {"eelixir"} -- additional filetypes that use this parser
" }
" EOF

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

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" gen_tags
" let g:gen_tags#ctags_auto_gen = 1
" let g:gen_tags#statusline = 1

" set background=dark
"let g:onedark_terminal_italics=1
"colorscheme onedark
let g:gruvbox_italic=1
colorscheme gruvbox

" ale plugin
let g:ale_floating_preview = 1
let g:ale_disable_lsp = 1
let g:ale_completion_enabled = 0
"自定义error和warning图标
let g:ale_sign_error = "❌"
let g:ale_sign_warning = "⚠️"
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_virtualtext_cursor=1
let g:ale_elixir_elixir_ls_release = '/home/zyb/elixir_tools/elixir_ls'
let g:ale_elixir_elixir_ls_config={
    \   "elixirLS": {
    \     "dialyzerEnabled": v:true
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
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
" let g:fzf_layout = {'down':'~40%'}

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
