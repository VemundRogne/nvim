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
if vim.loop.os_uname().sysname == 'Windows_NT' then
    vim.cmd([[
    let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
    let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote= shellxquote=
    ]])
end

-- Enable esc to go out of terminal mode
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.opt.swapfile = false
vim.opt.backup = false

-- Don't configure undodir for windows...
-- I am sure there is a way to do it, but I havent looked into it:)
if vim.loop.os_uname().sysname ~= 'Windows_NT' then
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.signcolumn = 'yes'

-- wiki.vim config
vim.cmd("let g:wiki_mappings_use_defaults = 'none'")
vim.cmd("let g:wiki_filetypes = ['md', 'py', 'tex', 'pdf']")
vim.cmd("let g:wiki_link_extension = ''")
vim.cmd("let g:wiki_link_toggle_on_follow = 0")

vim.cmd("let g:markdown_fenced_languages = ['python']")

if vim.loop.os_uname().sysname == 'Windows_NT' then
    -- This isn't perfect, but it _kinda_ works
    vim.cmd("autocmd BufEnter *.pdf !Start-Process C:\\Users\\8491d\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe %")
end

if vim.loop.os_uname().sysname == 'Linux' then
    -- This is perfect:)
    -- One possible improvement is to close the buffer or something, for now the buffer opens and shows the binary pdf file
    vim.cmd("autocmd BufEnter *.pdf :silent !zathura % & disown")
end
