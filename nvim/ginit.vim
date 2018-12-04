if exists('g:GtkGuiLoaded')
  " some code here
  " call rpcnotify(1, 'Gui', 'Font', 'Fira Code 14')
  call rpcnotify(1, 'Gui', 'Font', 'Sarasa Mono SC 16')
  " call rpcnotify(1, 'Gui', 'Font', 'IBMPlexMono 13')
  " call rpcnotify(1, 'Gui', 'Font', 'Iosevka 14')
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')
  let g:GuiInternalClipboard = 1
endif
