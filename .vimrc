" ============================================================
" CORE
" ============================================================
set nocompatible
syntax on
filetype plugin indent on

" True color
set termguicolors
colorscheme habamax

" ============================================================
" EDITOR
" ============================================================
set number
set relativenumber
set cursorline
set scrolloff=8
set sidescrolloff=8
set nowrap
set hidden
set signcolumn=yes

" Отступы
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Поиск
set incsearch
set hlsearch
set ignorecase
set smartcase

" other 
set showmatch
set clipboard=unnamed
set updatetime=300
set timeoutlen=500
set encoding=utf-8
set fileencoding=utf-8
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir

" ============================================================
" STATUSLINE
" ============================================================
set laststatus=2
set noshowmode

let g:mode_map = {
  \ 'n':  'NORMAL', 'i':  'INSERT', 'v':  'VISUAL',
  \ 'V':  'V-LINE', '': 'V-BLOCK', 'c':  'COMMAND',
  \ 'R':  'REPLACE', 's': 'SELECT', 't': 'TERMINAL'
  \ }

function! StatuslineMode()
  return get(g:mode_map, mode(), mode())
endfunction

function! StatuslineGit()
  let branch = system("git -C " . expand('%:p:h') . " branch --show-current 2>/dev/null | tr -d '\n'")
  return len(branch) > 0 ? '  ' . branch . ' ' : ''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %{StatuslineMode()}\ 
set statusline+=%#LineNr#
set statusline+=%{StatuslineGit()}
set statusline+=\ %f                   " имя файла
set statusline+=%m                     " флаг изменения
set statusline+=%=                     " разделитель
set statusline+=%#CursorColumn#
set statusline+=\ %y                   " тип файла
set statusline+=\ %{&fileencoding}\ 
set statusline+=\ %l:%c                " строка:колонка
set statusline+=\ %p%%\               " % в файле

" ============================================================
" KEYMAPS
" ============================================================
let mapleader = " "

" Сохранение
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Снять подсветку поиска
nnoremap <leader>h :nohlsearch<CR>

" Навигация по окнам
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Перемещение строк
nnoremap <A-j> :m +1<CR>==
nnoremap <A-k> :m -2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Буфера
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprev<CR>
nnoremap <leader>q :bd<CR>

" Проводник
nnoremap <leader>e :Explore<CR>

" Быстрое редактирование vimrc
nnoremap <leader>v :e $MYVIMRC<CR>

" Копировать до конца строки (как D, C)
nnoremap Y y$

" Центрировать экран при навигации
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" ============================================================
" NETRW (встроенный файловый менеджер)
" ============================================================
let g:netrw_banner    = 0    " убрать шапку
let g:netrw_liststyle = 3    " дерево
let g:netrw_winsize   = 25

" ============================================================
" AUTOCMD
" ============================================================
augroup vimrc
  autocmd!
  " Убрать подсветку поиска при входе в Insert
  autocmd InsertEnter * setlocal nohlsearch
  autocmd InsertLeave * setlocal hlsearch
  " YAML — табы 2 пробела
  autocmd FileType yaml setlocal ts=2 sw=2 expandtab
  " Вернуться на последнюю позицию при открытии файла
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Создать undodir если не существует
if !isdirectory($HOME . "/.vim/undodir")
  call mkdir($HOME . "/.vim/undodir", "p")
endif
