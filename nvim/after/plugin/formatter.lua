require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,

  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
		go = {
      require("formatter.filetypes.go").gofmt,
		}
  }
}

-- auto-format on save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

