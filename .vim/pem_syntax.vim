if exists("b:current_syntax")
"echom "Syntax here"
  finish
endif

"echom "My Syntax here"

"syntax keyword PEMKeyword BEGIN
"highlight link PEMKeyword Keyword

"syntax match PEMBeginCA '^----B.*$'
"highlight link PEMBeginCA match 
"
"syntax region Certs start="^-----B.*$" end="^-----E.*$"
"highlight link Certs region
"
syn region PEMFold start="^-----B" end="^-----E"
syn sync fromstart
set foldmethod=syntax

let b:current_syntax = "PEM"
