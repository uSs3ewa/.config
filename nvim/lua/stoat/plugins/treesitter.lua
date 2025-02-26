return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"java",
				"html",
				"lua",
				"css",
				"c",
				"cpp",
				"yaml",
				"toml",
				"markdown",
				"markdown_inline",
				"bash",
				"vim",
				"fish",
				"gitignore",
				"json",
				"nix",
				"python",
				"regex",
				"vimdoc",
				"query", -- for playground
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
