" vim-which-key
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode noruler
let g:which_key_map =  {}
let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
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
      \ 'f' : ['Windows'    , 'fzf-window']            ,
      \ 'c' : ['<Plug>(choosewin)'    , 'choose window'],
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

let g:which_key_map.f = {
      \ 'name' : '+leaderf' ,
      \ 'f' : 'file' ,
      \ 'b' : 'buffer' ,
      \ 'm' : 'mru' ,
      \ 'n' : 'function' ,
      \ 'l' : 'line' ,
      \ 's' : 'search' ,
      \ 't' : 'buffer tag' ,
      \ 'w' : 'display window' ,
      \ 'a' : 'search cursor on word' ,
      \}

let g:which_key_map.b = {
      \ 'name' : '+tabs' ,
      \ '-' : ['<Plug>AirlineSelectPrevTab','previous tab'] ,
      \ '+' : ['<Plug>AirlineSelectNextTab','next tab'] ,
      \ 'd' : [':Bwipeout','close buffer'] ,
      \ 'e' : [':enew','edit new buffer'] ,
      \ 'b' : ['Buffers'    , 'fzf-buffer']            ,
      \}
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
call which_key#register('<Space>', "g:which_key_map")
