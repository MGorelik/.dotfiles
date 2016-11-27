" vim: fdm=marker foldenable sw=4 ts=4 sts=4
" Thanks to Max Cantor's .vimrc File for the folding
" "zo" to open folds, "zc" to close, "zn" to disable.

" {{{ Clear all autocommands

au!

" }}}

" Plugins and Settings {{{
 
" Run pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
 
" Make sure color is being used
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	set t_Co=256
endif

    " Status Bar {{{

    " Airline config
    set laststatus=2
    let g:Powerline_symbols = 'unicode'
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_symbols.space = "\ua0"

    " }}}

" Autocomplete {{{

" YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python2.7'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" }}}

" Python IDE {{{

" python-mode
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

" }}}

" }}}

" Basic Settings {{{

" fish has issues so let's use zsh
set shell=zsh

" The colorscheme
" colorscheme coffee
" colorscheme molokai
let g:zenburn_transparent=1
colorscheme zenburn
" Override the black background so we can see the iTerm2 background image
hi Normal guibg=NONE ctermbg=NONE

" Splits
set splitright
 
" Buffers
set history=500
set hidden
if exists("&undofile")
    set undofile
endif

" Spelling
set dictionary+=/usr/share/dict/words thesaurus+=$HOME/.thesaurus

" Typing behavior
set backspace=indent,eol,start

" Formatting
"set nowrap
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set foldlevelstart=2

" Set 80 character width indicator
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Status line
set statusline=%{fugitive#statusline()}

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Word splitting
set iskeyword+=-

" Fuzzy File Search {{{

" Ctrl+P
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" }}}

" }}}

" Autocommands {{{

" Auto source this file when saved
au bufwritepost .vimrc source %

" Folding
au FileType html,htmldjango,css,sass,javascript,coffee,python,ruby,eruby setl foldmethod=indent foldenable

" Other
au FileType python let b:python_highlight_all=1

" }}}

" Backups & .vimrc Editing {{{

if has('win32')
    " Windows filesystem
    set directory=$HOME\VimBackups\swaps,$HOME\VimBackups,C:\VimBackups,.
    set backupdir=$HOME\VimBackups\backups,$HOME\VimBackups,C:\VimBackups,.
    if exists("&undodir")
        set undodir=$HOME\VimBackups\undofiles,$HOME\VimBackups,C:\VimBackups,.
    endif
    if has("gui_running")
      set guifont=Inconsolata:h12:cANSI
    endif
else
    " POSIX filesystem
    set directory=$HOME/.backups/swaps,$HOME/.backups,$HOME/tmp,.
    set backupdir=$HOME/.backups/backups,$HOME/.backups,$HOME/tmp,.
    if exists("&undodir")
        set undodir=$HOME/.backups/undofiles,$HOME/.backups,$HOME/tmp,.
    endif
endif

" }}}

" Key Mappings {{{

" Leader key
let mapleader = "\<Space>"
 
" Line numbers
nnoremap <leader>l :setlocal number!<CR>

" Paste mode (maintains formatting)
nnoremap <leader>p :set paste!<CR>

nnoremap j gj
nnoremap k gk

" Grep Shortcuts {{{

nnoremap \, :grep -Rins --exclude-dir={migrations,python2.7,site-packages} --include \*.py --include \*.html --include \*.coffee --include \*.scss 
nnoremap \. :grep -Rns --exclude-dir={migrations,python2.7,site-packages} --include \*.py --include \*.html --include \*.coffee --include \*.scss <cword> .<CR>
nnoremap \p :grep -Rins --exclude-dir={migrations,python1.7} --include \*.py 
nnoremap \P :grep -Rns --exclude-dir={migrations,python1.7} --include \*.py <cword> .<CR>
nnoremap \c :grep -Rins --include \*.coffee 
nnoremap \C :grep -Rns --include \*.coffee <cword> .<CR>
nnoremap \h :grep -Rins --exclude-dir={site-packages} --include \*.html 
nnoremap \H :grep -Rns --exclude-dir={site-packages} --include \*.html <cword> .<CR>
nnoremap \s :grep -Rins --include \*.scss 
nnoremap \S :grep -Rns --include \*.scss <cword> .<CR>

" }}}

cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Clear search highlighting
nnoremap \q :nohlsearch<CR>

nnoremap <C-e> :e#<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" File tree browser
nnoremap <leader>e :NERDTreeToggle<CR>

" Tab/Space normalization
nnoremap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nnoremap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nnoremap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nnoremap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>

nnoremap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>
nnoremap ; :CtrlPBuffer<CR>
nnoremap <C-N> :cnext<CR>
nnoremap <C-P> :cprev<CR>

noremap <silent> <C-k> :call <SID>swap_up()<CR>
noremap <silent> <C-j> :call <SID>swap_down()<CR>

" Python support
nnoremap <Leader>g :call RopeGotoDefinition()<CR>
nnoremap <Leader> d Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Insert the current date
nnoremap <F5> "=strftime("%m-%d-%Y")<CR>p
inoremap <F5> <C-R>=strftime("%m-%d-%Y")<CR>
 
" Editing vimrc
nnoremap <leader>, :tabedit $MYVIMRC<CR>

" Saving the current file
nnoremap <leader>s :w<CR>

" Quitting the current file
nnoremap <leader>q :q<CR>

" }}}

" Custom Functions {{{
 
" Move a line up or down
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

" }}}
