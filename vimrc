" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Plugins
"    -> Configure Plugins
"    -> Misc
"    -> Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" make backspaces delete sensibly
set backspace=indent,eol,start

set path+=**

""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""
"Add number line"
set number

" Show matching brackets when text indicator is over them
set showmatch

" Highlight search results
set hlsearch

" Height of the command bar
set cmdheight=2

"Always show current position
set ruler

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on 

" Use theme
try
    colorscheme spawn
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Set  no wrap lines
set nowrap 

""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin manager
Plugin 'VundleVim/Vundle.vim' 

"Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Navegador archivos
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" Developer
Plugin 'vim-syntastic/syntastic'
Plugin 'shougo/neocomplete.vim' "Completado codigo
Plugin 'SirVer/ultisnips' " Manager snippets
Plugin 'honza/vim-snippets' "Collection snippets
Plugin 'jiangmiao/auto-pairs.git' "Insert or delete brackets, parens, quotes in pair.

" Javascript
Plugin 'pangloss/vim-javascript' "Best javascript

" Html
Plugin 'othree/html5.vim' " html completion 

" Bootsrap 4
Plugin 'jvanja/vim-bootstrap4-snippets'

" typescript
"
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'hell-spawn/vim-angular2-snippets'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
"========================================
" Vundle plugin Manager
"========================================
" All of your Plugins must be added before the following line
call vundle#end() 


"========================================
" Syntastic 
"========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']

"========================================
" Ultisnips 
"========================================
" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" List Snippes
let g:UltiSnipsListSnippets="<F3>"

let g:UltiSnipsSnippetDirectories=["~/.vim/snippets/", "UltiSnips"]

"========================================
" vim-airline
"========================================
"This is disabled by default; add the following to your vimrc to enable the extension:
let g:airline#extensions#tabline#enabled = 1

"Set vim-airline theme
let g:airline_theme='powerlineish'


"========================================
" CtrlP
"========================================
" Exclude files and directories using Vim's wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" CtrlP will set its local working directory according

" Ignore Files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_use_caching = 0
"
"========================================
" TypeScript
"========================================
"
"
"========================================
" NeoCompletme
"========================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Omni completation
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""

augroup filetypedetect
    au BufRead,BufNewFile *.ts set filetype=typescript
augroup END



""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap \d :bp<cr>:bd #<cr>

inoremap <C-_> <Esc>:call <SID>InsSemiColon()<CR>
function! <SID>InsSemiColon() abort
    let l:line = line('.')
    let l:content = getline('.')
    let l:eol = ';'
    " If the line ends with a semicolon we simply insert one.
    if l:content[col('$') - 2] ==# ';'
        normal! a;
        normal! l
        startinsert
    else
        if search('(', 'bcn', l:line)
            let l:eol = search(')', 'cn', l:line) ?  ';' : ');'
        endif
        call setline(l:line, l:content . l:eol)
        startinsert!
    endif
endfunction
