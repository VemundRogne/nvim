require("config.lazy")

-- Set some local settings for terminal buffers
local set = vim.opt_local
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0

		vim.bo.filetype = "terminal"
	end,
})

-- Easy terminal-escape key
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
