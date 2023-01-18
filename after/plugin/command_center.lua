require("telescope").load_extension("command_center")

local command_center = require("command_center")
local noremap = {noremap = true}

for i = 1, 9 do
    command_center.add({
        {
            desc = string.format("Harpoon to file %s", i),
            cmd = string.format("<CMD>lua require('harpoon.ui').nav_file(%s)<CR>", i),
            keys = {
                {"n", string.format("<leader>%s", i), noremap},
            }
        },
        {
            desc = string.format("Harpoon to terminal %s", i),
            cmd = string.format("<CMD>lua require('harpoon.term').gotoTerminal(%s)<CR>", i),
            keys = {
                {"n", string.format("<leader>t%s", i), noremap},
            }
        },
    })
end


command_center.add({
    {
        desc = "Open command center",
        cmd = "<CMD>Telescope command_center<CR>",
        keys = {
            {"n", "<leader>fc", noremap},
            {"v", "<leader>fc", noremap},
        }
    },

    -- Pane navigation
    {
        desc = "Navigate to pane below",
        cmd = "<CMD>wincmd j<CR>",
        keys = {
            {"n", "<leader>j", noremap},
        }
    },
    {
        desc = "Navigate to pane above",
        cmd = "<CMD>wincmd k<CR>",
        keys = {
            {"n", "<leader>k", noremap},
        }
    },
    {
        desc = "Navigate to pane left",
        cmd = "<CMD>wincmd h<CR>",
        keys = {
            {"n", "<leader>h", noremap},
        }
    },
    {
        desc = "Navigate to pane right",
        cmd = "<CMD>wincmd l<CR>",
        keys = {
            {"n", "<leader>l", noremap},
        }
    },
    {
        desc = "Add file to harpoon",
        cmd = "<CMD>lua require('harpoon.mark').add_file()<CR>",
        keys = {
            {"n", "<leader>af", noremap},
        }
    },
    {
        desc = "Harpoon quick menu",
        cmd = "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>",
        keys = {
            {"n", "<C-E>", noremap},
        }
    },

    {
        desc = "Add current working directory to workspace list",
        cmd = "<CMD>lua require('workspaces').add()<CR>",
        keys = { "n", "<leader>aw", noremap },
    },

    -- Telescope stuff
    {
        desc = "Find files",
        cmd = "<CMD>Telescope find_files<CR>",
        keys = {"n", "<leader>ff", noremap}
    },
    {
        desc = "Find hidden files",
        cmd = "<CMD>Telescope find_files hidden=true<CR>",
        keys = {"n", "<leader>fhf", noremap}
    },
    {
        desc = "Search inside all files",
        cmd = "<CMD>Telescope live_grep<CR>",
        keys = {"n", "<leader>fg", noremap}
    },
    {
        desc  = "Search inside current buffer",
        cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
        keys = { "n", "<leader>fl", noremap },
    },
    {
        desc = "Search in all vim-commands",
        cmd = "<CMD>Telescope commands<CR>",
        keys = { "n", "<leader>f:", noremap },
    },
    {
        desc = "Find workspace",
        cmd = "<CMD>Telescope workspaces<CR>",
        keys = { "n", "<leader>fw", noremap },
    },

    -- Keys to resize the window size. This calls Hydra to make resizing easier
    {
        desc = "Resize (increase) buffer height",
        cmd = "zk",
        keys = { "n", "zk", noremap },
    }
})

-- Window resizer with hydra
local Hydra = require('hydra')
Hydra({
    name = 'Resizer',
    mode = 'n',
    body = 'z',
    heads = {
        { 'k', '<CMD>:res +1<CR>' , {desc = "" }},
        { 'j', '<CMD>:res -1<CR>' , {desc = "" }},
        { 'h', '<CMD>:vertical resize -1<CR>', {desc = "" }},
        { 'l', '<CMD>:vertical resize +1<CR>', {desc = "" }},
    }
})
