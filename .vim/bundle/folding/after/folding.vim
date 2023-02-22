function! CommentFolds()
  let thisline = getline(v:lnum)

  if match(thisline, '^##') >= 0
    return ">2"
  elseif match(thisline, '^#') >= 0
    return ">1"
  else 
    return "="
  endif

endfunction

function! CommentDownFoldText()
  return getline(v:foldstart)
endfunction

function! NoEmptyLines(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif
  return 0
endfunction 

function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum +1
    while current <= numlines
      if getline(current) =~? '\v\S'
        return current
      endif
      let current +=1
    endwhile
    return -2
endfunction

function! IndentLevel(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction

setlocal foldmethod=expr
setlocal foldexpr=CommentFolds()
setlocal foldtext=CommentDownFoldText()
