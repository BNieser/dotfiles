return {
	"stevearc/conform.nvim",
	opts = function()
		-- Toggle Variable (global)
		vim.g.autoformat = true

		-- Toggle Keymap
		vim.keymap.set("n", "<leader>uf", function()
			vim.g.autoformat = not vim.g.autoformat
			vim.notify("Autoformat " .. (vim.g.autoformat and "ON" or "OFF"))
		end, { desc = "Toggle Autoformat" })

		return {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", stop_after_first = true },
				json = { "prettier", stop_after_first = true },
				markdown = { "prettier" },
				toml = { "taplo" },
			},

			format_on_save = function()
				if not vim.g.autoformat then
					return
				end
				return {
					timeout_ms = 1000,
					lsp_fallback = true,
				}
			end,
		}
	end,
}
