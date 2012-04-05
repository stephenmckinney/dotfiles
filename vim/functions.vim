" ======================================================================
" Functions
" ======================================================================
" Strip trailing whitespace
" Taken from: http://vimcasts.org/episodes/tidying-whitespace/
function! s:StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Wrap text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

" Wrap text and allow preview
function! s:setupMarkup()
  call s:setupWrapping()
  " Preview in Marked.app
  nmap <silent> <leader>p :<C-u>silent !open -a Marked.app '%:p'<CR><C-l>
endfunction

" NERDTree Customizations (taken from Janus)
" https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/nerdtree.vim
" If the parameter is a directory, cd into it
function! s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function! s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction


" ======================================================================
" Filetypes and autocmds
" ======================================================================
if has("autocmd")
  augroup poorlilrichboy
    au!
    " Indention
    "   FYI: rb, html, css, js indention are handled by the default vim support
    au FileType htmldjango setlocal textwidth=200 " stop fucking up my HTML
    au FileType make   setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
    au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
    au FileType ruby setlocal foldmethod=syntax
    au FileType ruby compiler ruby
    au BufRead,BufNewFile *.{rdoc,md,markdown,mdown,mkd,mkdn,txt} call s:setupMarkup()

    " Strip trailing whitespace on save
    au BufWritePre *.rb,*.py,*.html,*.css,*.js :call s:StripTrailingWhitespaces()

    " Remember last location in file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif

    " NERDTree Customizations (taken from Janus)
    " https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/nerdtree.vim
    au VimEnter * call s:CdIfDirectory(expand("<amatch>"))
    au FocusGained * call s:UpdateNERDTree()
    " Quit NERDTree when there are no active windows
    " Taken from https://github.com/scrooloose/nerdtree/issues/21
    au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  augroup END
endif
