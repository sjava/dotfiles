if exists('g:GtkGuiLoaded')
  " some code here
  call rpcnotify(1, 'Gui', 'Font', 'IBMPlexMono Nerd Font Mono 13')
  " call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  let g:GuiInternalClipboard = 1
endif