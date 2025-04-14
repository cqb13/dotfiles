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

-- Configure movement to behave like a word processor
local function wrap_movement(normal, wrapped)
	return function()
		return vim.wo.wrap and wrapped or normal
	end
end

vim.keymap.set("n", "j", wrap_movement("j", "gj"), { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "k", wrap_movement("k", "gk"), { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "0", wrap_movement("0", "g0"), { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "^", wrap_movement("^", "g^"), { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "$", wrap_movement("$", "g$"), { noremap = true, expr = true, silent = true })

local function toggle_wrap()
	if vim.wo.wrap then
		vim.wo.wrap = false
		vim.wo.linebreak = false
		vim.wo.breakindent = false
		vim.notify("Word Wrap: OFF", vim.log.levels.INFO)
	else
		vim.wo.wrap = true
		vim.wo.linebreak = true
		vim.wo.breakindent = true
		vim.notify("Word Wrap: ON", vim.log.levels.INFO)
	end
end

vim.keymap.set("n", "<leader>sw", toggle_wrap, { noremap = true, silent = true, desc = "Toggle line wrapping" })

function ToggleSpellingSuggestions()
	vim.wo.spell = not vim.wo.spell
end

keymap.set("n", "<leader>xs", ToggleSpellingSuggestions, { desc = "Toggle spelling suggestions" })

local hex_mode = false

local function ToggleHexEdit()
	if hex_mode then
		vim.opt.binary = true
		vim.opt.eol = false
		vim.cmd("%!xxd -r")
		vim.opt.filetype = "text"
		vim.notify("Hex Edit: OFF", vim.log.levels.INFO)
	else
		vim.opt.binary = true
		vim.opt.eol = false
		vim.cmd("%!xxd")
		vim.opt.filetype = "xxd"
		vim.notify("Hex Edit: ON", vim.log.levels.INFO)
	end
	hex_mode = not hex_mode
end

vim.keymap.set("n", "<leader>he", ToggleHexEdit, { desc = "Toggle hex edit mode" })

local collapsed = true

function ToggleBottomBar()
	if collapsed then
		vim.opt.cmdheight = 1
	else
		vim.opt.cmdheight = 0
	end
	collapsed = not collapsed
end

vim.keymap.set("n", "<leader>sb", ToggleBottomBar, { desc = "Toggle bottom bar" })
