return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in the next major release
        workspaces = {
            {
                name = "personal",
                path = "~/obsidian/test/",
            },
        },
        templates = {
            folder = "templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
        },
    },
    keys = {
        {
            "<leader>tf",
            "<cmd>Obsidian template flashcard<CR>",
            desc = "Insert Flashcard Template",
        },
    },
}
