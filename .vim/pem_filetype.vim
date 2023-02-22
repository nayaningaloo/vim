if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.cabundle\|cer\|crt\|der   setfiletype PEM
  au! BufRead,BufNewFile *.p12\|p7b\|p7c\|pem\|pfx   setfiletype PEM
  au! BufRead,BufNewFile *.xyz    setfiletype testingfile
augroup END

"if did_filetype() " filetype already set..
"  finish    " ..don't do these checks
"endif
"if getline(1) =~? '^-----B'
"  setfiletype PEM
"  set foldmethod=marker
"  set foldmarker=-----B,-----E
""elseif getline(1) =~? '\<drawing\>'
"  "setfiletype drawing
"endif
