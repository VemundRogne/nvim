return {
	"nvimtools/hydra.nvim",
	config = function()
		-- Window resizer with hydra
		local Hydra = require("hydra")
		Hydra({
			name = "Resize",
			mode = "n",
			body = "z",
			heads = {
				{ "k", "<CMD>:res +1<CR>", { desc = "" } },
				{ "K", "<CMD>:res +5<CR>", { desc = "" } },
				{ "j", "<CMD>:res -1<CR>", { desc = "" } },
				{ "J", "<CMD>:res -5<CR>", { desc = "" } },
				{ "h", "<CMD>:vertical resize -1<CR>", { desc = "←" } },
				{ "H", "<CMD>:vertical resize -5<CR>", { desc = "←←←" } },
				{ "l", "<CMD>:vertical resize +1<CR>", { desc = "→" } },
				{ "L", "<CMD>:vertical resize +5<CR>", { desc = "→→→" } },
			},
		})
	end,
}
