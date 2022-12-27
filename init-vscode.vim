call plug#begin(stdpath('data') . '/vscode-plugged')

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'asvetliakov/vim-easymotion'

call plug#end()


" xmap gc  <Plug>VSCodeCommentary
" nmap gc  <Plug>VSCodeCommentary
" omap gc  <Plug>VSCodeCommentary
" nmap gcc <Plug>VSCodeCommentaryLine

imap jk  <Esc>
