local dap = require('dap')

-- Configure dap for STM32 debugging
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = "C:\\dev\\tools\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
    options = {
        detached = false
    }
}

dap.configurations.c = {
    {
        name = 'Attach to openocd-gdbserver',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:3333',
        miDebuggerPath = 'C:\\dev\\tools\\arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi\\bin\\arm-none-eabi-gdb.exe',
        cwd = '${workspaceFolder}',
        program = "C:\\dev\\test\\Debug\\simple_stm32_testproject.elf",
        useExtendedRemote = true,
        stopAtEntry = true
    },
    {
        name = 'Launch file',
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true
    }
}

-- Configures dap for python
require('dap-python').setup('C:\\Python311\\python.exe')

-- Configure the UI
require('dapui').setup()
