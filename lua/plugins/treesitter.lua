local M = {
	"nvim-treesitter/nvim-treesitter",
    branch = "main",
	lazy = false,
	build = ":TSUpdate",
    opts = {
        indent = {enable = true},
        highlight = {enable = true},
        folds = {enable = true},
        ensure_installed = {
            "bash",
            "cmake",
            "c",
            "cpp",
            "csv",
            "devicetree",
            "disassembly",
            "dockerfile",
            "doxygen",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "hjson",
            "lua",
            "make",
            "nginx",
            "ninja",
            "objdump",
            "proto",
            "python",
            "toml",
            "yaml",
            "json"
        }
    }
}

return { M }
