vim.g.mapleader = ","

-- open tree/explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- paste and retain in buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- movement remaps
vim.keymap.set({"n", "i"}, "<C-l>", "<C-w>l")
vim.keymap.set({"n", "i"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n", "i"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n", "i"}, "<C-k>", "<C-w>k")
