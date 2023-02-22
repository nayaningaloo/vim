" vim: foldmethod=marker
set foldmethod=expr 
set foldexpr=GetPEMfold(v:lnum)
set foldtext=SetFoldTextCN()

function! GetPEMfold(lnum)
"{{{1
  if getline(a:lnum) =~? '\v^\s*$' 
    return '-1'
  elseif  getline(a:lnum) =~? '\v^certificate:'
    return '>1'
  elseif  getline(a:lnum) =~? '\v^-{5}begin\scertificate-{5}'
    return '>1'
  endif

  let this_indent = GetShiftLevel(a:lnum)
  let next_indent = GetShiftLevel(GetNonBlankLines(a:lnum))
  let begin_cert  = GetShiftLevel(GetBeginCertificate(a:lnum))

  if this_indent == begin_cert 
    return '1' 
  elseif this_indent == next_indent || this_indent > next_indent
    return this_indent 
  elseif this_indent < next_indent
    return '>' . next_indent
  endif

endfunction
"}}}

function! GetShiftLevel(lnum)
"{{{1
  "return indent(a:lnum) / &shiftwidth
  return indent(a:lnum) / 4
endfunction
"}}}
  
function! GetNonBlankLines(lnum)
"{{{1
  let numlines  = line('$')
  let current   = a:lnum + 1

  while current <= numlines
    if getline(current) =~? '\v\S'
      return current
    endif

    let current += 1

  endwhile

  return -2
endfunction
"}}}

function! GetBeginCertificate(lnum)
"{{{1
    let numlines  = line('$')
    let current   = a:lnum + 1

    while current <= numlines
      if getline(current) =~? '\v^-{5}begin\scertificate-{5}'
        return current
      endif

      let current += 1
    endwhile

endfunction
"}}}

function! SetFoldTextCN()
"{{{1

  let line              = getline(v:foldstart)
  let lines_count       = v:foldend - v:foldstart + 1
  let lines_count_text  = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar          = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart     = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend       = lines_count_text . repeat(foldchar, 8)

  if match( line, 'Certificate:.*' ) == 0
    let current   =  line + 1

    while current <= lines_count
      if ( getline(current) =~? 'CN\s*=.*')
        let inLine  = getline(current)
        let CName   = substitute( inLine, '.*CN\s*=\(.*$\)', "\\1", 'g')
      endif
      let current += 1
    endwhile
    
    let foldtextlength = strlen(substitute(foldtextstart . CName . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . ' ' . CName . repeat(foldchar, winwidth(0)-foldtextlength-1) . foldtextend

  else
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
  endif

endfunction
"}}}
