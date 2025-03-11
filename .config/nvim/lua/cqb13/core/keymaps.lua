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

function ToggleSpellingSuggestions()
	vim.o.spell = not vim.o.spell
end

keymap.set("n", "<leader>xs", ToggleSpellingSuggestions, { desc = "Toggle spelling suggestions" })

local hex_mode = false

function ToggleHexEdit()
	if hex_mode then
		vim.cmd("%!xxd -r")
	else
		vim.cmd("%!xxd")
		vim.cmd("set ft=xxd")
	end
	hex_mode = not hex_mode
end

vim.keymap.set("n", "<leader>he", ToggleHexEdit, { desc = "Toggle hex edit mode" })

local collapsed = false

function ToggleBottomBar()
	if collapsed then
		vim.opt.cmdheight = 1
	else
		vim.opt.cmdheight = 0
	end
	collapsed = not collapsed
end

vim.keymap.set("n", "<leader>sb", ToggleBottomBar, { desc = "Toggle bottom bar" })
