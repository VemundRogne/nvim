require("commander").setup({})
require("telescope").load_extension("commander")

local command_center = require("commander")
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

--command_center.add({
    --{
        --desc = "Follow link",
        --cmd = "<CMD>WikiLinkFollow<CR>",
        --keys = {
            --{"n", "<CR>", noremap}
        --}
    --},
--})


command_center.add({
    {
        desc = "Open command center",
        cmd = "<CMD>Telescope commander<CR>",
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
        desc = "Search (grep) current word in all files",
        cmd = "<CMD>Telescope grep_string<CR>",
        keys = {"n", "<leader>faw", noremap},
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
        desc = "Search in vim-command-history",
        cmd = "<CMD>Telescope command_history<CR>",
        keys = { "n", "<leader>fh:", noremap },
    },
    {
        desc = "Find workspace",
        cmd = "<CMD>Telescope workspaces<CR>",
        keys = { "n", "<leader>fw", noremap },
    },
    {
        desc = "Telescope LSP definitions",
        cmd = "<CMD>Telescope lsp_definitions<CR>",
        keys = { "n", "gd", noremap },
    },
    {
        desc = "Telescope LSP references",
        cmd = "<CMD>Telescope lsp_references<CR>",
        keys = { "n", "gr", noremap},
    },
    {
        desc = "Telescope LSP implmentations",
        cmd = "<CMD>Telescope lsp_implementations<CR>",
        keys = {"n", "gi", noremap},
    },
    {
        desc = "Telescope document symbols",
        cmd = "<CMD>Telescope lsp_document_symbols<CR>",
        keys = {"n", "gs"},
    },
    {
        desc = "Telescope workspace symbols",
        cmd = "<CMD>Telescope lsp_workspace_symbols<CR>",
        keys = {"n", "gS", noremap},
    },


    {
        desc = "Open tasks",
        cmd = "<CMD>Telescope toggletasks spawn<CR>",
        keys = { "n", "<leader>ts", noremap },
    },
    {
        desc = "Select tasks",
        cmd = "<CMD>Telescope toggletasks select<CR>",
        keys = { "n", "<leader>tS", noremap },
    },
    {
        desc = "Toggle term",
        cmd = "<CMD>ToggleTerm<CR>",
        keys = { "n" , "<leader>tt", noremap },
    },
    -- Keys to resize the window size. This calls Hydra to make resizing easier
    {
        desc = "Resize (increase) buffer height",
        cmd = "zk",
        keys = { "n", "zk", noremap },
    },

    {
        desc = "DAP continue",
        cmd = "<CMD>lua require('dap').continue()<CR>",
        keys = { "n", "<leader>ds", noremap },
    },

    {
        desc = "Toggle zen mode",
        cmd = "<CMD>lua require('zen-mode').toggle()<CR>",
        keys = { "n" , "<leader>zz", noremap },
    },
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

local dap = require('dap')
Hydra({
    name = "Debugger",
    mode = "n",
    body = "<leader>d",
    config = {
        -- Using the 'pink' color is important! Wihout it DAP commands don't quite work
        color="pink",
        hint = {
            type = "window",
            border = "rounded"
        }
    },
    heads = {
        { 'c', dap.continue, silent=true},
        { 'b', "<CMD>lua require('dap').toggle_breakpoint()<CR>", {desc = "brk."}},
        { 'J', "<CMD>lua require('dap').step_over()<CR>", {desc = "over"}},
        { 'L', "<CMD>lua require('dap').step_into()<CR>", {desc = "into"}},
        { 'e', "<CMD>lua require('dapui').eval()<CR>", exit=true},
        { 'v', "<CMD>lua require('dapui').toggle()<CR>", {desc = "view."}},
        { '1', "<CMD>lua require('dapui').toggle(1)<CR>"},
        { '2', "<CMD>lua require('dapui').toggle(2)<CR>"},
        { 'j', "j" },
        { 'k', "k" },
    }
})
