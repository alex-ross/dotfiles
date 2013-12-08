if !exists('*RubyMethodFold')
  function! RubyMethodFold(line)
    " First column which aren't an whitespace.
    let column = match(getline(a:line), '\S')+1
    " Get array if syntax name used for first word or character.
    let stack = map(synstack(a:line, column), 'synIDattr(v:val, "name")')

    for syn_name in stack
      if syn_name == "rubyMethodBlock" || syn_name == "rubyDefine" || syn_name == "rubyDocumentation"
        return "1"
      endif
    endfor

    return "0"
  endfunction
endif

setlocal foldexpr=RubyMethodFold(v:lnum)
setlocal foldmethod=expr

if !exists("*RubyFoldText")
  function! RubeFoldText()
    let fold_size = (v:foldend - v:foldstart)
    return getline(v:foldstart) . ' [' . fold_size . ' lines]'
  endfunction
endif

setlocal foldtext=RubeFoldText()

" Resets folding when syntax of file changes
let b:undo_ftplugin = "setlocal foldtext< foldmethod< foldexpr<"
