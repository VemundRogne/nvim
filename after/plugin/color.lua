vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"

require("gruvbox").setup({
    italic = false,
})

vim.cmd("colorscheme gruvbox")

-- Remove error highlight from _ in markdown files
-- https://github.com/tpope/vim-markdown/issues/79
vim.cmd("autocmd FileType markdown hi link markdownError NONE")
