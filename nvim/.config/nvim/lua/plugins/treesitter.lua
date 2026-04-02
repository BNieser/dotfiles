return {
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    },
    {
        "MeanderingProgrammer/treesitter-modules.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            ensure_installed = "python",
            fold = { enable = false },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = true },
        },
    },
}
