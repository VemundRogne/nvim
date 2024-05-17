local dap = require('dap')

-- Configure dap for STM32 debugging
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = "/home/vemund/debug_adapter/extension/debugAdapters/bin/OpenDebugAD7",
    options = {
        detached = true
    }
}

dap.configurations.cpp = {
    {
        name = 'Attach to openocd-gdbserver',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        --miDebuggerServerAddress = '10.0.0.10:3333',
        -- miDebuggerServerAddress = '192.168.2.101:3333',
        miDebuggerServerAddress = "localhost:3333",
        miDebuggerPath = 'arm-none-eabi-gdb',
        cwd = '~',
        -- program = "/home/vemund/gridlevel/firmware/build/gridlevel.elf",
        -- program = "/home/vemund/FWCommons/test/stm32g4/build/stm32g4_test.elf",
        program = "/home/vemund/FWCommons/test/boards/nucleo_g031k8/build/test_board_nucleo_g031k8.elf",
        --program = "/home/vemund/FWCommons/test/stm32l4_rtos/build/test_stm32l4r5.elf",
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
if vim.loop.os_uname().sysname == 'Windows_NT' then
    require('dap-python').setup('C:\\Python311\\python.exe')
end

if vim.loop.os_uname().sysname == 'Linux' then
    require('dap-python').setup('python')
end

-- Configure the UI
require('dapui').setup()
