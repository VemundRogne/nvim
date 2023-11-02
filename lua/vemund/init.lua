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
    "L3MON4D3/LuaSnip",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
})
