---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	opts = {
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"java",
			"rust",
			"python",
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"svelte",
			"go",
			"bash",
			"lua",
			"vim",
			"vue",
			"dockerfile",
			"gitignore",
			"vimdoc",
			"c",
			"cpp",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		local TS = require("nvim-treesitter")
		TS.setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				if opts.highlight and opts.highlight.enable then
					pcall(vim.treesitter.start, args.buf)
				end
			end,
		})

		vim.keymap.set("n", "<leader>ti", "<cmd>InspectTree<CR>", { desc = "Open treesitter tree" })
	end,
}
