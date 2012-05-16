" ======================================================================
" General Key Mappings
" ======================================================================
" <,> is the leader character
let mapleader = ","

" It's not like :W is bound to anything anyway.
command! W :w

" Page up/Page down
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

" Turn off hightlight search
nnoremap <silent> <CR> :noh<CR>

" Edit vimrc file
nmap <leader>ev :tabnew $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" Make j and k move by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Make Y consistent with C and D
nnoremap Y y$

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
nmap ,jm :CtrlP app/models<CR>
nmap ,jc :CtrlP app/controllers<CR>
nmap ,jv :CtrlP app/views<CR>
nmap ,jh :CtrlP app/helpers<CR>
nmap ,jl :CtrlP lib<CR>
nmap ,jp :CtrlP public<CR>
nmap ,js :CtrlP spec<CR>
nmap ,jf :CtrlP factories<CR>
nmap ,jt :CtrlP test<CR>
nmap ,jd :CtrlP db<CR>
nmap ,jC :CtrlP config<CR>
nmap ,jV :CtrlP vendor<CR>

" Fugitive
command! -range Dg <line1>,<line2>diffget
command! -range Dp <line1>,<line2>diffput

" NarrowRegion
xmap <leader>n <Plug>NrrwrgnDo

" NERDTree
nmap <silent> <leader>d :NERDTreeToggle<CR>
nmap <leader>e :NERDTree<space>

" QFix
" Toggle Quickfix window
nmap <silent> <leader>q :QFix<CR>

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

