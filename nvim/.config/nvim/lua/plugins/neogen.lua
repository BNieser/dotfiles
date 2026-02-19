return {
	"danymat/neogen",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"nvim-treesitter/nvim-treesitter",
	},
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
	keys = {
		{ "<leader>nc", "<cmd>Neogen class<CR>", desc = "Docstring class" },
		{ "<leader>nf", "<cmd>Neogen func<CR>", desc = "Docstring function" },
		{ "<leader>nm", "<cmd>Neogen file<CR>", desc = "Docstring file" },
		{ "<leader>nt", "<cmd>Neogen type<CR>", desc = "Docstring type" },
	},
	opts = {
		languages = {
			lua = { template = { annotation_convention = "emmylua" } },
			python = { template = { annotation_convention = "google_docstrings" } },
		},
	},
}
