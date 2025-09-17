-- Commander is a "core" plugin -- we always need it.
-- We try to keep most keybindings in the relevant file; {plugin}-bindings in "plugins/{plugin}.lua"

return {
	"FeiyouG/commander.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	keys = {
		{ "<leader>fc", "<CMD>Telescope commander<CR>", mode = "n" },
	},
	lazy = false,
	config = function()
		require("commander").setup({
			integration = {
				telescope = {
					enable = true,
				},
			},
			lazy = {
				enable = false,
			},
		})

		-- Base keybinds
		require("commander").add({
			{
				desc = "Open command center",
				cmd = "<CMD>Telescope commander<CR>",
				keys = {
					{ "n", "<leader>fc", noremap },
					{ "v", "<leader>fc", noremap },
				},
			},
			{
				desc = "Paste from system clipboard",
				cmd = '"+p',
				keys = { "n", "<leader>p", noremap },
			},
			{
				desc = "Copy to system clipboard",
				cmd = '"+y',
				keys = { "n", "<leader>y", noremap },
			},
		})
	end,
}
