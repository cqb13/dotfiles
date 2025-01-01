vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- split screen keybinds
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split window equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current window" })
keymap.set("n", "<leader>s.", "<cmd>vertical resize -10<CR>", { desc = "Decrease width" })
keymap.set("n", "<leader>s,", "<cmd>vertical resize +10<CR>", { desc = "Increase width" })

function OpenTerminal()
	vim.cmd("vsplit term://zsh")
	vim.cmd("startinsert")
end

keymap.set("n", "<C-;>", OpenTerminal, { desc = "Open the terminal to the current directory in a vertical split" })
keymap.set("t", "<C-;>", "<cmd>close<CR>", { desc = "Close current terminal window" })
