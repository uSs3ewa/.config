require("stoat.core")
require("stoat.lazy")
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.hs",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
