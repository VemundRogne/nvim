local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vemund.set")

require("lazy").setup({
    "tpope/vim-fugitive",
    "ellisonleao/gruvbox.nvim",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {"nvim-telescope/telescope-live-grep-args.nvim"},
	    {"nvim-lua/plenary.nvim"},
        },
        config = function()
            local lga_actions = require("telescope-live-grep-args.actions")
            local opts = {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt()
                        },
                    },
                },
            }
            require("telescope").load_extension("live_grep_args")
            require("telescope").setup(opts)
        end,
    },
    "FeiyouG/commander.nvim",
    "anuvyklack/hydra.nvim",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "ThePrimeagen/harpoon",
    "VonHeikemen/lsp-zero.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "lervag/vimtex",
    "lervag/wiki",
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    "preservim/vim-markdown",
    {
        "iamcco/markdown-preview.nvim",
        cmd = {"MarkdownPreview"},
        ft = {"markdown"},
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    "natecraddock/workspaces.nvim",
    {"nvim-treesitter/nvim-treesitter", build=":TSUpdate"},
    {
        "epwalsh/obsidian.nvim", version = "*", lazy = false, ft = "markdown",
        opts = {
            workspaces = {
                {
                    name = "work",
                    path = "/home/vemund/vaults/work/",
                },
                {
                    name = "wiki",
                    path = "/home/vemund/vaults/wiki/",
                },
                {
                    name = "vault",
                    path = "/home/vemund/vaults/vault",
                },
                {
                    name = "vaults",
                    path = "/home/vemund/vaults",
                },
            },

            daily_notes = {
                folder = "notes/dailies",
            },

            notes_subdir = "notes",
            new_notes_location = "notes_subdir",

            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,
        },
    },
    "jbyuki/nabla.nvim",
    "RaafatTurki/hex.nvim",
    "dkarter/bullets.vim",
    "glts/vim-magnum",
    "glts/vim-radical",

})
