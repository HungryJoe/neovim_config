-- Configure built-in LSP client

return function()
  -- Configure diagnostics at a high level
  -- Source: :h lsp-handlers-configuration
   vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
     vim.lsp.diagnostic.on_publish_diagnostics, {
     virtual_text = false,
     severity_sort = true
     }
   )
  
  -- Make gutter diagnostic symbols match lualine's
  -- Source: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end
