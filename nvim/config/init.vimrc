call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" auto complete and lsp
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" status line
Plug 'vim-airline/vim-airline'
" format table
Plug 'dhruvasagar/vim-table-mode'
" preview css color
Plug 'ap/vim-css-color'
" " general
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'honza/vim-snippets'
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-grepper'
Plug 'luochen1990/rainbow'
Plug 'Shougo/context_filetype.vim'
" " editing
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'
Plug 'tyru/caw.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'othree/eregex.vim'
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'andymass/vim-matchup'
Plug 'terryma/vim-multiple-cursors'
Plug 'sbdchd/neoformat'
Plug 'jsfaint/gen_tags.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/fcitx.vim'
Plug 'myusuf3/numbers.vim'
Plug 'posva/vim-vue'
" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"
" " other
" Plug 'mattn/emmet-vim'
" Plug 'othree/html5.vim'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'othree/csscomplete.vim'
" Plug 'groenewege/vim-less'
Plug 't9md/vim-choosewin'
" Plug 'chrisbra/unicode.vim'
Plug 'mhinz/vim-startify'
"
" text objects
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-brace'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'andyl/vim-textobj-elixir'
"
" " python
" Plug 'zchee/deoplete-jedi'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" " Plug 'ujihisa/neco-look'
" " Plug 'wellle/tmux-complete.vim'
"
" " markdown
" Plug 'plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.vim'

Plug 'chr4/nginx.vim'

" wxapp
Plug 'chemzqm/wxapp.vim'
"
" xml
Plug 'othree/xml.vim'
call plug#end()
