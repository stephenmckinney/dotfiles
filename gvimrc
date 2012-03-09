" ======================================================================
" UI
" ======================================================================
if has("gui_macvim")
  " Fullscreen
  set fuoptions=maxhorz,maxvert
  au GUIEnter * set fullscreen
  " Remove toolbar
  set guioptions-=T
endif


" ======================================================================
" Key mappings Commands
" ======================================================================
" Page up/Page down (only work in mvim/gvim)
nnoremap <Space> <C-d>
nnoremap <S-Space> <C-u>

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
