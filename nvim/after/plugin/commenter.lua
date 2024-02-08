require('Comment').setup()

vim.keymap.set({'n', 'i'}, '<leader>cc', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set({'n', 'i'}, '<leader>cu', '<Plug>(comment_toggle_blockwise_current)')
vim.keymap.set('x', '<leader>cc', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('x', '<leader>cu', '<Plug>(comment_toggle_blockwise_visual)')
