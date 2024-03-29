# Neovim Keybindings
## Vanilla Vim bindings

Key sequence | Action | Mode (if not `Normal`)
:-----------:|:-------:|:---------------------:
`q`| record macro
`@`| playback macro
`w`| move to beginning of next word
`e`| move to end of current word
`r`| replace characters
`C-r`| redo last change
`a`| insert after cursor
`d`| delete characters in motion
`D`| delete to end of current line
`gg`| move to top of file
`G`| move to end of file
`x`| delete characters
`c`| delete in motion, then insert
`v`| enter character visual mode
`V`| enter line visual mode
`C-v`| enter block visual mode
`v`| force next motion to be character-wise | Operator-Pending
`V`| force next motion to be line-wise | Operator-Pending
`C-v`| force next motion to be block-wise | Operator-Pending
`b`| move to beginning of current word
`#`| search for current word
`$`| move to end of current line
`~`| change case of current character
`u`| undo
`i`| insert before cursor
`p`| put text in register after cursor
`P`| put text in register before cursor
`h`| move to prev char
`j`| move to next line
`k`| move to prev line
`l`| move to next char
`za` | toggle fold at cursor
`zA` | recursively toggle all folds at cursor
`zr` | reduce folding of entire window (increase `foldlevel`) by `1`
`zR` | open all folds in window, setting `foldlevel` to max
`zm` | close all of the next level of folds in window, decreasing `foldlevel` by `1`
`zM` | close all folds in window, setting `foldlevel` to `0`
`zz`| center current line in window
`:` | enter command mode
`n` | repeat last search
`/` | enter command mode to search

## Plugin Bindings

Key sequence | Action | Plugin | Mode (if not `Normal`)
:-----------:|:-------:|:-----:|:----------------------:
`gh` | switch to previous buffer | bufferline
`gl` | switch to next buffer | bufferline
`g]` | move current buffer right one | bufferline
`g[` | move current buffer left one | bufferline
`<leader>rr` | toggle last-opened (or default) Trouble display | trouble
`<leader>rd` | open Trouble display for document LSP diagnostics | trouble
`<leader>rw` | open Trouble display for workspace LSP diagnostics | trouble
`<leader>re` | open Trouble display for LSP references | trouble
`<leader>dt` | goto type definition of current word | trouble
`<leader>jj` | goto next Git hunk | gitsigns
`<leader>jk` | goto previous Git hunk | gitsigns
`<leader>jp` | preview current Git hunk | gitsigns
`<leader>jl` | toggle Git current-line blame | gitsigns
`<leader>jr` | reset current Git hunk | gitsigns
`<Tab><S-Tab>` | scroll completion options | cmp | Insert
`<leader>pp` | toggle treesitter playground | treesitter playground
`s` | sneak-search below cursor | lightspeed
`S` | sneak-search above cursor | lightspeed
`z` | sneak-search below cursor | lightspeed | Operator-Pending
`Z` | sneak-search above cursor | lightspeed | Operator-Pending
`<leader>tj` | find jumplist jump | telescope
`<leader>tf` | find files | telescope
`<leader>td` | search in current buffer (Document) | telescope
`<leader>tw` | search in current directory (Workspace) | telescope
`<leader>tw` | search current directory for selection (Workspace) | telescope | Visual
`<leader>tp` | search yank history | telescope & yanky
`<leader>do` | seearch LSP symbols in current buffer | telescope
`<leader>dj` | goto next diagnostic | lspsaga
`<leader>dk` | goto previous diagnostic | lspsaga
`<leader>dd` | goto LSP definition of current word | lspsaga
`<leader>dh` | show type of current word if it's an LSP variable or function/method | lspsaga
`<leader>di` | show LSP code actions for current word | lspsaga
`<leader>dr` | rename current word in entire LSP workspace | lspsaga
`y`| yank characters in motion | yanky
`<leader>g` | Insert docstring snippet for current function/class/module | neogen
`H` | Swap treesitter sibling to the left | sibling-swap
`L` | Swap treesitter sibling to the right | sibling-swap
`Ctrl-l` | Expand current snippet node or jump to next  | Luasnip | Insert or Normal

## Custom Bindings

Key sequence | Action | Mode (if not `Normal`)
:-----------:|:-------:|:---------------------:
`Space` | leader
`;` | enter command mode (i.e. equivalent to `:`)
`<leader>q` | quit
`<leader>fw` | write current buffer/file
`<leader>ff` | close current buffer/file
`<leader>a` | toggle absolute line numbers
`<leader>wj` | move cursor to window below
`<leader>wk` | move cursor to window above
`<leader>wh` | move cursor to window to left
`<leader>wl` | move cursor to window to right
`<leader>d` | search inside selection | Visual
`<leader>n` | repeat last search with `invcaseignore`
`K`| move to top of window
`J`| move to bottom of window
