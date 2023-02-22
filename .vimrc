" vim: foldmethod=marker
" Default Leader is \
execute pathogen#infect()
"{{{1 Packadd
"ubuntu 21.10 packadd
"packadd! ale
packadd! winmanager
packadd! AlignPlugin
packadd! alternateFile
packadd! bufexplorer
packadd! calendar
"packadd! closetag
"packadd! color_sampler_pack
"packadd! cvsmenu
packadd! debPlugin
packadd! detectindent
"packadd! doxygen-toolkit
"packadd! dtd2vim
"packadd! EnhancedCommentify
packadd! gnupg
packadd! info
"packadd! lbdbq
"packadd! minibufexpl
"packadd! nerd-commenter
packadd! omnicppcomplete
packadd! project
packadd! python-indent
packadd! secure-modelines
"packadd! snippetsEmu
"packadd! supertab
"packadd! surround
packadd! taglist
packadd! tetris
"packadd! utl
"packadd! VCSCommand
"packadd! vimplate
"packadd! VimSokoban
packadd! whatdomain
packadd! winmanager
packadd! xmledit"
"}}}
"
"{{{1 "automatic reload vimrc
autocmd! bufwritepost ~/.vimrc source %
"
"{{{1 " Rust
"syntax enable
filetype plugin indent on
"will enable automatic running of :RustFmt when you save a buffer.
let g:rustfmt_autosave = 1
" :help rust-syntastic
" :help :RustFmt
" :RustTest
" :help rust. Helptags (:help helptags)
" :Helptags
" }}}


"{{{1 " Syntax Colorings
"colors xoria256
"colors mizore
"colors neverness
colors murphy

"{{{1 " Addonconfig
let vimrcs = split( globpath( '~', '.vimrc*') ) 
let g:tabulator_loaded = 1
" https://github.com/dense-analysis/ale#standard-installation
let g:ale_enabled = 1

"Calendar
let g:calendar_frame = 'default'

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['yaml'] = 'yaml,ansible-icinga,k8s'
" }}}


"{{{1 " Compile
" C++ Compile
map <F9> :!g++ -g % -o %:r && ./%:r <CR>
map <F12> :!gdb ./%:r <CR>

" Run Python3
map <F8> :!python3 ./% <CR>
"

"{{{1 " spellcheck
set dictionary=/usr/share/dict/words
map <F6>  :setlocal spell spelllang=de <return>
map <F7>  :setlocal spell spelllang=en <return>
" }}}
"{{{1 global
:set number
:syntax on
:set bg=dark
:set ts=2
:set shiftwidth=2
":set expandtab
:set ai
":set foldmethod=indent
":setlocal foldmethod=manual
":retab
:set modeline
:set modelines=20
":set encoding=UTF-8
:set history=50
:set nocompatible
:set ruler		" show the cursor position all the time
:set showmode
:set showcmd		" display incomplete commands
:set hlsearch
au VimResized * :wincmd = "resize splits in vim on windowresize


"{{{2 Filetipeplugin
":filetype plugin on
:set omnifunc=syntaxcomplete#Complete
:filetype plugin indent on
  "autocmd FileType text setlocal textwidth=78
"set runtimepath=~/.vim,~/.vim/bundle/PEM,$VIMRUNTIME

"{{{2 " search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch


"{{{2 " ctags
"ctags --list-maps=all

" go to next/previous tag
nnoremap <leader>f :tnext<cr>
nnoremap <leader>d :tprev<cr>
nnoremap <leader>tj :tjump<cr>
"


"{{{2 " To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬


"{{{2 " Wildmenu completion 
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig,*.rej "Merge resolution files"

"{{{1 " LaTex
"
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
 
"{{{1 " maps

":nmap x509 V/-----END<ENTER>:!openssl x509 -text<ENTER>zM
":nmap X509 zaV/-----END<ENTER>:!openssl x509 -text<ENTER>zM
":nmap <c-x>509 zaV/-----END<ENTER>:!openssl x509 -text<ENTER>zM
:map <Leader>x509 zaV/-----END<ENTER>:!openssl x509 -text<ENTER>zM
":nmap X509 zaV/-----END<ENTER>:!openssl x509 -text<ENTER>zM

