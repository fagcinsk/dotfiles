return {
    {
        'sainnhe/sonokai',
        init = function()
            vim.cmd('colorscheme sonokai')
        end
    },
    { 'chr4/nginx.vim',     ft = 'nginx' },
    { 'nelsyeung/twig.vim', ft = 'twig' },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'folke/neodev.nvim',
            'j-hui/fidget.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('plugins.config.nvim-lspconfig')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'plugins.config.treesitter'
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugins.config.nvim-cmp')
            require('plugins.config.snippets')
        end,
        dependencies = {
            'onsails/lspkind-nvim',
            'ray-x/lsp_signature.nvim',
            'honza/vim-snippets',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('plugins.config.null-ls')
        end
    },
    {
        'ibhagwan/fzf-lua',
        config = require('plugins.config.fzf-lua'),
        cmd = 'FzfLua'
    },

    -- Editing
    'tpope/vim-repeat',
    'wellle/targets.vim',
    'machakann/vim-sandwich',
    {
        'windwp/nvim-autopairs',
        dependencies = 'nvim-cmp',
        config = function()
            require('plugins.config.nvim-autopairs')
        end
    },
    { 'mattn/emmet-vim',  ft = { 'html', 'css', 'htmldjango', 'twig', 'php' } },
    { 'sbdchd/neoformat', cmd = 'Neoformat' },
    {
        'numToStr/Comment.nvim',
        config = function() require('plugins.config.comment') end,
    },

    -- Utils
    'gpanders/editorconfig.nvim',
    { 'vifm/vifm.vim',           cmd = 'Vifm' },
    { 'rhysd/git-messenger.vim', cmd = { 'GitMessenger', 'GitMessengerClose' } },
    { 'mhinz/vim-grepper',       cmd = { 'Grepper', 'GrepperGit', 'GrepperGrep', 'GrepperRg' } },
    { 'Olical/vim-enmasse',      cmd = 'EnMasse' },
    {
        'mbbill/undotree',
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
        cmd = 'UndotreeToggle',
    },
    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = {},
    },

    -- UI
    {
        'NvChad/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'php', 'html' },
        config = require('plugins.config.colorizer')
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        cmd = { 'NeoTreeShow', 'NeoTreeShowToggle', 'NeoTreeReveal', 'NeoTreeRevealToggle' }
    },
    {
        'stevearc/aerial.nvim',
        config = {},
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        cmd = { 'AerialToggle' }
    },
}
