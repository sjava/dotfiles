syntax on
syntax enable
set hidden
set hlsearch
set ignorecase
set nobackup
set nowritebackup
set number

set shortmess+=c
set cmdheight=1
set signcolumn=yes
set updatetime=300
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
    set termguicolors
endif

filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

set ruler		" show the cursor position all the time
set cursorline

set showcmd		" display incomplete commands

if has('mouse')
  set mouse=a
endif

if has("autocmd")

  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=108

    " Trim whitespace onsave
    autocmd BufWritePre * %s/\s\+$//e

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

endif " has("autocmd")

" tab stuff
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
set autoindent
set smartindent

set complete-=i

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

" detect .md as markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Unix as standard file type
set ffs=unix,dos,mac

" Always utf8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set so=5 " scroll lines above/below cursor
set sidescrolloff=5
set lazyredraw

set magic " for regular expressions

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" stop highlighting of underscores in markdown files
autocmd BufNewFile,BufRead,BufEnter *.md,*.markdown :syntax match markdownIgnore "_"

" clipboard
set clipboard+=unnamed

" set py3 host prog
let g:python3_host_prog = "/usr/bin/python3"
" let g:python2_host_prog = "/usr/bin/python"
