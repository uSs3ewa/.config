return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "williamboman/mason.nvim", config = true },
		{ "williamboman/mason-lspconfig.nvim", config = true },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- Import necessary modules
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		-- Set up autocommands for LSP attach
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Set keybindings for LSP functionalities
				keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts) -- References
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Declaration
				keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts) -- Definitions
				keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- Implementations
				keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- Type definitions
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename
				keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_workspace bufnr=0<CR>", opts) -- Buffer diagnostics
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Line diagnostics
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Previous diagnostic
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Next diagnostic
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Documentation hover
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- Restart LSP
			end,
		})

		-- Capabilities for autocompletion
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig.jdtls.setup({
			cmd = {
				"jdtls",
			},
			filetypes = { "java" },
		})

		lspconfig.hls.setup({}) -- Setup HLS (Haskell Language Server)

		-- Configure language servers
		local servers = {
			lua_ls = {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = {
							callSnippet = "Replace",
						},
						telemetry = { enable = false },
						diagnostics = { disable = { "missing-fields" } },
					},
				},
			},
			pyright = {
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							autoImportCompletions = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			},
		}

		-- Setup each server defined in the servers table
		for server_name, config in pairs(servers) do
			lspconfig[server_name].setup(config)
		end
	end,
}
