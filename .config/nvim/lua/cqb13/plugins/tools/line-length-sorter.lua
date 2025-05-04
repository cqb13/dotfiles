return {
	"cqb13/line-length-sorter.nvim",
	config = function()
		require("line-length-sorter")
		vim.keymap.set(
			"v",
			"<leader>ss",
			":<C-u>SortLongestToShortest<CR>",
			{ noremap = true, silent = true, desc = "Sort lines longest to shortest" }
		)
		vim.keymap.set(
			"v",
			"<leader>sl",
			":<C-u>SortShortestToLongest<CR>",
			{ noremap = true, silent = true, desc = "Sort lines shortest to longest" }
		)
	end,
}
