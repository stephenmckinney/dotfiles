" MacVim should go fullscreen
if has("gui_macvim")
  " Fullscreen
  set fuoptions=maxhorz,maxvert
  au GUIEnter * set fullscreen
  " Remove toolbar
  set guioptions-=T
endif


" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
