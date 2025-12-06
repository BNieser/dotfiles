return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  -- Optionen (entspricht telescope.setup({}))
  opts = {
    defaults = {
      layout_config = {
        horizontal = { preview_width = 0.55 },
      },
    },
  },

  -- Keymaps (Lazy kümmert sich um set_keymaps())
  keys = {
    -- Deaktivierte Keymaps (Beispiel)
    { "<leader>/", false },

    -- Standard-Finder
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help Tags" },

    -- LSP Symbol Suche
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },

    -- Plugin-Dateien durchsuchen (Lazy root)
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root
        })
      end,
      desc = "Find Plugin Files",
    },
  },
}

