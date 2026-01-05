-- Here is the main setup for the lsp
vim.lsp.enable({
	"lua_ls",
}) -- Here comes in the lsp name after which the file in /lsp are named

vim.diagnostic.config({ -- here we configure how neovim shall handle the diagnostics
	virtual_text = false, -- Standard virtual_text deaktivieren
	virtual_lines = { -- Virtual Lines aktivieren (unter der Zeile)
		only_current_line = true, -- Optional: nur für aktuelle Zeile
	},
	signs = false, -- Keine Signs in der Seitenleiste
	underline = true, -- Unterstreicht Probleme im Code
	update_in_insert = true,
	severity_sort = true, -- Sortiert nach Schweregrad
	float = {
		border = "rounded",
		source = "always",
	},
})
