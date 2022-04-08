call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'navarasu/onedark.nvim'

" general
Plug 'w0rp/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'sjava/vim-which-key'
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'liuchengxu/vim-which-key'
" Plug 'Shougo/context_filetype.vim'
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'RRethy/nvim-treesitter-textsubjects'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" editing
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'
Plug 'honza/vim-snippets'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'chrisbra/NrrwRgn'

Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-repeat'
Plug 'othree/eregex.vim'
Plug 'machakann/vim-sandwich'
Plug 'justinmk/vim-sneak'
Plug 'andymass/vim-matchup'
Plug 'terryma/vim-multiple-cursors'
Plug 'sbdchd/neoformat'
Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/fcitx.vim'
Plug 'max397574/better-escape.nvim'
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

" other
Plug 'mattn/emmet-vim'
Plug 'chrisbra/unicode.vim'
Plug 'mhinz/vim-startify'
Plug 'nathom/filetype.nvim'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'amiralies/vim-textobj-elixir'
Plug 'wellle/targets.vim'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

Plug 'chr4/nginx.vim'

" wxapp
Plug 'chemzqm/wxapp.vim'
Plug 'kassio/neoterm'

Plug 'beauwilliams/focus.nvim'

call plug#end()
