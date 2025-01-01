local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "cqb13.plugins" },
	{ import = "cqb13.plugins.lsp" },
	{ import = "cqb13.plugins.ui" },
	{ import = "cqb13.plugins.tools" },
	{ import = "cqb13.plugins.completions" },
}, {
	change_detection = {
		notify = false,
	},
})
