local ts_configs = require 'nvim-treesitter.configs'
ts_configs.setup {
  ensure_installed = 'all',
  highlight = {
      additional_vim_regex_highlighting = true,
      enable = true,
      use_languagetree = true
    },
  indent = { enable = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  refactor = {
    smart_rename = { enable = true, keymaps = { smart_rename = ',r' } },
    highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['aC'] = '@class.outer',
        ['iC'] = '@class.inner',
        ['ac'] = '@conditional.outer',
        ['ic'] = '@conditional.inner',
        ['ae'] = '@block.outer',
        ['ie'] = '@block.inner',
        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',
        ['is'] = '@statement.inner',
        ['as'] = '@statement.outer',
        ['ad'] = '@comment.outer',
        ['am'] = '@call.outer',
        ['im'] = '@call.inner',
      },
    },
  },
}
