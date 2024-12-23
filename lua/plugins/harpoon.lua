return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local conf = require("telescope.config").values

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			local harpoon_get_paths = function(files)
				local paths = {}
				for _, item in ipairs(files.items) do
					table.insert(paths, item.value)
				end
				return paths
			end

			local function harpoon_make_finder(paths)
				return require("telescope.finders").new_table({ results = paths })
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = harpoon_make_finder(file_paths),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),

					-- This function was provided here: https://github.com/ThePrimeagen/harpoon/issues/627
					attach_mappings = function(prompt_buffer_number, map)
						map("n", "<leader>d", function()
							local selected_entry = require("telescope.actions.state").get_selected_entry()
							local current_picker =
								require("telescope.actions.state").get_current_picker(prompt_buffer_number)
							table.remove(harpoon:list().items, selected_entry.index)
							current_picker:refresh(harpoon_make_finder(harpoon_get_paths(harpoon:list())))
						end)
						return true
					end,
				})
				:find()
		end

		require("commander").add({
			{
				desc = "Harpoon find",
				cmd = function()
					toggle_telescope(harpoon:list())
				end,
				keys = { "n", "<leader>hf" },
			},
			{
				desc = "Add file to harpoon",
				cmd = function()
					harpoon:list():add()
				end,
				keys = {
					{ "n", "<leader>ha", noremap },
				},
			},
		})
	end,
}
