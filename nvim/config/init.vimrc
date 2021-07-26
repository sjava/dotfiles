call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" general
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'haya14busa/incsearch.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ncm2/float-preview.nvim'
Plug 'mhinz/vim-grepper'
Plug 'Shougo/context_filetype.vim'
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
" editing
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'

Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'othree/eregex.vim'
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-sneak'
Plug 'andymass/vim-matchup'
Plug 'terryma/vim-multiple-cursors'
Plug 'sbdchd/neoformat'
Plug 'jsfaint/gen_tags.vim'
Plug 'xolox/vim-misc'
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" other
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/csscomplete.vim'
Plug 'groenewege/vim-less'
Plug 'dstein64/vim-win'
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
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

Plug 'chr4/nginx.vim'

" xml
Plug 'othree/xml.vim'
Plug 'chemzqm/wxapp.vim'
call plug#end()
