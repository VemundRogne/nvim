return {
    {"hrsh7th/nvim-cmp",
        lazy = false,
        dependencies ={
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "roobert/tailwindcss-colorizer-cmp.nvim",
        },
        config = function()
            local cmp = require("cmp")
    
            cmp.setup {
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
                mapping = {
                    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-y>"] = cmp.mapping(
                    cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    },
                    { "i", "c" }
                    ),
                    ["<Tab>"] = nil,
                    ['<S-Tab>'] = nil,
                    ['<CR>'] = nil,
                }
            }
        end
    }
}
