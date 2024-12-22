return {
    "nvim-telescope/telescope.nvim", tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-live-grep-args.nvim",

    },
    lazy = false,

    config = function()
        -- File navigation
        require("commander").add({
            {
                desc = "Find files",
                cmd = "<CMD>Telescope find_files<CR>",
                keys = { "n", "<leader>ff", noremap }
            },
            {
                desc = "Find hidden files",
                cmd = "<CMD>Telescope find_files hidden=true<CR>",
                keys = { "n", "<leader>fhf", noremap }
            },
            {
                desc = "Search inside all files",
                cmd = "<CMD>:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
                keys = { "n", "<leader>fg", noremap }
            },
        })
    end
}

