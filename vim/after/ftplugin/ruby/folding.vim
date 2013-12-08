let s:next_fold_closing = '='

function! RubyFolds(line)
  let this_line = getline(a:line)
  " Get column number of firs character
  let column = match(this_line, '\S')+1
  let is_ruby_define = synIDattr(synID(a:line,column,0), 'name') == 'rubyDefine'

  if is_ruby_define && this_line =~ '\s*def '
    " Start folding if its an "rubyDefine" according to syntax highlight and if
    " it starts with "def".
    return ">1"
  elseif is_ruby_define && this_line =~ '\s*end'
    " Continue the same fold level if it's an "rubyDefine" according to syntax
    " highlight. Also set "next_fold_closing" to "0" which will close the fold
    " on next line if we reach the "else" block.
    let s:next_fold_closing = "0"
    return "="
  else
    " Return "next_fold_closing" but also resets it to "="
    let close_val = s:next_fold_closing
    let s:next_fold_closing = "="
    return close_val
  end
endfunction
setlocal foldmethod=expr
setlocal foldexpr=RubyFolds(v:lnum)

" Change fold text.
" ex: def my_method [10 lines]
function! RubeFoldText()
  let fold_size = (v:foldend - v:foldstart)
  return getline(v:foldstart) . ' [' . fold_size . ' lines]'
endfunction
setlocal foldtext=RubeFoldText()
