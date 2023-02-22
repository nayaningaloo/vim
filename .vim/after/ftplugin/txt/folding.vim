function! TxtFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^##') >= 0
    return ">2"
  endif
  return "1"
endfunction

setlocal foldcolumn=3
setlocal foldmethod=expr
setlocal foldexpr=TxtFolds()

function! TxtFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).'('.foldsize.'lines)'
endfunction
setlocal foldtext=TxtFoldText()

