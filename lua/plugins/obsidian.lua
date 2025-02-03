-- We want different workspaces for different computers
local function workspaces_for_hostname()
	local hostname = require("../utils.hostname").get_hostname()
	local configs = {

		-- My personal laptop:
		["vemundyogalaptop"] = function()
			return {
				{
					name = "wiki",
					path = "/home/vemund/vaults/wiki/",
				},
			}
		end,
		-- Work-laptop:
		["AUT-IFWMsN7KHSU"] = function()
			return {
				{
					name = "wiki",
					path = "/home/vemund/vaults/wiki/",
				},
			}
		end,
	}

	-- No point in serving a default... Obsidian gets upset if we pass something empty...
	return configs[hostname] and configs[hostname]()
end

return {
	"epwalsh/obsidian.nvim",
	lazy = false,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("obsidian").setup({
			workspaces = workspaces_for_hostname(),
		})

		require("commander").add({
			{
				desc = "Obsidian quick switch",
				cmd = "<CMD>ObsidianQuickSwitch<CR>",
				keys = { "n", "<leader>wf", noremap },
			},
			{
				desc = "Obsidian search",
				cmd = "<CMD>ObsidianSearch<CR>",
				keys = { "n", "<leader>ws", noremap },
			},
			{
				desc = "Obsidian tags",
				cmd = "<CMD>ObsidianTags<CR>",
				keys = { "n", "<leader>wt", noremap },
			},
		})
	end,
}
