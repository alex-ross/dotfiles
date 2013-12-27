" set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\node_modules$'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " No max limit for files
  let g:ctrlp_max_files = 0
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> <leader>t :CtrlP<CR>
nnoremap <silent> <leader>gf :CtrlP<CR>
nnoremap <silent> <leader>gt :CtrlPTag<CR>


