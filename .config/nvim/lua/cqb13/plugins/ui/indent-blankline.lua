return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "┊",
			smart_indent_cap = true,
		},
		scope = {
			show_start = false,
			show_end = false,
			enabled = false, -- removes the annoying highlight lines
		},
	},
}
