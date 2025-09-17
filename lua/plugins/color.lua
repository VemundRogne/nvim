return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			italic = {
				strings = true,
				operators = false,
				comments = false,
			},
		})

		vim.cmd("colorscheme gruvbox")
	end,
}
