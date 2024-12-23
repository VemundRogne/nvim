--print("Hostname =:" .. require("../utils.hostname").get_hostname())

local function workspaces_for_hostname()
	local hostname = require("../utils.hostname").get_hostname()
	local configs = {
		["vemundyogalaptop"] = function()
			return {
				--workspaces = {
				{
					name = "wiki",
					path = "/home/vemund/vaults/wiki/",
				},
				--},
			}
		end,
	}

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
	end,
}
