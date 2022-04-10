lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      }
  },
}
require("better_escape").setup {
    mapping = {"jk", "jj"},
    timeout = vim.o.timeoutlen,
    keys = "<Esc>",
}
require('telescope').load_extension('coc')
require("focus").setup({excluded_filetypes = { 'floaterm', 'term', 'toggleterm' }})
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" let g:test#strategy = 'floaterm'
let g:neoterm_autoscroll = 1
" let g:test#strategy = 'neoterm'
let g:shtuff_receiver = 'devrunner'
let g:test#strategy = 'shtuff'

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

let g:onedark_terminal_italics=1
colorscheme onedark

" ale plugin
let g:ale_enabled = 1
let g:ale_disable_lsp = 1
let g:ale_lint_on_save = 0
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_floating_preview = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_virtualtext_cursor = 1
let g:ale_linters = {
      \   'python': ['flake8','isort'],
      \   'javascript': ['eslint'],
      \   'elixir': ['credo'],
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
let g:neoformat_try_node_exe = 1
let g:neoformat_wxml_prettier ={
           \ 'exe': 'prettier',
           \ 'args': ['--parser html'],
           \ 'stdin': 1,
           \ }
let g:neoformat_enabled_wxml = ['prettier']

let g:neoformat_javascript_prettier ={
      \ 'exe': 'prettier',
      \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'babel'],
      \ 'stdin': 1,
      \ 'try_node_exe': 1,
      \ }

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_scss = ['prettier']

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" vim-which-key
function! FormatWhichKey(mapping) abort
  let l:ret = a:mapping
  let l:ret = substitute(l:ret, '\c<cr>$', '', '')
  let l:ret = substitute(l:ret, '^:', '', '')
  let l:ret = substitute(l:ret, '^\c<c-u>', '', '')
  let l:ret = substitute(l:ret, '^<Plug>', '', '')
  let l:ret = substitute(l:ret, '^AirlineSelect', '', '')
  return l:ret
endfunction

let g:which_key_run_map_on_popup = 1
let g:which_key_use_floating_win = 1
let g:which_key_disable_default_offset = 1
let g:which_key_centered = 1
let g:which_key_floating_opts = { 'height': '10' }
let g:WhichKeyFormatFunc = function('FormatWhichKey')

autocmd CursorHold * silent call CocActionAsync('highlight')

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

let g:clap_provider_tags_force_vista = 1
let g:clap_layout = { 'relative': 'editor' }
let g:clap_theme = 'material_design_dark'
let g:clap_enable_icon = 1
" let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case -g "!tags"'

let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_buftype_exclude = ['nofile', 'terminal']

highlight CocHighlightText cterm=underline gui=underline

let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_wdth = 80
let g:nrrw_rgn_incr = 30

let g:inline_edit_autowrite = 1
let g:inline_edit_new_buffer_command = "vnew"
let g:inline_edit_patterns = [
      \   {
        \     'main_filetype':     'mpx',
        \     'sub_filetype':      'javascript',
        \     'indent_adjustment': 1,
        \     'start':             '<script>',
        \     'end':               '</script>',
        \   },
      \   {
        \     'main_filetype':     'mpx',
        \     'sub_filetype':      'wxml',
        \     'indent_adjustment': 1,
        \     'start':             '<template>',
        \     'end':               '</template>',
        \   },
      \   {
        \     'main_filetype':     'mpx',
        \     'sub_filetype':      'scss',
        \     'indent_adjustment': 1,
        \     'start':             '<style lang="scss">',
        \     'end':               '</style>',
        \   },
      \   {
        \     'main_filetype':     'mpx',
        \     'sub_filetype':      'json',
        \     'indent_adjustment': 1,
        \     'start':             '<script type="application/json">',
        \     'end':               '</script>',
        \   },
        \ ]
