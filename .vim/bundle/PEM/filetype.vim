if exists("did_load_filetypes")
  finish
endif

au BufRead,BufNewFile *.cabundle\|cer\|crt\|der   setfiletype PEM
au BufRead,BufNewFile *.p12\|p7b\|p7c\|pem\|pfx   setfiletype PEM
au BufRead,BufNewFile * if getline(1) =~? '^-{5}b' || getline(1) =~? '^certificate:' | setfiletype PEM | endif

nmap X509 zaV/-----END<ENTER>:!openssl x509 -text<ENTER>zM
"nmap X509 zoV/-----END<ENTER>:!openssl x509 -text<ENTER>zC

"nmap <S-F8> zaV/-----END<CR>:!openssl x509 -text<CR>zM


function! GetCertInfo(lnum)

return zaV/-----END<CR>:!openssl x509 -text<CR>zM

"  if getline(a:lnum) =~? '^-{5}b' && foldlevel('.') == 0
"    return V/-----END<CR>:!openssl x509 -text<CR>zc
"  else if getline(a:lnum) =~? '^-{5}b' && foldlevel('.') != 0
"    return zoV/-----END<CR>:!openssl x509 -text<CR>zc
"  endif
  

endfunction

nmap <S-F8> GetCertInfo(a:lnum)
