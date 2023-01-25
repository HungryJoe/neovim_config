" Neovim config
" Author: Sam Kagan

" ============================
" Vimrc
" ============================

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" =========================
" Plugins
" =========================

" Install and configure plugins
lua require('plugins')()

" =================
" Miscellaneous
" =================

" Configure colorscheme
lua require('tokyonight_config')()
colorscheme tokyonight
" Configure keybindings
lua require('keybindings')()
" Configure LSP client
lua require('lsp_config')()
