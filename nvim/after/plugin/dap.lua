local dapgo = require('dap-go')
local dap = require('dap')
local dapui = require("dapui")

dapgo.setup({
   delve = {
    path = "dlv",
    initialize_timeout_sec = 120,
    port = "${port}",
    args = {},
    build_flags = "",
  },
})
dapui.setup()

vim.fn.sign_define('DapBreakpoint',{ text ='♦️', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>dc', dap.continue)
vim.keymap.set('n', '<Leader>n', dap.step_over)
vim.keymap.set('n', '<Leader>di', dap.step_into)
vim.keymap.set('n', '<Leader>do', dap.step_out)
vim.keymap.set('n', '<Leader>dt', dap.terminate)
vim.keymap.set('n', '<Leader>dui', dapui.toggle)
vim.keymap.set('n', '<Leader>dgt', dapgo.debug_test)
vim.keymap.set('n', '<Leader>dgl', dapgo.debug_last_test)
