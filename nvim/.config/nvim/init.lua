require("config.lazy")

vim.lsp.enable("lua_ls")

vim.api.nvim_create_user_command('FormatJson', function()
  vim.cmd('%!jq .')
end, { desc = 'Format JSON with jq' })

require("config.options")
require("config.keymaps")
