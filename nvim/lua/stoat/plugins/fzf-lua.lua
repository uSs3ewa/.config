return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  enabled = true,
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = {
  -- { "<leader>gf", "<cmd>FzfLua git_bcommits<CR>", desc = "Show Git File Commit (FZF)" },
  -- { "<leader>gF", "<cmd>FzfLua git_commits<CR>", desc = "Show Git Commit (FZF)" },
  -- { "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Show Git Status (FZF)" },
  -- { "<leader>gh", "<cmd>FzfLua git_stash<CR>", desc = "Show Git Stash (FZF)" },
  -- { "<leader>gr", "<cmd>FzfLua git_branches<CR>", desc = "Show Git Branch (FZF)" },
    -- Jumps/Location
    { "<leader>q<C-j>", "<cmd>FzfLua jumps<CR>", desc = "List jumps (FZF)" },
    { "<leader>q<C-t>", "<cmd>FzfLua tagstack<CR>", desc = "List tagstack (FZF)" },
    { "<leader>q<C-g>", "<cmd>FzfLua changes<CR>", desc = "List changes (FZF)" },

    -- Example: keymap.set("n", "<leader>pv", ":q<CR>", {desc = "Exec"})
    -- Finder
    { "<leader>ff", ":FzfLua files<CR>", desc = "Fzf Files in cwd" },
    { "<leader>fo", ":FzfLua oldfiles<CR>", desc = "Fzf recent Files" },
    { "<leader>fs", ":FzfLua live_grep<CR>", desc = "Find Grep" },
    { "<leader>fr", ":FzfLua resume<CR>", desc = "Fzf Resume" },
    { "<leader>ft", ":TodoFzfLua<CR>", desc = "Find todos"},
    -- { "<leader>ft", ":FzfLua grep search='TODO|HACK|PERF|NOTE|FIX' no_esc='true'<CR>", desc = "Find todos"},
  },

  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end
}
