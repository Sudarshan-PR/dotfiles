local tree = require("nvim-tree")
local api = require("nvim-tree.api")
local function my_on_attach(bufnr)
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- vim.keymap.set({"n", "i"}, "<leader>t", vim.cmd.NvimTreeToggle)
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'O', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

tree.setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  on_attach = my_on_attach
})

-- auto open nvim-tree when open neovim
local function open_nvim_tree(data)
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

  -- only files please
  if not real_file and not no_name then
    return
  end

  -- open the tree but dont focus it
  api.tree.toggle({ focus = false })
end

vim.api.nvim_create_autocmd({'VimEnter'}, { callback = open_nvim_tree })

vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>ft", vim.cmd.NvimTreeFindFile)
