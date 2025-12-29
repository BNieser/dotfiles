return {
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' },
	opts = { signs = false,
		keywords = {
			REMOVEME = {
			        icon = " ",
          			color = "error",
          			alt = { "REMOVE", "DELETE" },
		}, }, }, },
}



