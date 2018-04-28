if exists('g:GtkGuiLoaded')
  " some code here
  call rpcnotify(1, 'Gui', 'Font', 'Fira Code 14')
  " call rpcnotify(1, 'Gui', 'Font', 'Iosevka 14')
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  let g:GuiInternalClipboard = 1
endif
