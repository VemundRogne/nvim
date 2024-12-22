-- Bootstrap lazy.nvim: https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Folke says: "Make sure to setup 'mapleader' and 'maplocalleader' before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Leader key to space
vim.g.mapleader = " "

-- Set block cursor for normal modes and line cursor for insert modes. Also highlight current line
vim.opt.guicursor = "n-v-c:block"
vim.opt.guicursor = "i:ver50"
vim.o.cursorline = true

-- Relative numbers on the sidebar
vim.opt.nu = true
vim.opt.relativenumber = true

-- Sensible j and k behaviour for wrapped lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false

vim.opt.smartindent = true

-- Do not care about swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

require("lazy").setup({
    spec = {{ import = "plugins" }},
    checker = {enabled = true},
})
