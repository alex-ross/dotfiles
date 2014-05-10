" set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|doc)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_by_filename=1
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',ff'
nnoremap <silent> <leader>ff :CtrlP<CR>
nnoremap <silent> <leader>ft :CtrlPTag<CR>


