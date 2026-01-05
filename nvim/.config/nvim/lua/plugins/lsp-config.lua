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
			vim.diagnostic.config({
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

			-- LSP Capabilities für Autocomplete
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Neovim 0.11 neue API verwenden

			-- Lua LSP
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("lua_ls")

			-- Python LSP mit Konfiguration
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
			local lspconfig = require("lspconfig")
			print("WorkspaceFolder would be:", root)
			vim.lsp.config("esbonio", {
				cmd = { "esbonio" },
				filetypes = { "rst" },
				root_dir = vim.fs.root(0, { ".git", "conf.py" }),
				settings = {
					esbonio = {
						sphinx = {
							buildCommand = {
								"sphinx-build",
								"-M",
								"dirhtml",
								"docs",
								"${defaultBuildDir}",
							},
							pythonCommand = { "./.venv/bin/python" },
						},
					},
				},
				capabilities = capabilities,
			})
			vim.lsp.enable("esbonio")

			-- ======================
			-- Esbonio Preview
			-- ======================

			local function esbonio_scroll_view()
				local client = vim.lsp.get_clients({ name = "esbonio", bufnr = 0 })[1]
				if not client then
					return
				end

				local view = vim.fn.winsaveview()
				client.notify("view/scroll", {
					uri = vim.uri_from_bufnr(0),
					line = view.topline,
				})
			end

			local function esbonio_preview_file()
				local params = {
					command = "esbonio.server.previewFile",
					arguments = {
						{ uri = vim.uri_from_bufnr(0) },
					},
				}

				for _, client in ipairs(vim.lsp.get_clients({ name = "esbonio", bufnr = 0 })) do
					client.request("workspace/executeCommand", params, nil, 0)
				end

				local augroup = vim.api.nvim_create_augroup("EsbonioSyncScroll", { clear = true })

				vim.api.nvim_create_autocmd("WinScrolled", {
					group = augroup,
					buffer = 0,
					callback = esbonio_scroll_view,
				})
			end

			-- ======================
			-- User Command
			-- ======================
			vim.api.nvim_create_user_command(
				"EsbonioPreviewFile",
				esbonio_preview_file,
				{ desc = "Esbonio: Preview current RST file" }
			)
			local esbonio_preview_group = vim.api.nvim_create_augroup("EsbonioAutoPreview", { clear = true })

			vim.api.nvim_create_autocmd("BufEnter", {
				group = esbonio_preview_group,
				pattern = { "*.rst" },
				callback = function()
					if not esbonio_auto_preview then
						return
					end

					-- nur previewen, wenn esbonio aktiv ist
					local clients = vim.lsp.get_clients({
						name = "esbonio",
						bufnr = 0,
					})
					if #clients == 0 then
						return
					end

					-- Preview der aktuellen Datei
					esbonio_preview_file()
				end,
			})

			vim.lsp.enable("esbonio")
			vim.lsp.enable("pyright")

			-- Ruff (neuer Name, ersetzt ruff_lsp)
			vim.lsp.config("ruff", {
				capabilities = capabilities,
			})
			vim.lsp.enable("ruff")

			-- Sort imports in the current file using ruff
			vim.api.nvim_create_user_command("SortImports", function()
				vim.cmd("write")
				vim.fn.jobstart({ "ruff", "check", "--select", "I", "--fix", vim.fn.expand("%") }, {
					stdout_buffered = true,
					stderr_buffered = true,
					on_exit = function()
						vim.cmd("edit")
						print("Imports sorted ✔")
					end,
				})
			end, {})

			-- Format entire project using ruff
			vim.api.nvim_create_user_command("FormatProject", function()
				vim.fn.jobstart({ "ruff", "format", "." }, {
					stdout_buffered = true,
					stderr_buffered = true,
					on_exit = function()
						print("Project formatted ✔")
					end,
				})
			end, {})

			-- C/C++ LSP
			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})
			vim.lsp.enable("clangd")

			-- Markdown LSP
			vim.lsp.config("marksman", {
				capabilities = capabilities,
			})
			vim.lsp.enable("marksman")

			-- LSP Keybindings
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, { desc = "Find references" })

			-- Diagnostics Navigation
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
		end,
	},
}
