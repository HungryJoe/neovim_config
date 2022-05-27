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

" Install plugins
" Configure Packer before using it to manage plugins
lua require('packer_config')
lua require('plugins')
" Automatically install newly added plugins
autocmd BufWritePost plugins.lua PackerInstall

" Configure plugins
lua require('lspconfig_config')()
lua require('cmp_config')()
lua require('lualine_config')()
lua require('bufferline_config')()
lua require('gitsigns_config')()
lua require('specs_config')()
lua require('treesitter_config')()
lua require('trouble_config')()
lua require('web-devicons_config')()
lua require('lightspeed_config')()
lua require('lsp_signature_config')()
lua require('gps_config')()


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
