function! <SID>IsKey(line)
  let column = indent(a:line) + 1
  let stack = map(synstack(a:line, column), 'synIDattr(v:val, "name")')
  return index(stack, "yamlBlockMappingKey") >= 0
endfunction

function! YamlFoldMethod(line)
  if indent(a:line) < indent(a:line-1) && s:IsKey(a:line) && s:IsKey(a:line-1)
    " Start new fold when current line is less indented than previous one and
    " both lines starts with a yaml key
    return '>' . (indent(a:line) / 2)
  elseif indent(a:line) < indent(a:line+1) && s:IsKey(a:line) && s:IsKey(a:line+1)
    " Start new fold when current line is less indented than next one and both
    " lines starts with a yaml key
    return '>' . (indent(a:line) / 2)
  else
    " Else keep foldlevel from previous line.
    return '='
  endif
endfunction

function! YamlFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart(repeat(foldchar, indent(v:foldstart)-1) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

" Uncomment while debugging
" setlocal foldcolumn=10

setlocal foldmethod=expr
setlocal foldexpr=YamlFoldMethod(v:lnum)
setlocal foldtext=YamlFoldText()

let b:undo_ftplugin = "setlocal foldtext< foldmethod< foldexpr< foldcolumn<"
