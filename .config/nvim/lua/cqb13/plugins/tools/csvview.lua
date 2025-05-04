return {
	"hat0uma/csvview.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		parser = { comments = { "#", "//" } },
		keymaps = {
			-- Text objects for selecting fields
			textobject_field_inner = { "if", mode = { "o", "x" } },
			textobject_field_outer = { "af", mode = { "o", "x" } },
			-- Excel-like navigation:
			jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
			jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
			jump_next_row = { "<Enter>", mode = { "n", "v" } },
			jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
		},
	},
	keys = {
		{
			"<leader>sc",
			function()
				local loaded = vim.g.csvview_enabled
				if loaded then
					vim.cmd("CsvViewDisable")
					vim.g.csvview_enabled = false
				else
					vim.cmd("CsvViewEnable")
					vim.g.csvview_enabled = true
				end
			end,
			desc = "Toggle CSV view",
			mode = "n",
		},
	},
	cmd = { "CsvViewEnable", "CsvViewDisable" },
}
