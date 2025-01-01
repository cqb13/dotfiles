return {
	"cqb13/line-length-sorter.nvim",
	config = function()
		require("line-length-sorter")
		vim.api.nvim_set_keymap("v", "<leader>ss", ":<C-u>SortLongestToShortest<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("v", "<leader>sl", ":<C-u>SortShortestToLongest<CR>", { noremap = true, silent = true })
	end,
}
