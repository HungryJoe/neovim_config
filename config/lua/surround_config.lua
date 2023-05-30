-- Configure nvim-surround plugin
-- See :h nvim-surround.txt for docs

return function()
  require("nvim-surround").setup({
    keymaps = {
      insert = false,
      insert_line = false,
      normal = "<leader>ss",
      normal_line = "<leader>sS",
      visual = "<leader>s",
      visual_line = "<leader>S",
      delete = "<leader>sd",
      change = "<leader>sc",
    },
    aliases = {
        ["a"] = ")",
        ["d"] = "}",
        ["f"] = "]",
        ["g"] = "\"",
        ["h"] = "`",
    },
  })
end
