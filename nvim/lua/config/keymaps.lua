vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-h>", "<C-W>")
vim.keymap.set("n", "yil", "0y$", { desc = "Yank in Line" })
-- Replace
vim.keymap.set("n", "R", ":%s//g<Left><Left>", { desc = "Replace in file" })
-- bufferline
vim.keymap.set("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to Buffer 1" })
vim.keymap.set("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to Buffer 2" })
vim.keymap.set("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to Buffer 3" })
vim.keymap.set("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to Buffer 4" })
vim.keymap.set("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to Buffer 5" })
vim.keymap.set("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to Buffer 6" })
vim.keymap.set("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to Buffer 7" })
vim.keymap.set("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to Buffer 8" })
vim.keymap.set("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to Buffer 9" })
vim.keymap.set("n", "<leader>?", "<cmd>WhichKey<CR>", { desc = "WhichKey" })

-- Neo-tree toggles
vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- Tab navigation
vim.keymap.set("n", "<leader>1", "1gt", { desc = "Go to tab 1" })
vim.keymap.set("n", "<leader>2", "2gt", { desc = "Go to tab 2" })
vim.keymap.set("n", "<leader>3", "3gt", { desc = "Go to tab 3" })
vim.keymap.set("n", "<leader>4", "4gt", { desc = "Go to tab 4" })
vim.keymap.set("n", "<leader>5", "5gt", { desc = "Go to tab 5" })
vim.keymap.set("n", "<leader>6", "6gt", { desc = "Go to tab 6" })
vim.keymap.set("n", "<leader>7", "7gt", { desc = "Go to tab 7" })
vim.keymap.set("n", "<leader>8", "8gt", { desc = "Go to tab 8" })
vim.keymap.set("n", "<leader>9", "9gt", { desc = "Go to tab 9" })
vim.keymap.set("n", "<C-PageUp>", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<C-PageDown>", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<C-w>", "<cmd>tabclose<CR>", { desc = "Close tab" })

-- save with sudo
vim.cmd([[cab w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])
