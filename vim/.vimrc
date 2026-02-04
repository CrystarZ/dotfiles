set nocompatible              " 关闭 vi 兼容模式
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set hidden                    " 允许切 buffer 不保存
set mouse=a                   " 启用鼠标（终端/GUI）
set clipboard=unnamedplus     " 使用系统剪贴板

set number                     " 行号
set relativenumber             " 相对行号

" set cursorline                 " 高亮当前行
" set signcolumn=yes             " 固定 sign 栏（避免抖动）

set showmode                   " 显示 -- INSERT --
set showcmd                    " 显示部分命令
set ruler                      " 右下角行列

set laststatus=2               " 总是显示状态栏
set cmdheight=1

set wrap                       " 自动换行
set linebreak                  " 不在单词中间断行
set breakindent                " 换行保持缩进

set expandtab                  " Tab → 空格
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent

set ignorecase                 " 忽略大小写
set smartcase                  " 有大写则区分
set incsearch                  " 边输边搜
set hlsearch                   " 高亮搜索结果

set gdefault                   " :s 默认全局替换

set autoread                   " 文件被外部修改自动读取
set confirm                    " 未保存退出时确认

set nobackup
set nowritebackup
set noswapfile

filetype plugin indent on
syntax enable


" Leader key = Space
let mapleader = " "
let maplocalleader = " "

" Better up/down (gj gk)
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> k v:count == 0 ? 'gk' : 'k'

nnoremap <expr> <Down> v:count == 0 ? 'gj' : 'j'
xnoremap <expr> <Down> v:count == 0 ? 'gj' : 'j'
nnoremap <expr> <Up> v:count == 0 ? 'gk' : 'k'
xnoremap <expr> <Up> v:count == 0 ? 'gk' : 'k'

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resize
nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Move lines
nnoremap <A-j> :execute 'move .+' . v:count1<CR>==
nnoremap <A-k> :execute 'move .-' . (v:count1 + 1)<CR>==

inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

vnoremap <A-j> :<C-u>execute "'<,'>move '>+" . v:count1<CR>gv=gv
vnoremap <A-k> :<C-u>execute "'<,'>move '<-" . (v:count1 + 1)<CR>gv=gv

" Buffers
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap <leader>bb :e #<CR>
nnoremap <leader>`  :e #<CR>
nnoremap <leader>bD :bd<CR>

" Clear search / redraw
nnoremap <Esc> :noh<CR><Esc>
inoremap <Esc> <Esc>:noh<CR>

nnoremap <leader>ur :nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>

" Saner n / N
nnoremap <expr> n  'Nn'[v:searchforward] . 'zv'
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward] . 'zv'
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

" Undo breakpoints
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ; ;<C-g>u

" Save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>gv

" Keywordprg
nnoremap <leader>K K

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Windows
" nnoremap <leader>- <C-w>s
" nnoremap <leader>| <C-w>v
" nnoremap <leader>wd <C-w>c

" Tabs
nnoremap <leader><tab>l :tablast<CR>
nnoremap <leader><tab>o :tabonly<CR>
nnoremap <leader><tab>f :tabfirst<CR>
nnoremap <leader><tab><tab> :tabnew<CR>
nnoremap <leader><tab>] :tabnext<CR>
nnoremap <leader><tab>[ :tabprevious<CR>
nnoremap <leader><tab>d :tabclose<CR>

nnoremap <leader>qq :qa<CR>

function! ToggleLineNumber()
  if !&number && !&relativenumber
    set number
  elseif &number && !&relativenumber
    set relativenumber
  else
    set nonumber norelativenumber
  endif
endfunction

nnoremap <Leader>r :call ToggleLineNumber()<CR>

" jk -> ESC (insert & visual)
inoremap jk <Esc>
vnoremap jk <Esc>

" Terminal mode mappings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-/> <C-\><C-n>:bdelete! %<CR>
tnoremap <C-_> <C-\><C-n>:bdelete! %<CR>

" Redo
nnoremap U <C-r>

if has("persistent_undo")
  set undofile
  set undodir=~/.vim/undo//
endif

colorscheme default
