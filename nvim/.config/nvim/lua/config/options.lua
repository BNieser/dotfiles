vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false

-- Column bei 80 anzeigen
vim.opt.colorcolumn = "80,88"

-- change global tab settings
vim.opt.expandtab = true -- exchange the tab symbol with spaces
vim.opt.smartindent = true
vim.opt.autoindent = true -- copy indentation from current line
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- search options
vim.opt.ignorecase = true -- allow for ignoreing  case sensitive search when using lower case
vim.opt.smartcase = true -- use case  sensitive serach when a uppercase is in the string
vim.opt.hlsearch = true -- highlights search matches
vim.opt.incsearch = true -- allow for incementalseraches
