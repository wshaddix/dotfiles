return {
    {"jose-elias-alvarez/null-ls.nvim",
        ft = "go",
        config = function ()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.gofumpt,
                    null_ls.builtins.formatting.goimports_reviser,
                    null_ls.builtins.formatting.golines,
                }
            })
        end
    }
}
