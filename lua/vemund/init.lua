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
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
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
                    name = "vault",
                    path = "/home/vemund/vault/",
                },
                {
                    name = "test",
                    path = "/home/vemund/test_vault/",
                },
            }
        },
    },
    "jbyuki/nabla.nvim"
})
