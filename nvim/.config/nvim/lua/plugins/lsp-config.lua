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
        "pyright",      -- Python LSP
        "ruff",         -- Python Linter/Formatter
        "clangd",       -- C/C++ LSP
        "marksman",     -- Markdown LSP (für Sphinx Docs)
      },
      automatic_installation = true,
    },
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "mypy",         -- Python static type checker
        "jq",           -- JSON Formatter
      },
  }},
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      -- Diagnostics Konfiguration
      vim.diagnostic.config({
	virtual_text = false,  -- Standard virtual_text deaktivieren
  	virtual_lines = {      -- Virtual Lines aktivieren (unter der Zeile)
    		only_current_line = true,  -- Optional: nur für aktuelle Zeile
  		},
        signs = false,         -- Keine Signs in der Seitenleiste
        underline = true,      -- Unterstreicht Probleme im Code
        update_in_insert = true,
        severity_sort = true,  -- Sortiert nach Schweregrad
        float = {
          border = 'rounded',
          source = 'always',
        },
      })
      
      -- LSP Capabilities für Autocomplete
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Neovim 0.11 neue API verwenden
      
      -- Lua LSP
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
      })
      vim.lsp.enable('lua_ls')
      
      -- Python LSP mit Konfiguration
      vim.lsp.config('pyright', {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            }
          }
        }
      })
      vim.lsp.enable('pyright')

      -- Ruff (neuer Name, ersetzt ruff_lsp)
      vim.lsp.config('ruff', {
        capabilities = capabilities,
      })
      vim.lsp.enable('ruff')

  -- Sort imports in the current file using ruff
      vim.api.nvim_create_user_command("SortImports", function()
        vim.cmd("write")
        vim.fn.jobstart(
          { "ruff", "check", "--select", "I", "--fix", vim.fn.expand("%") },
          {
            stdout_buffered = true,
            stderr_buffered = true,
            on_exit = function()
              vim.cmd("edit")
              print("Imports sorted ✔")
            end,
          }
        )
      end, {})

      -- Format entire project using ruff
      vim.api.nvim_create_user_command("FormatProject", function()
        vim.fn.jobstart(
          { "ruff", "format", "." },
          {
            stdout_buffered = true,
            stderr_buffered = true,
            on_exit = function()
              print("Project formatted ✔")
            end,
          }
        )
      end, {})


      
      -- C/C++ LSP
      vim.lsp.config('clangd', {
        capabilities = capabilities,
      })
      vim.lsp.enable('clangd')
      
      -- Markdown LSP
      vim.lsp.config('marksman', {
        capabilities = capabilities,
      })
      vim.lsp.enable('marksman')
      
      -- LSP Keybindings
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
      vim.keymap.set('n', '<leader>fr', vim.lsp.buf.references, { desc = 'Find references' })
      
      -- Diagnostics Navigation
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
    end,
  }
}