"{{{1 " winmanager
:map <c-w><c-t> :WMToggle<cr>
:map <c-w><c-f> :FirstExplorerWindow<cr>
:map <c-w><c-b> :BottomExplorerWindow<cr>

"{{{1 " taglist
:map <c-t><c-t> :TlistToggle<cr>

"{{{ Tablist
:map <c-n><c-t> :n<cr>
:map <c-b><c-t> :prev<cr>
:map <c-f><c-t> :rew<cr>
:map <c-l><c-t> :last<cr>

"{{{2 " folding
:map <c-f><c-i> :set foldmethod=indent<cr>
:map <c-f><c-h> :setlocal foldmethod=manual<cr>

"{{{2 pastetoggle
:map <c-F10> :set paste<CR>
:map <c-F11> :set nopaste<CR>
:imap <c-F10> <C-O>:set paste<CR>
:imap <c-F11> <nop>
:set pastetoggle=<F11>

"{{{2 i like to move it move it
"vnoremap < <gv
"vnoremap > >gv

"{{{2 misc

nnoremap <leader>ft vatzf

" {{{1 " PREVENTING LOADING netrw-noload  
" " If you want to use plugins, but for some reason don't wish to use netrw,
" then
" you need to avoid loading both the plugin and the autoload portions of
" netrw.
" You may do so by placing the following two lines in your <.vimrc>:
" :help netrw
:let g:loaded_netrw       = 1
:let g:loaded_netrwPlugin = 1


" {{{1 " great commands - realy great commands
" have a look @ :help iabbrev
" :iabbrev wrod word
" :syntax keyword WordError wrod
" remove word, office linebreaks
" :set tw=0 wrap linebreak

" :digraphs
" to use digraphs in vim CTRL + K + digraph
" :set foldmethod=marker
" :set foldmethod=indent
" :set incsearch
" :registers
" :mk "vim schreibt sich eine config .exrc dennoch cool für paar sachen, kann
" frau sich ja immernoch in die vimrc pasten
" :set fileformat=dos
"~/.ssh/id_rsa :set fileformat=unix

" set cursorline
" }}}
" {{{1 " Edit .vimrc file 
nmap <silent> <leader>ov :e $MYVIMRC<CR>
nmap <silent> <leader>sv :w<CR> :so $MYVIMRC<CR>

" }}}
" {{{1 configuration omni completion

filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main

if v:version >= 600
    filetype plugin on
    filetype indent on
else
    filetype on
endif

if v:version >= 700
    set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
    "let g:SuperTabDefaultCompletionType = "<C-@>"
    let OmniCpp_NamespaceSearch     = 1
    let OmniCpp_GlobalScopeSearch   = 1
    let OmniCpp_DisplayMode         = 1
    let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
    let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
    let OmniCpp_ShowAccess          = 1 "show access in pop-up
    let OmniCpp_SelectFirstItem     = 2 "select first item in pop-up
    let OmniCpp_MayCompleteDot      = 1
    let OmniCpp_MayCompleteArrow    = 1
    let OmniCpp_MayCompleteScope    = 1
    let OmniCpp_DefaultNamespaces   = ['std','_GLIBCXX_STD']

    set completeopt=menuone,menu,longest,preview
endif
" }}}
" {{{1 " Commenting blocks of code.
autocmd FileType c,cppva,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>uc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>'"'"
" }}}
" {{{1 " " USING VIM AS HEX EDITOR
map <Leader>hon :%!xxd<CR>
map <Leader>hof :%!xxd -r<CR>
map <Leader>bon :%!base64<CR>
map <Leader>bof :%!base64 -d<CR>
" }}}
" {{{1 " VIM-airline  plugin
" https://github.com/bling/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_c = airline#section#create(['%F'])
endfunction
autocmd VimEnter * call AirlineInit()

  let g:airline_theme_patch_func = 'AirlineThemePatch'
  function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
      for colors in values(a:palette.inactive)
        let colors[3] = 245
      endfor
    endif
  endfunction
" }}}


iabbr /** /************************************************************************
iabbr **/ ************************************************************************/
iabbr //- //-----------------------------------------------------------------------

