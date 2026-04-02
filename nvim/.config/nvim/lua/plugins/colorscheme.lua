return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd([[colorscheme tokyonight-moon]])
        end,
    },
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
    },
}
