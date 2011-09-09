" enable filetype specifics
filetype on
filetype plugin on
filetype indent on

" syntax highlight
syntax on

" encoding it UTF-8 no matter what the term says
set encoding=utf-8

set nocompatible
set wrap
set fileformats=unix,mac,dos
set cursorline
set autoread " automatically reloads file if changed outside
set ruler

" tab/indentation configuration
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent

" search pattern highlight/incremental
set showmatch
set hlsearch
set incsearch

" backup and swap settings
set nobackup
set nowritebackup
set noswapfile

" make the status line more informative
set laststatus=2
set statusline=%<buf:[%n]\ %f\ %h%m%r " buffer, filename, flags
set statusline+=\ \ [
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]\ "
set statusline+=%=
set statusline+=\ [%3.(%c%)\ %-7.(%l/%L%)]\ %P

" a few useful shortcuts
command! Rehash source ~/.vimrc

" python specifics
" autocmd FileType python set softtabstop=4
" autocmd FileType python set shiftwidth=4

