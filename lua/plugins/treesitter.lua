local M = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "python", "markdown", "markdown_inline", "bash", "cmake", "devicetree", "doxygen", "gitcommit", "git_rebase", "git_config", "gitignore", "ssh_config", "sql" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

return { M }
