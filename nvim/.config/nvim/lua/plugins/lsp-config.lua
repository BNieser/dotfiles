return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright", -- Python LSP
				"ruff", -- Python Linter/Formatter
				"clangd", -- C/C++ LSP
				"marksman", -- Markdown LSP (für Sphinx Docs)
				"neocmake", -- CMake LSP
			},
			automatic_installation = true,
			automatic_enable = true,
		},
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"mypy", -- Python static type checker
				"jq", -- JSON Formatter
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			-- Diagnostics Konfiguration
		end,
	},
}
