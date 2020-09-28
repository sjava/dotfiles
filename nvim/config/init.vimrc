call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" general
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc'
Plug 'Shougo/neco-syntax'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'voldikss/vim-codelf'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'haya14busa/incsearch.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ncm2/float-preview.nvim'
Plug 'mhinz/vim-grepper'
Plug 'luochen1990/rainbow'
Plug 'chrisgillis/vim-bootstrap3-snippets'
Plug 'Shougo/context_filetype.vim'
Plug 'vim-test/vim-test'
Plug 'kassio/neoterm'
" editing
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'

" Plug 'tpope/vim-commentary'
Plug 'tyru/caw.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'othree/eregex.vim'
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
" Plug 'rhysd/clever-f.vim'
Plug 'andymass/vim-matchup'
Plug 'terryma/vim-multiple-cursors'
Plug 'sbdchd/neoformat'
Plug 'jsfaint/gen_tags.vim'
Plug 'xolox/vim-misc'
Plug 'MaicoTimmerman/Vim-Jinja2-Syntax'
Plug 'fisadev/vim-isort'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/fcitx.vim'

" eye candy
Plug 'myusuf3/numbers.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" javascript
Plug 'moll/vim-node'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'


" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'thinca/vim-ref'
" Plug 'slashmili/alchemist.vim'
" Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'Shougo/deoplete-lsp'
Plug 'neovim/nvim-lsp'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dstein64/vim-win'

" other
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/csscomplete.vim'
Plug 'groenewege/vim-less'
Plug 't9md/vim-choosewin'
Plug 'chrisbra/unicode.vim'
Plug 'mhinz/vim-startify'

" text objects
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-brace'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-fold'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-function'

" python
" Plug 'zchee/deoplete-jedi'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'ujihisa/neco-look'
" Plug 'ujihisa/neco-look'
" Plug 'wellle/tmux-complete.vim'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

Plug 'chr4/nginx.vim'

" wxapp
Plug 'chemzqm/wxapp.vim'

" xml
Plug 'othree/xml.vim'
call plug#end()
