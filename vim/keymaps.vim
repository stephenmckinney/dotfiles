" ======================================================================
" General Key Mappings
" ======================================================================
" <,> is the leader character
let mapleader = ","

" It's not like :W is bound to anything anyway.
command! W :w

" Page up/Page down: Space/Ctrl-Space
nnoremap <Space> <C-d>
nnoremap <C-@> <C-u>

" New tab
nmap <silent> <C-t> :tabnew<CR>

" Window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
" Split window vertically
nmap <leader>v <C-w>v<C-w>l
" Split window horizontally
nmap <leader>s <C-w>s<C-w>j
" Close all but current
nmap <leader>o <C-w>o
" Cycle through all windows
nmap <leader>w <C-w>w
" Exchange with other window
nmap <leader>x <C-w>x
" Adjust viewports to the same size
nmap <leader>= <C-w>=
" Toggle ZoomWin
nmap <silent> <leader>z :ZoomWin<CR>

" Quicklist navigation
nmap <silent> <leader>n :cnext<CR>
nmap <silent> <leader>N :cprevious<CR>

" Turn off hightlight search
nnoremap <silent> <CR> :noh<CR>

" Edit/source vimrc file
nmap <leader>ev :tabnew<CR>\|:NERDTree ~/.vim<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" View Rails source
command! Rsource :tabnew | NERDTree ~/code/src/rails

" Make j and k move by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Make Y consistent with C and D: Yank from the cursor to the end of the line
" Customized for YankRing
function! YRRunAfterMaps()
  nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" Maintain selection after indent
vmap > >gv
vmap < <gv

" Toggle paste mode
set pastetoggle=<F1>

" Code folding options
nmap <silent> <D-0> :set foldlevel=99<CR>
nmap <silent> <D-1> :set foldlevel=0<CR>
nmap <silent> <D-2> :set foldlevel=1<CR>
nmap <silent> <D-3> :set foldlevel=2<CR>
nmap <silent> <D-4> :set foldlevel=3<CR>
nmap <silent> <D-5> :set foldlevel=4<CR>
nmap <silent> <D-6> :set foldlevel=5<CR>
nmap <silent> <D-7> :set foldlevel=6<CR>
nmap <silent> <D-8> :set foldlevel=7<CR>
nmap <silent> <D-9> :set foldlevel=8<CR>


" ======================================================================
" Plugin Key Mappings
" ======================================================================
" Ack
" Ack ignores are stored in ~/.ackrc
nmap <leader>f :Ack!<space>

" CtrlP
nmap <silent> <leader>t :CtrlP<CR>
nmap <silent> <leader>T :ClearCtrlPCache<CR>\|:CtrlP<CR>
nmap <silent> <leader>b :CtrlPBuffer<CR>
nmap <silent> <leader>B :BufOnly<CR>
" Rails CtrlP Mappings - taken from:
" https://github.com/skwp/dotfiles/blob/master/vim/plugin/settings/ctrlp.vim
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
nmap <leader>ja :CtrlP app/assets<CR>
nmap <leader>jc :CtrlP app/controllers<CR>
nmap <leader>jh :CtrlP app/helpers<CR>
nmap <leader>jm :CtrlP app/models<CR>
nmap <leader>jv :CtrlP app/views<CR>
nmap <leader>jf :CtrlP test/fixtures<CR>
nmap <leader>jF :CtrlP features<CR>
nmap <leader>jl :CtrlP lib<CR>
nmap <leader>jp :CtrlP public<CR>
nmap <leader>js :CtrlP spec<CR>
"nmap <leader>jF :CtrlP spec/factories<CR>
nmap <leader>jt :CtrlP test<CR>
nmap <leader>jd :CtrlP db<CR>
nmap <leader>jC :CtrlP config<CR>
nmap <leader>jV :CtrlP vendor<CR>
"Cmd-(m)ethod - jump to a method (tag in current file)
nmap <leader>m :CtrlPBufTag<CR>
"Ctrl-(M)ethod - jump to a method (tag in all files)
nmap <leader>M :CtrlPBufTagAll<CR>

" Fugitive & Gitv
command! -range Dg <line1>,<line2>diffget | diffupdate
command! -range Dp <line1>,<line2>diffput | diffupdate
nmap <leader>gb :Gblame<CR>
nmap <leader>gh :Gbrowse<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gv :Gitv --all<CR>
nmap <leader>gV :Gitv! --all<CR>
vmap <leader>gV :Gitv! --all<CR>

" NarrowRegion
xmap <leader>nr <Plug>NrrwrgnDo

" NERDTree
nmap <silent> <leader>d :NERDTreeToggle<CR>
nmap <leader>e :NERDTree<space>

" QFix
" Toggle Quickfix window
nmap <silent> <leader>q :QFix<CR>

" ri.vim
" RI documention
nnoremap <silent> <leader>K :call ri#OpenSearchPrompt(0)<cr>
nnoremap <silent> <leader>k :call ri#OpenSearchPrompt(1)<cr>
"nnoremap <silent> <leader>K :call ri#LookupNameUnderCursor()<cr>

" Rainbow Parantheses
"nmap <leader>r :RainbowParenthesesToggle<CR>

" Tagbar
" Toggle Tagbar
nmap <silent> <leader>c :TagbarToggle<CR>

" Tabular
nmap <leader>a  :Tabularize /
vmap <leader>a  :Tabularize /
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:<CR>
vmap <leader>a: :Tabularize /:<CR>

" Vim-Turbux
nmap <leader>r <Plug>SendTestToTmux
nmap <leader>R <Plug>SendFocusedTestToTmux
