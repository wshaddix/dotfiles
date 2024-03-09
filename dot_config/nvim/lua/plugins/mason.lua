return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies =  { "williamboman/mason-lspconfig.nvim", opts = { auto_install = true } },
    config = function()
      local mason = require("mason")

      local mason_lspconfig = require("mason-lspconfig")

      -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "emmet_ls",
--        "omnisharp",
        "svelte"
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })
    end,
  }
}
