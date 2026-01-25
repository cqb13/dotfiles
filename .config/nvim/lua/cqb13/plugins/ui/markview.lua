return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function()
	require("markview").setup({
		preview = { enable = false },
	})

	vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<cr>", { desc = "Toggle markdown split preview" })
	vim.keymap.set("n", "<leader>mt", "<cmd>Markview Toggle<cr>", { desc = "Toggle markdown preview" })
    end
}
