require("config.options")
require("config.lazy") -- TODO: move also to core.lazy
require("core.lsp")
require("config.keymaps")
require("config.autocmds")

-- Needs to be set after the colosheme was loaded or set it directly
-- in the colosheme
vim.cmd("highlight ColorColumn ctermbg=0 guibg=#05dce3")
