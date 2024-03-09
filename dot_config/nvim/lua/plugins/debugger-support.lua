return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
            "rcarriga/nvim-dap-ui"
        },
        config = function()
            require("dapui").setup({})

            require("dap-go").setup()

            local dap, dapui, dapgo = require("dap"), require("dapui"), require("dap-go")

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
            vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
            vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
            vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
            vim.keymap.set("n", "<Leader>dgt", function() dapgo.debug_test() end)
            vim.keymap.set("n", "<Leader>dgl", function() dapgo.debug_last() end)
        end
    },
}
