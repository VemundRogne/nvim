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
    use 'tpope/vim-markdown'

    -- File stuff
    use 'ThePrimeagen/harpoon'
    use 'natecraddock/workspaces.nvim'

    -- Keybindings
    use 'FeiyouG/command_center.nvim'
    use 'anuvyklack/hydra.nvim'

    -- LSPs and stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
-- Disable completion based on text in buffer, at least for now
--            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use "airblade/vim-gitgutter"

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
    use 'lervag/vimtex'
    use 'folke/zen-mode.nvim'

    use 'numToStr/Comment.nvim'

    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use 'tikhomirov/vim-glsl'

    use 'RaafatTurki/hex.nvim'

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
