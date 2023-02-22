if did_filetype() " filetype already set..
  finish    " ..don't do these checks
endif
if getline(1) =~? '^-----B'
  setfiletype PEM
  set foldmethod=marker
  set foldmarker=^-----B,^-----E
"elseif getline(1) =~? '\<drawing\>'
  "setfiletype drawing
endif
