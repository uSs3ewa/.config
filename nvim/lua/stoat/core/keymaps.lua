vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("i", "kj", "<ESC>", opts)

keymap.set("n", "<leader>pv", ":q<CR>", { desc = "Exec" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers is visual
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- x key
keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Resize with arrows
-- keymap.set("n", "<Down>", ":resize -2<CR>", opts)
-- keymap.set("n", "<Up>", ":resize +2<CR>", opts)
-- keymap.set("n", "<Right>", ":vertical resize -2<CR>", opts)
-- keymap.set("n", "<Left>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap.set("n", "<Tab>", ":bnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts) -- close buffer
keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Move text up and down
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP', opts)

-- remove tmux conflicting keybindings
-- vim.keymap.del("n", "C-p")
-- vim.keymap.del("n", "<C-n")
