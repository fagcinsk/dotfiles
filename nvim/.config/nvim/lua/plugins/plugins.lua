local packer = require('packer')
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})
return packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    -- Syntax hl
    use { 'chr4/nginx.vim', ft = 'nginx' }
    use { 'nelsyeung/twig.vim', ft = 'twig' }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = [[require('plugins.config.treesitter')]],
        requires = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    }

    -- Completion
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'honza/vim-snippets'

    use {
        'hrsh7th/nvim-cmp',
        config = [[
        require('plugins.config.nvim-cmp')
        require('plugins.config.snippets')
        ]],
        requires = {
            { 'L3MON4D3/LuaSnip' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-calc' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
        },
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        {
            'williamboman/nvim-lsp-installer',
            config = [[require('plugins.config.nvim-lspconfig')]],
        }
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = [[require('plugins.config.null-ls')]]
    }

    use {
        'windwp/nvim-autopairs',
        after = 'nvim-cmp',
        config = [[require('plugins.config.nvim-autopairs')]],
    }

    -- Editing
    use "tpope/vim-repeat"
    use {
        'ur4ltz/surround.nvim',
        config = [[require "surround".setup {mappings_style = "surround", map_insert_mode = false}]]
    }
    use 'wellle/targets.vim'
    use 'ggandor/lightspeed.nvim'
    use { 'mattn/emmet-vim', ft = { 'html', 'css', 'htmldjango', 'twig', 'php' } }
    use { 'AndrewRadev/splitjoin.vim', cmd = { 'SplitjoinJoin', 'SplitjoinSplit' }, keys = { 'gS', 'gJ' } } -- gS, gJ
    use { 'AndrewRadev/sideways.vim', cmd = { 'SidewaysLeft', 'SidewaysRight' } }
    use { 'sbdchd/neoformat', cmd = 'Neoformat' }
    use { 'godlygeek/tabular', cmd = 'Tabularize' }
    use { 'andymass/vim-matchup', event = 'VimEnter' }
    use { 'numToStr/Comment.nvim', config = [[require('plugins.config.comment')]] }

    -- Utils
    use 'gpanders/editorconfig.nvim'
    use { 'vifm/vifm.vim', cmd = 'Vifm' }
    use { 'gennaro-tedesco/nvim-peekup', keys = [[""]] } -- show registers with mapping: ""
    use { 'rhysd/git-messenger.vim', cmd = { 'GitMessenger', 'GitMessengerClose' } }
    use { 'mhinz/vim-grepper', cmd = { 'Grepper', 'GrepperGit', 'GrepperGrep', 'GrepperRg' } }
    use { 'Olical/vim-enmasse', cmd = 'EnMasse' }
    use { 'ibhagwan/fzf-lua', config = [[require('plugins.config.fzf-lua')]] }
    use { 'monaqa/dial.nvim', config = [[require('plugins.config.dial')]] }
    use {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    }
    use {
        -- "folke/trouble.nvim",
        "bellini666/trouble.nvim", -- resolves error on go to definition
        commit = "4d031d09814dc83cb5b75b84b84944b93c0bcdcb",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require("trouble").setup()]]
    }
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    -- UI
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'arkav/lualine-lsp-progress' },
        config = [[require('plugins.config.lualine')]]
    }
    use {
        'crivotz/nvim-colorizer.lua',
        ft = { 'css', 'javascript', 'php', 'html' },
        config = [[require('plugins.config.colorizer')]]
    }

    -- colorschemes
    use 'mhartington/oceanic-next'


    -- TEST ZONE
    use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup { numhl = true, signcolumn = false }
        end,
    })

    if packer_bootstrap then
        packer.sync()
    end
end)
