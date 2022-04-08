" vim-which-key
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode noruler
let g:which_key_map =  {}
let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : 'select window',
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ }

let g:which_key_map.g = {
      \ 'name' : '+GoTo code navigation' ,
      \ 'd' : ['<Plug>(coc-definition)','definition'] ,
      \ 'r' : ['<Plug>(coc-references)','references'] ,
      \ 'i' : ['<Plug>(coc-implementation)','implementation'] ,
      \ 'y' : ['<Plug>(coc-type-definition)','type-definition'] ,
      \}

let g:which_key_map.l = {
      \ 'name' : '+coclist action' ,
      \ 'a' : [':CocList diagnostics','diagnostics'] ,
      \ 'e' : [':CocList extensions','extensions'] ,
      \ 'c' : [':CocList commands','commands'] ,
      \ 'o' : [':CocList outline','outline'] ,
      \ 'p' : [':CocListResume','Resume latest coc list'] ,
      \ 'j' : [':CocNext','Do default action for next item'] ,
      \ 'k' : [':CocPrev','Do default action for previous item'] ,
      \}

let g:which_key_map.t = {
      \ 'name' : '+vim-test' ,
      \ 'a' : 'test suite(all)' ,
      \ 'n' : 'test nearest' ,
      \ 'f' : 'test file' ,
      \ 'l' : 'test last' ,
      \ 'v' : 'test visit' ,
      \}

let g:which_key_map.s = {
      \ 'name' : '+neoterm repl' ,
      \ 'f' : [':TREPLSendFile','send file'] ,
      \ 'l' : [':TREPLSendLine','send current line'] ,
      \ 's' : [':TREPLSendSelection','send current selection range'] ,
      \}
let g:which_key_map.f = {
      \ 'name' : '+Search' ,
      \ 'b' : [':Telescope buffers','list buffers'] ,
      \ 'C' : [':Telescope commands','all commands'] ,
      \ 'c' : [':Telescope coc','list from coc'] ,
      \ 'f' : [':Telescope find_files','find files'] ,
      \ 'h' : [':Telescope command_history','command history'] ,
      \ 'p' : [':Telescope builtin','list all pickers'] ,
      \ 's' : [':Telescope grep_string','search on cursor'] ,
      \ 'g' : [':Telescope live_grep','live grep'] ,
      \ 't' : [':Telescope current_buffer_tags','buffer tag'] ,
      \ 'T' : [':Telescope tags','all tag'] ,
      \}
" let g:which_key_map.f = {
      " \ 'name' : '+Search' ,
      " \ 'b' : [':Clap buffers','open buffers'] ,
      " \ 'c' : [':Clap command','all commands'] ,
      " \ 'd' : [':Clap dumb_jump','grep definition'] ,
      " \ 'e' : [':Clap filer','file explorer'] ,
      " \ 'f' : [':Clap files','find files'] ,
      " \ 'g' : [':Clap gfiles','git files'] ,
      " \ 'h' : [':Clap hist:','command history'] ,
      " \ 'l' : [':Clap lines','buffer lines'] ,
      " \ 'm' : [':Clap maps','all maps'] ,
      " \ 's' : [':Clap grep2','search'] ,
      " \ 't' : [':Clap tags','buffer tag'] ,
      " \ 'T' : [':Clap proj_tags','all tag'] ,
      " \ 'w' : [':Clap windows','windows'] ,
      " \}

let g:which_key_map.b = {
      \ 'name' : '+tabs' ,
      \ '-' : ['<Plug>AirlineSelectPrevTab','previous tab'] ,
      \ '+' : ['<Plug>AirlineSelectNextTab','next tab'] ,
      \ 'd' : [':Bwipeout','close buffer'] ,
      \ 'e' : [':enew','edit new buffer'] ,
      \ 'f' : [':IndentBlanklineRefresh'    , 'refresh indent line']            ,
      \}
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
call which_key#register('<Space>', "g:which_key_map")
