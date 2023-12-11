require('mason').setup({})
require("mason-lspconfig").setup()

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = false,
    manage_nvim_cmp = true,
    suggest_lsp_serves = false,
})

--lsp.ensure_installed({
--'pyright'
--})

local cmp = require('cmp')
local cmp_action = require("lsp-zero").cmp_action()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<CR>'] = nil

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp_mappings,
    sources = {
        {name = "path"}
    }
})


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)

    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set("n", "gq", function() vim.lsp.buf.format({async=false, timeout_ms = 10000}) end, opts)
end)

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.buffer_autoformat()
end)

--lsp.nvim_workspace()
lsp.setup()

require 'lspconfig'.texlab.setup {}
vim.g.Tex_MultipleCompileFormats = 'pdf'

require("lspconfig").pyright.setup({})
require("lspconfig").clangd.setup({})

