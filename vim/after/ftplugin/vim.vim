if exists('b:loaded_ftplugin_vim') || &cp || version < 700
  finish
endif
let b:loaded_ftplugin_vim = 1

setlocal foldmethod=marker
