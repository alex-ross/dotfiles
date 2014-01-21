" if !exists('*RubyMethodFold')
"   function! RubyMethodFold(line)
"     " First column which aren't an whitespace.
"     let column = match(getline(a:line), '\S')+1
"     if column == 0
"       let column = 1
"     endif
"
"     " Get array if syntax name used for first word or character.
"     let stack = map(synstack(a:line, column), 'synIDattr(v:val, "name")')
"
"     for syn_name in stack
"       if syn_name == "rubyMethodBlock" || syn_name == "rubyDefine"
"         return "1"
"       endif
"     endfor
"
"     return "0"
"   endfunction
" endif
"
" setlocal foldexpr=RubyMethodFold(v:lnum)
" setlocal foldmethod=expr
setlocal foldmethod=syntax

if !exists("*RubyFoldText")
  function! RubeFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart(repeat(foldchar, indent(v:foldstart)-1) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
  endfunction
endif

setlocal foldtext=RubeFoldText()

" Resets folding when syntax of file changes
let b:undo_ftplugin = "setlocal foldtext< foldmethod< foldexpr<"
