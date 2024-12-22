return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        dependencies ={
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", 
                    "cmake", "clangd" },
            })
            
            require("lspconfig").clangd.setup({})
            require("lspconfig").pyright.setup({})
            require("lspconfig").cmake.setup({})
        end
    }
}
