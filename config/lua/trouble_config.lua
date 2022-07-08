-- Configure trouble plugin
-- Link: https://github.com/folke/trouble.nvim
-- Source: https://github.com/folke/trouble.nvim#setup
-- Modified by Sam Kagan <skagan@nrao.edu>

return function()
  require'trouble'.setup{
    mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    action_keys = { -- key mappings for actions in the trouble list
      -- map to {} to remove a mapping, for example:
      -- close = {},
      jump_close = "<cr>", -- jump to the diagnostic and close the list
      jump = "<tab>", -- jump to the diagnostic or open / close folds
      close = {"q", "<esc>"}, -- close the list (and get back to your last window / buffer / cursor)
      cancel = {}, -- cancel the preview and get back to your last window / buffer / cursor
      refresh = "r", -- manually refresh
      open_split = {}, -- open buffer in new split
      open_vsplit = {}, -- open buffer in new vsplit
      open_tab = {}, -- open buffer in new tab
      toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
      toggle_preview = "P", -- toggle auto_preview
      hover = "K", -- opens a small popup with the full multiline message
      preview = "p", -- preview the diagnostic location
      close_folds = {"zM", "zm"}, -- close all folds
      open_folds = {"zR", "zr"}, -- open all folds
      toggle_fold = {"zA", "za"}, -- toggle fold of current file
      previous = "k", -- preview item
      next = "j", -- next item
    },
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic.
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_type_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {}, -- icons / text used for a diagnostic
    use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
  }
end

