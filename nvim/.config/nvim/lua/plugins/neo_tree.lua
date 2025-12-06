return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,

    opts = {
      window = {
        position = "float", -- macht das Overlay
        width = 40,
        height = 20,
      },
    },

    keys = {
      -- Öffnet Neo-tree als Overlay (Floating)
      {
        "<C-b>",
        function()
          require("neo-tree.command").execute({
            source = "filesystem",
            position = "float",
            toggle = true,
          })
        end,
        desc = "Neo-Tree Floating File Viewer",
      },
    },
  }
}

