return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
	local conform = require("conform")

	vim.api.nvim_create_user_command("S", function()
		vim.b.disable_autoformat = true
		vim.cmd("write")
		vim.b.disable_autoformat = false
	end, {})

	conform.setup({
		formatters = {
			stylua = {
				args = { "--respect-editorconfig", "-" },
			},
		},
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
			python = { "black", "isort" },
			c = { "clang-format" },
		},
		format_on_save = function(bufnr)
			if vim.b[bufnr].disable_autoformat then
				return
			end

			return {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			}
		end,
	})
	vim.keymap.set({ "n", "v" }, "<leader>mp", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end, { desc = "Format file or range (in visual mode)" })
	end,
}
