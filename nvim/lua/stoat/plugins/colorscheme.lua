return {
	-- "folke/tokyonight.nvim",
	"rose-pine/neovim",
	priority = 1000,
	config = function()
		-- local bg = "#011628"
		-- local bg_dark = "#011423"
		-- local bg_highlight = "#143652"
		-- local bg_search = "#0A64AC"
		-- local bg_visual = "#275378"
		-- local fg = "#CBE0F0"
		-- local fg_dark = "#B4D0E9"
		-- local fg_gutter = "#627E97"
		-- local border = "#547998"

		--require("tokyonight").setup({
		--style = "night",
		--on_colors = function(colors)
		--colors.bg = bg
		--colors.bg_dark = transparent and colors.none or bg_dark
		--colors.bg_float = transparent and colors.none or bg_dark
		--colors.bg_highlight = bg_highlight
		--colors.bg_popup = bg_dark
		--colors.bg_search = bg_search
		--colors.bg_sidebar = transparent and colors.none or bg_dark
		--colors.bg_statusline = transparent and colors.none or bg_dark
		--colors.bg_visual = bg_visual
		--colors.border = border
		--colors.fg = fg
		--colors.fg_dark = fg_dark
		--colors.fg_float = fg
		--colors.fg_gutter = fg_gutter
		--colors.fg_sidebar = fg_dark
		--end
		--})

		require("rose-pine").setup({
			variant = "auto", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},

			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},

			palette = {
				-- Override the builtin palette per variant
				-- moon = {
				--     base = '#18191a',
				--     overlay = '#363738',
				-- },
			},

			highlight_groups = {
				CurSearch = { fg = "base", bg = "leaf", inherit = false },
				Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
				StatusLine = { fg = "love", bg = "love", blend = 10 },
				StatusLineNC = { fg = "subtle", bg = "surface" },
				-- Comment = { fg = "foam" },
				-- VertSplit = { fg = "muted", bg = "muted" },
			},

			before_highlight = function(group, highlight, palette)
				-- Disable all undercurls
				-- if highlight.undercurl then
				--     highlight.undercurl = false
				-- end
				--
				-- Change palette colour
				-- if highlight.fg == palette.pine then
				--   highlight.fg = palette.foam
				-- end
			end,
		})

		-- vim.cmd("colorscheme rose-pine")
		-- vim.cmd("colorscheme rose-pine-main")
		-- Set colorscheme
		vim.opt.termguicolors = true
		vim.cmd("colorscheme rose-pine-moon")
		-- vim.cmd("colorscheme rose-pine-dawn")

		-- vim.cmd("colorscheme tokyonight")

		-- Set the value to 1 if you want a transparent background
		-- vim.g.nobackground = 1 -- Default 0
	end,
}
