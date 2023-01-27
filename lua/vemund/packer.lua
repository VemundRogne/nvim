vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use 'ellisonleao/gruvbox.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim'} }
    }

    -- Radical. Convert between number bases
    use 'glts/vim-magnum'
    use 'glts/vim-radical'

    use 'tpope/vim-fugitive'

    -- File stuff
    use 'ThePrimeagen/harpoon'
    use 'natecraddock/workspaces.nvim'

    -- Keybindings
    use 'FeiyouG/command_center.nvim'
    use 'anuvyklack/hydra.nvim'

    -- LSPs and stuff
    use 'williamboman/mason.nvim'

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'

    -- Tasks
    use {
        'jedrzejboczar/toggletasks.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'akinsho/toggleterm.nvim',
            'nvim-telescope/telescope.nvim',
        }
    }

    use 'lervag/wiki.vim'
end)
