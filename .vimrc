call plug#begin('~/.vim/plugged')
" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
" ...省略
Plug 'nathanaelkane/vim-indent-guides'
set tabstop=2 shiftwidth=2 expandtab
let g:indent_guides_start_level = 2
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
" Plug 'Yggdroot/indentLine'
" let g:indentLine_char = '¦'
Plug 'srcery-colors/srcery-vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'flrnprz/taffy.vim'
"Plug 'davidhalter/jedi-vim', {'for': 'python'}   " pythonファイルを編集するときだけ起動

call plug#end()
"syntax enable
colorscheme srcery
let g:lightline = {
      \ 'colorscheme': 'srcery',
      \ }
"
" colorscheme molokai
" set background=dark
" colorscheme taffy
" Lightline
" let g:lightline = { 'colorscheme': 'taffy' }

" colorscheme neuromancer
"set t_Co=256

" setting
" "文字コードをUFT-8に設定
set fenc=utf-8
" " バックアップファイルを作らない
set nobackup
" " スワップファイルを作らない
set noswapfile
" " 編集中のファイルが変更されたら自動で読み直す
set autoread
" " バッファが編集中でもその他のファイルを開けるように
set hidden
" " 入力中のコマンドをステータスに表示する
set showcmd
"
"
"
" " 行番号を表示
set number
" " 現在の行を強調表示
set cursorline
" " 現在の行を強調表示（縦）
set cursorcolumn
" " 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" " インデントはスマートインデント
set smartindent
" " ビープ音を可視化
set visualbell
" " 括弧入力時の対応する括弧を表示
set showmatch
" " ステータスラインを常に表示
set laststatus=2
" " コマンドラインの補完
set wildmode=list:longest
" " 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
"
"
" Tab系
" " 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" " Tab文字を半角スペースにする
set expandtab
" " 行頭以外のTab文字の表示幅（スペースいくつ分）
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
