function preview_file()
	local params = {
		command = "esbonio.server.previewFile",
		arguments = {
			{ uri = vim.uri_from_bufnr(0) },
		},
	}

	local clients = require("lspconfig.util").get_lsp_clients({
		bufnr = vim.api.nvim_get_current_buf(),
		name = "esbonio",
	})
	for _, client in ipairs(clients) do
		client.request("workspace/executeCommand", params, nil, 0)
	end

	local augroup = vim.api.nvim_create_augroup("EsbonioSyncScroll", { clear = true })
	vim.api.nvim_create_autocmd({ "WinScrolled" }, {
		callback = scroll_view,
		group = augroup,
		buffer = 0,
	})
end

function scroll_view(event)
	local esbonio = vim.lsp.get_active_clients({ bufnr = 0, name = "esbonio" })[1]
	local view = vim.fn.winsaveview()

	local params = { uri = vim.uri_from_bufnr(0), line = view.topline }
	esbonio.notify("view/scroll", params)
end

vim.api.nvim_create_user_command("EsbonioPreviewFile", preview_file, { desc = "Esbonio: Preview current RST file" })

return {
	cmd = { "esbonio" },
	filetype = { "rst" },
	root_dir = vim.fs.root(0, { ".git", "conf.py" }),
	root_markers = { ".git" },
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
}
