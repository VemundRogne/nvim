return {
	"stevearc/overseer.nvim",
	opts = {},
	config = function()
		require("overseer").setup({
			templates = { "builtin" },
		})

		require("commander").add({
			{
				desc = "Overseer run",
				cmd = "<CMD>OverseerRun<CR>",
				keys = { "n", "<leader>rr", noremap },
			},
			{
				desc = "Overseer open",
				cmd = "<CMD>OverseerOpen<CR>",
				keys = { "n", "<leader>ro", noremap },
			},
			{
				desc = "Overseer toggle",
				cmd = "<CMD>OverseerToggle<CR>",
				keys = { "n", "<leader>rt", noremap },
			},
		})
	end,
}
