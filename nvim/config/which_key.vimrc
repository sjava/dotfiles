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
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'h' : 'hover' ,
      \ 's' : 'signature_help' ,
      \ 't' : 'type_definition' ,
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : 'definition'       ,
        \ 'i' : 'implementation'       ,
        \ 'r' : 'references'       ,
        \ 'c' : 'declaration'       ,
        \ 's' : 'document_symbol'       ,
        \ 'w' : 'workspace_symbol'       ,
        \ },
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
      \ 'a' : 'search cursor on word' ,
      \}

let g:which_key_map.b = {
      \ 'name' : '+tabs' ,
      \ '1' : ['<Plug>AirlineSelectTab1','tab1'] ,
      \ '2' : ['<Plug>AirlineSelectTab2','tab2'] ,
      \ '3' : ['<Plug>AirlineSelectTab3','tab3'] ,
      \ '4' : ['<Plug>AirlineSelectTab4','tab4'] ,
      \ '5' : ['<Plug>AirlineSelectTab5','tab5'] ,
      \ '6' : ['<Plug>AirlineSelectTab6','tab6'] ,
      \ '7' : ['<Plug>AirlineSelectTab7','tab7'] ,
      \ '8' : ['<Plug>AirlineSelectTab8','tab8'] ,
      \ '9' : ['<Plug>AirlineSelectTab9','tab9'] ,
      \ '-' : ['<Plug>AirlineSelectPrevTab','previous tab'] ,
      \ '+' : ['<Plug>AirlineSelectNextTab','next tab'] ,
      \ 'd' : [':Bwipeout','close buffer'] ,
      \ 'e' : [':enew','edit new buffer'] ,
      \}
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
call which_key#register('<Space>', "g:which_key_map")

