return {
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.keymap.set("n", "<Leader>tn", ":FloatermNew --width=160 --height=30 --title=terminal --disposable<CR>", {})
    end
  }
}
