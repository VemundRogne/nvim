return{
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
        require("oil").setup({
            columns = {
                "icon",
                 --"permissions",
                 --"size",
                 --"mtime",
            },
            preview_win = {
                update_on_curson_moved = true,
                preview_method = "load",
                win_options = {},
            },
        })

        local detail = false

        require("commander").add({
            {
                desc = "Toggle Oil file-details",
                cmd = function()
                    detail = not detail
                    if detail then
                        require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                    else
                        require("oil").set_columns({ "icon" })
                    end
                end,
                keys = {
                    { "n", "<leader>od", noremap },
                }
            },
            {
                desc = "Open oil",
                cmd = "<CMD>Oil<CR>",
                keys = {
                    { "n", "<leader>oo", noremap },
                }
            }

        })
    end
}
