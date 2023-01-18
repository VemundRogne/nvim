-- Set block cursor for normal modes and line cursor for insert modes. Also highlight current line
vim.opt.guicursor = "n-v-c:block"
vim.opt.guicursor = "i:ver50"
vim.o.cursorline = true


-- Leader key to space
vim.g.mapleader = " "

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
vim.opt.updatetime = 300

-- Terminal configuration
vim.cmd([[
let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=
]])

-- Enable esc to go out of terminal mode
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
