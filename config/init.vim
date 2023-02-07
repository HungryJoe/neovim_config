" Neovim config
" Author: Sam Kagan

" ============================
" Vimrc
" ============================

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
let g:python3_host_prog = $HOME . '/.asdf/installs/python/3.9.2/bin/python'


" =========================
" Plugins
" =========================

" Install and configure plugins
lua require('plugins')()

" Configure wilder
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('pipeline', [
\   wilder#branch(
\     wilder#cmdline_pipeline({
\       'fuzzy': 1,
\       'set_pcre2_pattern': has('nvim'),
\     }),
\     wilder#python_search_pipeline({
\       'pattern': 'fuzzy',
\     }),
\   ),
\ ])
let s:highlighters = [
\ wilder#pcre2_highlighter(),
\ wilder#basic_highlighter(),
\ ]
call wilder#set_option('renderer', wilder#renderer_mux({
\ ':': wilder#popupmenu_renderer({
\   'highlighter': s:highlighters,
\ }),
\ '/': wilder#wildmenu_renderer({
\   'highlighter': s:highlighters,
\ }),
\ }))

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
